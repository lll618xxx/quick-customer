/**
 * 路由逻辑处理文件
 */
const express = require('express')
const goodAction = require('./action/good') 
const userAction = require('./action/user') 
const router = express.Router()

// 获取首页数据
router.get('/index', (req, res) => {		

	const p1 = goodAction.goodLists(req, 1, 5, {discountPrice: 'asc'})   // 折扣商品
	const p2 = goodAction.goodLists(req, 1, 5, {newComerPrice: 'asc'})   // 新人商品
	const p3 = goodAction.goodLists(req, 1, 6, {id: 'asc'}, 1)   // 水果分类商品
	const p4 = goodAction.goodLists(req, 1, 6, {id: 'asc'}, 2)   // 蔬菜分类商品
	const p5 = goodAction.goodLists(req, 1, 6, {id: 'asc'}, 4)   // 海鲜分类商品
				
	Promise.all([p1, p2, p3, p4, p5])
	.then(pres => {
		res.send({
			code: '1', 
			data: {
				discountList: pres[0],
				newComerList: pres[1],
				fruitList: pres[2],
				vegetableList: pres[3],
				seafoodList: pres[4],
			}
		}) 
	})
})

// 查询商品所有数据
router.get('/good/lists', (req, res) => {
	goodAction.goodLists(req).then(result => {
		res.send({code: '1', data: result})
	})
})

// 查询单条商品的数据
router.get('/good/detail', (req, res) => {
	goodAction.goodDetail(req).then(result => {
		res.send({code: '1', data: result})
	})
})

// 用户注册
router.post('/user/register', (req, res) => {
	userAction.userRegister(req).then(result => {
		res.send(result)
	})
})	

// 用户登录
router.post('/user/login', (req, res) => {
	userAction.userLogin(req).then(result => {
		res.send(result)
	})
})

// 对于没有的匹配的页面进行处理，相对于404
router.use((req, res) => {
	res.send("404")
})

module.exports = router
