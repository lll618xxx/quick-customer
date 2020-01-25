/**
 * 用户模型
 */
const Sequelize = require('sequelize')
const config = require('../config')

 // 定义用户模型
const UsersModel = config.define('skyx_users', {
	id: {
		type: Sequelize.INTEGER,
		primaryKey: true,            // 主键
		autoIncrement: true,         // 自动递增
	},
	userAccount: Sequelize.STRING,
	password: Sequelize.INTEGER,
	phone: Sequelize.STRING,
	email: Sequelize.STRING,
	createTime: Sequelize.STRING,
	}, {
	timestamps: false,
	underscored:false   // 驼峰转下划线
})

module.exports = UsersModel