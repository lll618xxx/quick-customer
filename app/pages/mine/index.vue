<template>
	<view>
		<view class="mine-index" v-if="!haveLogin">
			<view class="without">
				<button class="login-btn" @click="toLoginPage">登录</button>
				<button class="register-btn" @click="toregisterPage">注册</button>
			</view>
			<view class="main"></view>
		</view>
		<view class="mine-main" v-else>
			<view class="top">
				<img src="../../static/images/mine/avtre.jpg" alt="" class="photo">
				<text>用户{{userName}}</text>
			</view>
			<view class="menu">
				<view class="menu-item" v-for="item in menu" :key="item.id">
					<text>{{item.name}}</text>
					<text class="arrow">></text>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				haveLogin: false,
				userName: '',
				menu: [
					{id: 1, name: "关于我们"},
					{id: 2, name: "我的信息"},
				]
			}
		},
		onShow () {
			try {
				const value = uni.getStorageSync('token')
				if (value) {
					this.haveLogin = true
					this.userName = value
				} 
			} catch (e) {
				console.log(e)
			}
		},
		methods: {
			// 前往登录页
			toLoginPage() {
				this.$Router.push('/pages/mine/login')
			},
			// 前往注册页
			toregisterPage() {
				this.$Router.push('/pages/mine/register')
			}
		}
	}
</script>

<style>
	page {
	
	}
</style>

<style scoped>
	.without {
		height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: center;
		background-color: #F8F8F8;
	}
	.without button{
		display: block;
		width: 600rpx;
		height: 100rpx;
		background-color: #1AA034;
		font-size: 40rpx;
		color: #FFFFFF;
	}
	.login-btn {
		margin: -100rpx auto 0 auto;
	}
	.register-btn {
		margin: 80rpx auto 0 auto;
	}
	.top {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;	
		height: 350rpx;
		background-image: url(../../static/images/mine/myinfobg.jpg);
		background-size: cover;
	}
	.top .photo {
		margin-bottom: 20px;
		width: 150rpx;
		height: 150rpx;
		border-radius: 50%;
	}
	.menu {
		margin-top: 100rpx;
	}
	.menu-item {
		position: relative;
		display: flex;
		align-items: center;
		height: 100rpx;
		border-bottom: 1px solid #E4E4E4;
		margin: 0 30rpx;
	}
	.arrow {
		position: absolute;
		right: 10rpx;
		color: #A8A8A8;
		font-size: 50rpx;
	}
</style>
