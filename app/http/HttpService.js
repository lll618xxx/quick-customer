import ServerBase from './ServerBase'

class HttpService extends ServerBase{
	constructor(){
		super()
		this.$$path = {
			indexLists: '/index',
			goodLists: '/good/lists',
			goodDetail: '/good/detail',
			userRegister: '/user/register',
			userLogin: '/user/login'
		} 	
	}
	
	getIndexLists(params, data){return this.getRequest(this.$$path.indexLists, params, data)}
	getGoodLists(params, data){return this.getRequest(this.$$path.goodLists, params, data)}
	getGoodDetail(params, data){return this.getRequest(this.$$path.goodDetail, params, data)}
	userRegister(params, data){return this.postRequest(this.$$path.userRegister, params, data)}
	userLogin(params, data){return this.postRequest(this.$$path.userLogin, params, data)}
}

const $HttpService = new HttpService;

export default $HttpService