import Vue from 'vue'
import Router from 'uni-simple-router'
import routes from './config'

Vue.use(Router)

const router = new Router({
	loading: false,  
	routes: routes
})

/**
 * router.pushTab 解决H5传参问题
 * @param {String} routerName
 * @param {JSON} 
 */
router.__proto__.setH5Params = (name, param) => {
	for (let value of router.routers.routes) {
		if (value.name === name) {
			value.H5Params = param
			break
		}
	}
}

// 全局路由守卫
router.beforeEach((to ,from ,next) => {
	next()
})

export default router