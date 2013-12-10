db  = require("../models")

exports.certan = (req, res) ->
  id = req.params.id
  db.AttachedFiles.find({ where: { 'id': id } }).success (attachment) ->
    res.json attachment

exports.list = (req, res) ->
  query = req.query
  page  = query.page - 1 || 0
  limit = query.limit || 25
  limit = parseInt limit, 10
  page  = parseInt page, 10
  from  = page * limit
  db.AttachedFiles.findAndCountAll().success (attachments) ->
    result = 
      meta:
        page:  page + 1
        limit: limit
        count: attachments.count
        num_pages: Math.ceil attachments.count / limit
      content: attachments.rows
    res.json result
  .error ->
    res.json []