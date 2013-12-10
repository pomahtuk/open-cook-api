db  = require("../models")

exports.certan = (req, res) ->
  id = req.params.id
  db.Hubs.find({ where: { 'id': id }, include: [db.Users] }).success (hub) ->
    result = 
      hub:      hub
      comments: []
    hub.show_count += 1
    hub.save()
    db.Comments.findAll({ where: { commentable_type: hub.item_key, commentable_id: hub.id } }).success (comments) ->
      result.comments = comments
      res.json result


exports.list = (req, res) ->
  query = req.query
  page  = query.page - 1 || 0
  limit = query.limit || 25
  limit = parseInt limit, 10
  page  = parseInt page, 10
  from  = page * limit
  db.Hubs.findAndCountAll({where: { state: 'published' }, offset: from, limit: limit, attributes: ['id', 'title', 'intro', 'inline_tags', 'main_image_file_name', 'show_count', 'updated_at', 'draft_comments_count', 'published_comments_count', 'deleted_comments_count' ] }).success (hubs) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: hubs.count
        num_pages: Math.ceil hubs.count / limit
      content: hubs.rows
    res.json result