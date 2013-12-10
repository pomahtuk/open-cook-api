db  = require("../models")

exports.index = (req, res) ->
  db.Pages.find(include: [db.Hubs, db.Users]).success (page) ->
    result = 
      page:     page
      comments: []
    db.Comments.findAll({ where: {commentable_type: page.item_key, commentable_id: page.id } }).success (comments) ->
      result.comments = comments
      res.json result