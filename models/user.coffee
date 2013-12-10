module.exports = (sequelize, DataTypes) ->
  Users = sequelize.define "Users",
    username:                         DataTypes.STRING
    login:                            DataTypes.STRING
    username:                         DataTypes.STRING
    email:                            DataTypes.STRING
    open_password:                    DataTypes.STRING
    crypted_password:                 DataTypes.STRING
    salt:                             DataTypes.STRING
    role_id:                          DataTypes.INTEGER
    show_count:                       { type: DataTypes.INTEGER, defaultValue: 0 }
    state:                            { type: DataTypes.STRING, defaultValue: "active" }
    hubs_count:                       { type: DataTypes.INTEGER, defaultValue: 0 }
    posts_count:                      { type: DataTypes.INTEGER, defaultValue: 0 }
    remember_me_token:                DataTypes.STRING
    remember_me_token_expires_at:     DataTypes.DATE
    reset_password_token:             DataTypes.STRING
    reset_password_token_expires_at:  DataTypes.DATE
    reset_password_email_sent_at:     DataTypes.DATE
    all_attached_files_count:         { type: DataTypes.INTEGER, defaultValue: 0 }
    all_attached_files_size:          { type: DataTypes.INTEGER, defaultValue: 0 }
    storage_files_count:              { type: DataTypes.INTEGER, defaultValue: 0 }
    storage_files_size:               { type: DataTypes.INTEGER, defaultValue: 0 }
    my_draft_comments_count:          { type: DataTypes.INTEGER, defaultValue: 0 }
    my_published_comments_count:      { type: DataTypes.INTEGER, defaultValue: 0 }
    my_comments_count:                { type: DataTypes.INTEGER, defaultValue: 0 }
    draft_comcoms_count:              { type: DataTypes.INTEGER, defaultValue: 0 }
    published_comcoms_count:          { type: DataTypes.INTEGER, defaultValue: 0 }
    deleted_comcoms_count:            { type: DataTypes.INTEGER, defaultValue: 0 }
    spam_comcoms_count:               { type: DataTypes.INTEGER, defaultValue: 0 }
    draft_comments_count:             { type: DataTypes.INTEGER, defaultValue: 0 }
    published_comments_count:         { type: DataTypes.INTEGER, defaultValue: 0 }
    deleted_comments_count:           { type: DataTypes.INTEGER, defaultValue: 0 }
  ,
    freezeTableName: true
    tableName: 'users'
    underscored: true
    associate: (models) ->
      Users.hasMany(models.AttachedFiles)
      Users.hasMany(models.Pages)
      Users.hasMany(models.Posts)
      Users.hasMany(models.Hubs)
      Users.hasMany(models.Comments)

  Users

  # create_table "users", force: true do |t|
  #   t.string   "login",                                              null: false
  #   t.string   "username"
  #   t.string   "email"
  #   t.string   "open_password"
  #   t.string   "crypted_password"
  #   t.string   "salt"
  #   t.integer  "role_id"
  #   t.integer  "show_count",                      default: 0
  #   t.string   "state",                           default: "active"
  #   t.integer  "hubs_count",                      default: 0
  #   t.integer  "posts_count",                     default: 0
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.string   "remember_me_token"
  #   t.datetime "remember_me_token_expires_at"
  #   t.string   "reset_password_token"
  #   t.datetime "reset_password_token_expires_at"
  #   t.datetime "reset_password_email_sent_at"
  #   t.integer  "all_attached_files_count",        default: 0
  #   t.integer  "all_attached_files_size",         default: 0
  #   t.integer  "storage_files_count",             default: 0
  #   t.integer  "storage_files_size",              default: 0
  #   t.integer  "my_draft_comments_count",         default: 0
  #   t.integer  "my_published_comments_count",     default: 0
  #   t.integer  "my_comments_count",               default: 0
  #   t.integer  "draft_comcoms_count",             default: 0
  #   t.integer  "published_comcoms_count",         default: 0
  #   t.integer  "deleted_comcoms_count",           default: 0
  #   t.integer  "spam_comcoms_count",              default: 0
  #   t.integer  "draft_comments_count",            default: 0
  #   t.integer  "published_comments_count",        default: 0
  #   t.integer  "deleted_comments_count",          default: 0
  # end