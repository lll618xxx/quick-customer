<template>
	<view class="login">
		<view class="title">欢迎登录</view>
		<form class="form" @submit="formSubmit">
			<input type="text" name="userAccount" placeholder="请输入账号" />
			<input password name="password" type="text" placeholder="请输入密码" />
			<button class="submit-btn" formType="submit">登录</button>
		</form>
		<button class="back-btn" @click="toBack()">
			<text class="icon-houtui iconfont"></text>
		</button>
	</view>
</template>

<script>
	import {setStorageSync} from '../../utils/storage.js'
	export default {
		data() {
			return {
				loginRules: [
					{name: 'userAccount', type: 'required', errmsg: '请输入账号'},
					{name: 'password', type: 'required', errmsg: '请输入密码'},
				]
			}
		},
		methods: {
			formSubmit(e) {
				const reg = this.$validate.validate(e.detail.value, this.loginRules)
				if (!reg.isOk) {
					uni.showToast({
						icon: 'none',
						title: reg.errmsg,
						duration: 2500
					})
					return false
				}
				uni.showLoading({ title: '登录中', mask: true });
				this.$Http.userLogin(e.detail.value).then(res => {
					uni.hideLoading();
					if (res.code === 1) {
						setStorageSync('token', res.data.time) // 模拟token
						const time = 1500
						uni.showToast({
							icon: 'none',
							title: res.message,
							duration: time
						})
						setTimeout(() => {
							this.$Router.pushTab('/pages/mine/index')
						},time)
					} else {
						uni.showModal({ title: '提示', content: `${res.message}`, showCancel: false })
					}
				}).catch(err => {
					uni.hideLoading();
				})
			},
			toBack() {
				this.$Router.pushTab('/pages/mine/index')
			},
		}
	}
</script>

<style scoped>
	.login {
		height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		background-image: url(../../static/images/mine/bg.jpg);
		background-size: cover;
	}
	.title {
		font-size: 80rpx;
		margin-top: -120rpx;
		color: #FFFFFF;
	}
	.form {
		width: 600rpx;
		padding: 0 50rpx;
		margin-top: 100rpx;
		box-sizing: border-box;
		background-color: rgba(0, 0, 0, 0.5);
		border-radius: 20rpx;
	}
	.form input {
		border-bottom: 1px solid #67C23A;
		margin-top: 60rpx;
		color: #FFFFFF;
	}
	.submit-btn {
		width: 200rpx;
		height: 70rpx;
		line-height: 70rpx;
		margin: 70rpx auto 60rpx auto;
		color: #FFFFFF;
		background-color: #00BCD4;
		font-size: 36rpx;
	}
	.back-btn {
		position: fixed;
		top: 30rpx;
		left: 30rpx;
		background-color: rgba(255, 255, 255, 0.6);
		width: 70rpx;
		height: 70rpx;
		line-height: 70rpx;
		border-radius: 50%;
		text-align: center;
	}
</style>
