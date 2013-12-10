db  = require("../models")

exports.certan = (req, res) ->
  id = req.params.id
  db.Pages.find({ where: { 'id': id }, include: [db.Hubs, db.Users] }).success (page) ->
    result = 
      page:     page
      comments: []
    page.show_count += 1
    page.save()
    db.Comments.findAll({ where: { commentable_type: page.item_key, commentable_id: page.id } }).success (comments) ->
      result.comments = comments
      res.json result


exports.list = (req, res) ->
  query = req.query
  page  = query.page - 1 || 0
  limit = query.limit || 25
  limit = parseInt limit, 10
  page  = parseInt page, 10
  from  = page * limit
  db.Pages.findAndCountAll({ where: { state: 'published' }, offset: from, limit: limit, attributes: ['id', 'title', 'intro', 'inline_tags', 'main_image_file_name', 'show_count', 'updated_at', 'draft_comments_count', 'published_comments_count', 'deleted_comments_count'] }).success (pages) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: pages.count
        num_pages: Math.ceil pages.count / limit
      content: pages.rows
    res.json result