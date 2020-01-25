const Fly = require("flyio/dist/npm/wx") ;
const fly = new Fly;
import path from './PathConfig';

//响应时间
fly.config.timeout = 20000; 
 
//配置接口地址
fly.config.baseURL = path.basePath;   

//添加请求拦截器
fly.interceptors.request.use((config,promise)=>{

  return config;

  //终止请求
  //var err=new Error("xxx")
  //err.request=request
  //return Promise.reject(new Error(""))

  //可以显式返回request, 也可以不返回，没有返回值时拦截器中默认返回request
  
})

//添加响应拦截器，响应拦截器会在then/catch处理之前执行
fly.interceptors.response.use(
    (response) => {
		
      //只将请求结果的data字段返回
      return response.data
    },
    (err) => {
			uni.showModal({ title: '提示', content: `${err.message}`, showCancel: false })
      //发生网络错误后会走到这里
      //return Promise.resolve("ssss")
    }
)

export default fly