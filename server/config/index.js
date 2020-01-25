const Sequelize = require('sequelize')

// 连接数据库
const sequelize = new Sequelize(
    'skyx',  // 数据库名
    'root',  // 用户名
    'yourPassWord',  // 用户密码
    {
        host: 'localhost', // 数据库服务器ip
        dialect: 'mysql',  // 这里可以改成任意一种关系型数据库
        'port': 3306,      // 数据库服务器端口
        'define': {
            // 字段以下划线（_）来分割（默认是驼峰命名风格）
            'underscored': true
        }
    }
)

// 测试连接是否成功
sequelize
    .authenticate()
    .then(() => {
        console.log('Connection has been established successfully.')
    })
    .catch(err => {
        console.log('Unable to connect to the database', err)
    })

module.exports = sequelize