const md5 = require('md5')
const UsersModel = require('../../model/users')

const salt = 'md5Salt' // MD5加盐 

// 用户注册
function userRegister(req) {
	return new Promise((resolve, reject) => {
		UsersModel.findOne({where : {userAccount: req.body.userAccount}}).then(result => {
			if (result) {
				resolve({code: 2, message: '该用户名已被注册'})
			} else {
				const params = {
					userAccount: req.body.userAccount,
					password: md5(req.body.password+salt),
					createTime: new Date().getTime()
				}
				UsersModel.create(params).then(suc => {
					if (suc) {
						resolve({code: 1, message: '注册成功'})
					} else {
						resolve({code: 3, message: '注册失败，请重试'})
					}
				})
			}
		})
	})
}

// 用户登录
function userLogin(req) {
	return new Promise((resolve, reject) => {
		UsersModel.findOne({where : {userAccount: req.body.userAccount}}).then(result => {
			if (result) {
				if (result.password === md5(req.body.password+salt)) {
					resolve({code: 1, message: '登录成功', data: {time : result.createTime}})
				} 
			}
			resolve({code: 2, message: '账号或密码错误，请重新登录'})
		})
	})
}

module.exports = {
	userRegister,
	userLogin
}