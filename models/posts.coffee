module.exports = (sequelize, DataTypes) ->
  Posts = sequelize.define "Posts",
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
    tableName: 'posts'
    underscored: true
    instanceMethods:
      item_key: 'Post'
    associate: (models) ->
      # Posts.hasMany(models.Comments, {foreignKey:{ "commentable_id": "id", "item": "commentable_type" })

      Posts.belongsTo(models.Hubs)
      Posts.belongsTo(models.Users)

  Posts