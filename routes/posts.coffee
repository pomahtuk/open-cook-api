db  = require("../models")

exports.certan = (req, res) ->
  id = req.params.id
  db.Posts.find({ where: { 'id': id }, include: [db.Hubs, db.Users] }).success (post) ->
    result = 
      post:     post
      # /system/storages/post/120/main_image/preview/4b7fafef00a07078d54f4f5f0a7358c6.jpg
      # /system/storages/post/120/base/album-1-slide-1385534336.jpg - attached files
      # original, preview, base
      image:    if post.main_image_file_name
        "/system/storages/#{post.item_key.toLowerCase()}/#{post.id}/main_image/original/#{post.main_image_file_name}" 
      else
        "/system/storages/#{post.item_key.toLowerCase()}/#{post.id}/main_image/original/#{post.main_image_file_name}" # should be blank image
      comments: []
    # post.show_count += 1
    # post.save()
    db.Comments.findAll({ where: { commentable_type: post.item_key, commentable_id: post.id } }).success (comments) ->
      result.comments = comments
      res.json result


exports.list = (req, res) ->
  query     = req.query
  page      = query.page - 1 || 0
  limit     = query.limit || 25
  order     = query.order || 'DESC'
  order = "DESC" if order isnt "ASC" and order isnt "DESC"
  callback  = query.callback || ""
  limit     = parseInt limit, 10
  page      = parseInt page, 10
  from      = page * limit
  # ,  attributes: ['id', 'title', 'intro', 'inline_tags', 'main_image_file_name', 'show_count', 'updated_at', 'draft_comments_count', 'published_comments_count', 'deleted_comments_count']
  db.Posts.findAndCountAll({where: { state: 'published' }, order: "created_at #{order}", offset: from, limit: limit,  attributes: ['id', 'title', 'intro', 'inline_tags', 'main_image_file_name', 'show_count', 'updated_at', 'draft_comments_count', 'published_comments_count', 'deleted_comments_count'] }).success (posts) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: posts.count
        num_pages: Math.ceil posts.count / limit
      content: posts.rows
    if callback
      res.send "#{callback}(#{JSON.stringify(result)});"
    else
      res.json result
  .error ->
    if callback
      res.send "#{callback}([]);"
    else
      res.json []