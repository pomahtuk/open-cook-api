db  = require("../models")

exports.certan = (req, res) ->
  id = req.params.id
  db.Posts.find({ where: { 'id': id }, include: [db.Hubs, db.Users] }).success (post) ->
    result = 
      post:     post
      comments: []
    post.show_count += 1
    post.save()
    db.Comments.findAll({ where: { commentable_type: post.item_key, commentable_id: post.id } }).success (comments) ->
      result.comments = comments
      res.json result


exports.list = (req, res) ->
  query = req.query
  page  = query.page - 1 || 0
  limit = query.limit || 25
  limit = parseInt limit, 10
  page  = parseInt page, 10
  from  = page * limit
  # ,  attributes: ['id', 'title', 'intro', 'inline_tags', 'main_image_file_name', 'show_count', 'updated_at', 'draft_comments_count', 'published_comments_count', 'deleted_comments_count']
  db.Posts.findAndCountAll({where: { state: 'published' }, offset: from, limit: limit }).success (posts) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: posts.count
        num_pages: Math.ceil posts.count / limit
      content: posts.rows
    res.json result
  .error ->
    res.json []