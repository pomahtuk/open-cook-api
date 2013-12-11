db      = require("../models")

Object.defineProperty Array::, 'unique',
  value: ->
    a = []
    l = @length
    i = 0

    while i < l
      j = i + 1

      while j < l
        
        # If this[i] is found later in the array
        j = ++i  if this[i] is this[j]
        j++
      a.push this[i]
      i++
    a
  enumerable: false

exports.certan = (req, res) ->
  query     = req.query
  type      = query.type || 'Post'
  id        = req.params.id
  tags      = id.split(',')
  db.Tags.findAll({ where: { 'name': tags } }).success (tags) ->
    tag_ids = []
    tag_ids.push tag.id for tag in tags

    db.Taggings.findAll( { where: { 'id': [tag_ids] } } ).success (taggings)->
      ids = []
      for tagging in taggings
        ids.push tagging.taggable_id if tagging.taggable_type
      ids = ids.unique()

      db["#{type}s"].findAll( { where: { 'id': [ids] } } ).success (results)->
        res.json results
      .error ->
        res.json []
    .error ->
      res.json []
  .error ->
    res.json []

exports.list = (req, res) ->
  query     = req.query
  page      = query.page - 1 || 0
  limit     = query.limit || 25
  callback  = query.callback || ""
  limit     = parseInt limit, 10
  page      = parseInt page, 10
  from      = page * limit
  db.Tags.findAndCountAll(offset: from, limit: limit).success (tags) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: tags.count
        num_pages: Math.ceil tags.count / limit
      content: tags.rows
    if callback
      res.send "#{callback}(#{JSON.stringify(result)});"
    else
      res.json result
  .error ->
    if callback
      res.send "#{callback}([]);"
    else
      res.json []