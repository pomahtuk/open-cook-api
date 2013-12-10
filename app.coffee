###
Module dependencies.
###
express               = require("express")
routes                = require("./routes")
controllers           = {}
controllers.pages     = require("./routes/pages")
controllers.posts     = require("./routes/posts")
controllers.hubs      = require("./routes/hubs")
controllers.attached  = require("./routes/attached")
http                  = require("http")
path                  = require("path")
db                    = require('./models')


app = express()

# all environments
app.set "port", process.env.PORT or 3010
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

app.get "/", routes.index

app.get "/:controller/:id", (req, res) ->
  controller = req.params.controller
  action = controllers[controller]
  if action
    controllers[controller].certan(req, res)
  else
    res.send 'unmplemented controller'

app.get "/:controller", (req, res) ->
  controller = req.params.controller
  action = controllers[controller]
  if action
    controllers[controller].list(req, res)
  else
    res.send 'unmplemented controller'

db.sequelize
  .sync()
  .complete (err) ->
    if err
      throw err
    else
      http.createServer(app).listen app.get("port"), ->
        console.log "Express server listening on port " + app.get("port")