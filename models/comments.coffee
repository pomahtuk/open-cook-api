module.exports = (sequelize, DataTypes) ->
  Comments = sequelize.define "Comments",
    holder_id:          DataTypes.INTEGER
    commentable_id:     DataTypes.INTEGER
    commentable_type:   DataTypes.STRING
    commentable_url:    DataTypes.STRING
    commentable_title:  DataTypes.STRING
    commentable_state:  DataTypes.STRING
    anchor:             DataTypes.STRING
    title:              DataTypes.STRING
    contacts:           DataTypes.STRING
    raw_content:        DataTypes.TEXT
    content:            DataTypes.TEXT
    view_token:         DataTypes.STRING
    state:              DataTypes.STRING
    ip:                 DataTypes.STRING
    referer:            DataTypes.STRING
    user_agent:         DataTypes.STRING
    tolerance_time:     DataTypes.INTEGER
    spam:               DataTypes.BOOLEAN
    parent_id:          DataTypes.INTEGER
    lft:                DataTypes.INTEGER
    rgt:                DataTypes.INTEGER
    depth:              DataTypes.INTEGER
  ,
    freezeTableName: true
    tableName: 'comments'
    underscored: true
    # t.integer  "user_id"
    # t.integer  "holder_id"
    # t.integer  "commentable_id"
    # t.string   "commentable_type"
    # t.string   "commentable_url"
    # t.string   "commentable_title"
    # t.string   "commentable_state"
    # t.string   "anchor"
    # t.string   "title"
    # t.string   "contacts"
    # t.text     "raw_content"
    # t.text     "content"
    # t.string   "view_token"
    # t.string   "state",             default: "draft"
    # t.string   "ip",                default: "undefined"
    # t.string   "referer",           default: "undefined"
    # t.string   "user_agent",        default: "undefined"
    # t.integer  "tolerance_time"
    # t.boolean  "spam",              default: false
    # t.integer  "parent_id"
    # t.integer  "lft"
    # t.integer  "rgt"
    # t.integer  "depth",             default: 0
    # t.datetime "created_at"
    # t.datetime "updated_at"
  Comments