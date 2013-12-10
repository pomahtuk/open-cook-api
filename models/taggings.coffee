module.exports = (sequelize, DataTypes) ->
  Taggings = sequelize.define "Taggings",
    taggable_id:    DataTypes.INTEGER
    taggable_type:  DataTypes.STRING
    tagger_id:      DataTypes.INTEGER
    tagger_type:    DataTypes.STRING
    context:        DataTypes.STRING
  ,
    freezeTableName: true
    tableName: 'taggings'
    underscored: true
    associate: (models) ->
      Taggings.hasMany(models.Tags)
  # create_table "taggings", force: true do |t|
  #   t.integer  "tag_id"
  #   t.integer  "taggable_id"
  #   t.string   "taggable_type"
  #   t.integer  "tagger_id"
  #   t.string   "tagger_type"
  #   t.string   "context",       limit: 128
  #   t.datetime "created_at"
  # end
  Taggings