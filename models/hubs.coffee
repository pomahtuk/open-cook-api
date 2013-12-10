module.exports = (sequelize, DataTypes) ->
  Hubs = sequelize.define "Hubs",
    author:                     DataTypes.STRING
    keywords:                   DataTypes.STRING
    description:                DataTypes.STRING
    copyright:                  DataTypes.STRING
    title:                      DataTypes.STRING
    raw_intro:                  DataTypes.TEXT
    intro:                      DataTypes.TEXT
    raw_content:                DataTypes.TEXT
    content:                    DataTypes.TEXT
    hub_state:                  { type: DataTypes.STRING, defaultValue: "draft" }
    inline_tags:                DataTypes.STRING
    legacy_url:                 DataTypes.STRING
    published_at:               DataTypes.DATE
    pubs_type:                  { type: DataTypes.STRING, defaultValue: "posts" }
    optgroup:                   { type: DataTypes.BOOLEAN, defaultValue: false }
    pubs_draft_count:           { type: DataTypes.INTEGER, defaultValue: 0 }
    pubs_published_count:       { type: DataTypes.INTEGER, defaultValue: 0 }
    pubs_deleted_count:         { type: DataTypes.INTEGER, defaultValue: 0 }
    parent_id:                  DataTypes.INTEGER
    lft:                        DataTypes.INTEGER
    rgt:                        DataTypes.INTEGER
    depth:                      { type: DataTypes.INTEGER, defaultValue: 0 }
    main_image_file_name:       DataTypes.STRING
    main_image_content_type:    DataTypes.STRING
    main_image_file_size:       { type: DataTypes.INTEGER, defaultValue: 0 }
    main_image_updated_at:      DataTypes.DATE
    show_count:                 { type: DataTypes.INTEGER, defaultValue: 0 }
    state:                      { type: DataTypes.STRING, defaultValue: "draft" }
    moderation_state:           { type: DataTypes.STRING, defaultValue: "raw" }
    moderator_note:             DataTypes.TEXT
    slug:                       DataTypes.STRING
    short_id:                   DataTypes.STRING
    friendly_id:                DataTypes.STRING
    storage_files_count:        { type: DataTypes.INTEGER, defaultValue: 0 }
    storage_files_size:         { type: DataTypes.INTEGER, defaultValue: 0 }
    draft_comments_count:       { type: DataTypes.INTEGER, defaultValue: 0 }
    published_comments_count:   { type: DataTypes.INTEGER, defaultValue: 0 }
    deleted_comments_count:     { type: DataTypes.INTEGER, defaultValue: 0 }
  ,
    freezeTableName: true
    tableName: 'hubs'
    underscored: true
    instanceMethods:
      item_key: 'Hub'
    associate: (models) ->
      # Hubs.hasMany(models.Comments, { foreignKey: { "commentable_id": "id", "commentable_type": "item_key" } )

      Hubs.hasMany(models.Pages)
      Hubs.hasMany(models.Posts)
      # Hubs.hasMany(models.Hubs)

      Hubs.belongsTo(models.Hubs)
      Hubs.belongsTo(models.Users)
    # t.integer  "user_id"
    # t.integer  "hub_id"
    # t.string   "author"
    # t.string   "keywords"
    # t.string   "description"
    # t.string   "copyright"
    # t.string   "title"
    # t.text     "raw_intro"
    # t.text     "intro"
    # t.text     "raw_content"
    # t.text     "content"
    # t.string   "hub_state",                default: "draft"
    # t.string   "inline_tags"
    # t.string   "legacy_url"
    # t.datetime "published_at"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "pubs_type",                default: "posts"
    # t.boolean  "optgroup",                 default: false
    # t.integer  "pubs_draft_count",         default: 0
    # t.integer  "pubs_published_count",     default: 0
    # t.integer  "pubs_deleted_count",       default: 0
    # t.integer  "parent_id"
    # t.integer  "lft"
    # t.integer  "rgt"
    # t.integer  "depth",                    default: 0
    # t.string   "main_image_file_name"
    # t.string   "main_image_content_type"
    # t.integer  "main_image_file_size",     default: 0
    # t.datetime "main_image_updated_at"
    # t.integer  "show_count",               default: 0
    # t.string   "state",                    default: "draft"
    # t.string   "moderation_state",         default: "raw"
    # t.text     "moderator_note"
    # t.string   "slug"
    # t.string   "short_id"
    # t.string   "friendly_id"
    # t.integer  "storage_files_count",      default: 0
    # t.integer  "storage_files_size",       default: 0
    # t.integer  "draft_comments_count",     default: 0
    # t.integer  "published_comments_count", default: 0
    # t.integer  "deleted_comments_count",   default: 0
  Hubs