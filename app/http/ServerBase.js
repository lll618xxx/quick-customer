import fly from './FlyConfig'

class ServerBase{
	constructor(){
      
	}

    getRequest(url='', params='', data=null){
        return fly.request(`${url}/${params}`, data, {
            method:"get",
			headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            }
        })
    }

    deleteRequest(url='',params=''){
       
    }

    postRequest(url='', params=null, data=''){
        return fly.request(`${url}`, params, {
            method:"post",
        })
    }

    putRequest(url='',data=''){
      
    }

}

export default ServerBase