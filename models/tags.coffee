module.exports = (sequelize, DataTypes) ->
  Tags = sequelize.define "Tags",
    name:  DataTypes.STRING
  ,
    freezeTableName: true
    tableName: 'tags'
    underscored: true
    instanceMethods:
      item_key: 'Tag'
    associate: (models) ->
      Tags.belongsTo(models.Taggings)
  Tags