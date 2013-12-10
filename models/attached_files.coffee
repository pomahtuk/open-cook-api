module.exports = (sequelize, DataTypes) ->
  AttachedFiles = sequelize.define "AttachedFiles",
    username:                 DataTypes.STRING
    storage_id:               DataTypes.INTEGER
    storage_type:             DataTypes.STRING
    attachment_file_name:     DataTypes.STRING
    attachment_content_type:  DataTypes.STRING
    attachment_file_size:     DataTypes.INTEGER
    attachment_updated_at:    DataTypes.DATE
    processing:               DataTypes.STRING
    watermark:                DataTypes.BOOLEAN
    watermark_text:           DataTypes.STRING
    parent_id:                DataTypes.INTEGER
    lft:                      DataTypes.INTEGER
    rgt:                      DataTypes.INTEGER
    depth:                    DataTypes.INTEGER
  ,
    freezeTableName: true
    tableName: 'attached_files'
    underscored: true
    # t.integer  "user_id"
    # t.integer  "storage_id"
    # t.string   "storage_type"
    # t.string   "attachment_file_name"
    # t.string   "attachment_content_type"
    # t.integer  "attachment_file_size",    default: 0
    # t.datetime "attachment_updated_at"
    # t.string   "processing",              default: "none"
    # t.boolean  "watermark",               default: false
    # t.string   "watermark_text",          default: ""
    # t.integer  "parent_id"
    # t.integer  "lft"
    # t.integer  "rgt"
    # t.integer  "depth",                   default: 0
    # t.datetime "created_at"
    # t.datetime "updated_at"

  AttachedFiles