// const Sequelize = require('sequelize')
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const router = require('./router')
const port = 9999

// 配置body-parser后，req对象会多出一个属性body，通过req.body就可以获取表单的POST的数据

// parse x-www-forn-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

 // parse json
app.use(bodyParser.json()) 

// 设置跨域请求，要在use router 之前
app.all('*',function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*') 
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild')
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS')
    if (req.method == 'OPTIONS') {
        res.send(200) // 意思是，在正常的请求之前，会发送一个验证，是否可以请求。
    } else {
        next()
    }
})

app.use(router)

app.listen(port, () => {
  console.log(`项目运行在 ${port} 端口`)
})