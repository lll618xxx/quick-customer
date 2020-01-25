const GoodsModel = require('../../model/goods')

// 商品列表
function goodLists (req, page=1, limit=10, order={}, category) {
	const pages = parseInt(req.query.page) || page // 可Number可String
	const limits = parseInt(req.query.limit) || limit// 注意一定要为Number
	
	// 选择条件
	const condition = { 
		offset: (pages-1)*limits, 
		limit: limits,
	}
	
	// 如果有第三个参数并且不是分类 即排序
	if (Object.keys(req.query).length >= 3 && Object.keys(req.query)[2] !== 'category' ) {
		condition.order = [[`${Object.keys(req.query)[2]}`, `${Object.values(req.query)[2]}`]]
	} else if (JSON.stringify(order) !== '{}') {
		condition.order = [[Object.keys(order)[0], Object.values(order)[0]]]
	}
	
	if (req.query.category || category) {
		condition.where = {category: category || Object.values(req.query.category)}
	}
	
	return GoodsModel.findAll(condition)
}

// 商品详情
function goodDetail(req) {
	
	const key = Object.keys(req.query)[0]
	const value = Object.values(req.query)[0]
	
	// 选择条件
	const condition = {}
		
	condition[key] = value
	
	return GoodsModel.findOne({where: condition})
}

module.exports = {
	goodLists,
	goodDetail
}