/**
 * 商品模型
 */
const Sequelize = require('sequelize')
const config = require('../config')

 // 定义商品模型
const GoodsModel = config.define('skyx_goods', {
	id: {
		type: Sequelize.INTEGER,
		primaryKey: true,            // 主键
		autoIncrement: true,         // 自动递增
	},
	name: Sequelize.STRING,
	category: Sequelize.INTEGER,
	shopDesc: Sequelize.STRING,
	marketPrice: Sequelize.FLOAT,
	discountPrice: Sequelize.FLOAT,
	newComerPrice: Sequelize.FLOAT,
	saleNum: Sequelize.INTEGER,
	stock: Sequelize.INTEGER,
	salesUnit: Sequelize.STRING,
	praiseNumber: Sequelize.INTEGER,
	recommend: Sequelize.INTEGER,
	coverImage: Sequelize.STRING
	}, {
	timestamps: false,
	underscored:false   // 驼峰转下划线
})

// 更新数据
// GoodSModel.update(
//   {
//     saleNum: 2002
//   },
//   { 
//     where: {id: 4}
//   }
// ).then(res => {
//   console.log(res)
// })

module.exports = GoodsModel