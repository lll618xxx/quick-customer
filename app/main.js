import Vue from 'vue'
import App from './App'
import './router'
import Http from './http/HttpService'
import validate from './utils/ys-validate.js'

Vue.config.productionTip = false

Vue.prototype.$Http = Http
Vue.prototype.$validate = validate

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()
