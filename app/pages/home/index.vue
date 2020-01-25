<template>
	<view class="page-index">
		<!-- 顶部轮播 -->
		<swiper class="swiper" autoplay="true" interval="2000" circular="true" indicator-dots="true">
			<swiper-item v-for="item in swiperList" :key="item" class="swiper-item">
				<img :src="item" alt="">
			</swiper-item>
		</swiper>
		<!-- 菜单栏 -->
		<view class="menu">
			<block v-for="item in menuList" :key="item.id">
				<view class="menu-item" @click="toClassifyPage(item.id)">
					<image :src="item.img" alt="" class="menu-item-img"/>
					<text class="menu-item-text">{{item.desc}}</text>
				</view>
			</block>
		</view>
		<!-- 限时秒杀 -->
		<view class="limit-time">
			<view class="limit-time-top">
				<text class="limit-time-title">限时优惠</text>
				<text class="limit-time-end">距结束：
					<text class="time-block">{{countDownTime[1]}}</text><text class="time-sign">:</text>
					<text class="time-block">{{countDownTime[2]}}</text><text class="time-sign">:</text>
					<text class="time-block">{{countDownTime[3]}}</text>
				</text>
				<button class="more">更多 <text class="more-sign">></text></button>
			</view>
			<scroll-view scroll-x="true">
				<view class="seckill-list">
					<block v-for="item in dataList.discountList" :key="item.id">
						<view class="seckill-item">
							<image :src="item.coverImage" class="seckill-img" alt="" @click="toGoodDetail(item.id)"/>
							<image src="../../static/images/home/xianshimiaosha.png" class="seckill-icon" alt=""/>
							<text class="seckill-shop-name">{{item.name}}</text>
							<div class="seckill-price">
								<text class="seckill-discount-price">{{item.discountPrice}}元/{{item.salesUnit}}</text>
								<text class="seckill-market-price">{{item.marketPrice}}元/{{item.salesUnit}}</text>
							</div>
						</view>
					</block>
				</view>
			</scroll-view>
		</view>
		<!-- 新人专享 -->
		<view class="new-comer">
			<view class="new-comer-top">
				<text class="new-comer-title">新人专享</text><text class="new-comer-desc">新人优惠享不停</text>
				<button class="more">更多 <text class="more-sign">></text></button>
			</view>
		</view>
		<scroll-view scroll-x="true">
			<view class="seckill-list">
				<block v-for="item in dataList.newComerList" :key="item.id">
					<view class="seckill-item">
						<image :src="item.coverImage" class="seckill-img" alt=""  @click="toGoodDetail(item.id)"/>
						<image src="../../static/images/home/xinren.png" alt="" class="comer-icon"/>
						<text class="seckill-shop-name">{{item.name}}</text>
						<div class="seckill-price">
							<text class="seckill-discount-price">{{item.discountPrice}}元/{{item.salesUnit}}</text>
							<text class="seckill-market-price">{{item.marketPrice}}元/{{item.salesUnit}}</text>
						</div>
					</view>
				</block>
			</view>
		</scroll-view>
		<!-- 水果区域 -->
		<view class="section">
			<img src="../../static/images/home/fruit-sale.jpg" class="section-sale-img" alt=""/>
			<view class="section-list">
				<block v-for="item in dataList.fruitList" :key="item.id">
					<goodItem v-bind:itemData="item" class="good-item"></goodItem>
				</block>
			</view>
		</view>
		<!-- 蔬菜区域 -->
		<view class="section">
			<img src="../../static/images/home/vegetable-sale.jpg" class="section-sale-img" alt=""/>
			<view class="section-list">
				<block v-for="item in dataList.vegetableList" :key="item.id">
					<goodItem v-bind:itemData="item" class="good-item"></goodItem>
				</block>
			</view>
		</view>
		<!-- 海鲜区域 -->
		<view class="section">
			<img src="../../static/images/home/seafood-sale.jpg" class="section-sale-img" alt=""/>
			<view class="section-list">
				<block v-for="item in dataList.seafoodList" :key="item.id">
					<goodItem v-bind:itemData="item" class="good-item"></goodItem>
				</block>
			</view>
		</view>
	</view>
</template>

<script>
	import {countdown} from '@/utils/index.js'
	import goodItem from '@/components/goodItem.vue'
	
	export default {
		components: {goodItem},
		data() {
			return {
				// 轮播图列表
				swiperList: [
					'../../static/images/home/banner-1.jpg',
					'../../static/images/home/banner-2.jpg',
					'../../static/images/home/banner-3.jpg'
				],
				// 菜单列表
				menuList: [
					{id: 1, img: '../../static/images/home/menu-1.jpg', desc: '新鲜水果'},
					{id: 2, img: '../../static/images/home/menu-2.jpg', desc: '蔬瓜菜品'},
					{id: 3, img: '../../static/images/home/menu-3.jpg', desc: '满地飞禽'},
					{id: 4, img: '../../static/images/home/menu-4.jpg', desc: '酒水饮料'},
					{id: 5, img: '../../static/images/home/menu-5.jpg', desc: '海鲜水产'}
				],
				// 首页数据列表
				dataList: {},
				// 倒计时
				countDownTime: ['**', '**', '**', '**'],
			}
		},
		onLoad() {
			this.getIndexLists()
		},
		methods: {
			// 获取秒杀商品列表
			getIndexLists() {
				uni.showLoading({ title: '加载中', mask: true });
				this.$Http.getIndexLists().then(res => {
					uni.hideLoading();
					if (res.code == 1) {
						this.dataList = res.data
						this.createCountDown()
					} else {
						uni.showModal({ title: '提示', content: `${res.message}`, showCancel: false })
					}
				}).catch(err => {
					uni.hideLoading();
				})
			},
			// 创建秒杀倒计时
			createCountDown(){
				let nowTime = 10000000 // 假的时间
				const interval = 1000; 
				let timearr = [];
				const timer = setInterval(() => {
					timearr = countdown(nowTime) 
					if(timearr !== -1){
						this.countDownTime = timearr
						nowTime--
					}else{
						clearInterval(timer);
					}
				},interval)
				this.$on('hook:onUnload', () => {            
					clearInterval(timer);                                 
				})
			},
			// 跳转到分类页
			toClassifyPage(id) {
				this.$Router.pushTab({ name: 'classify/index', params: { categoryId: id }})
				// #ifdef H5
				this.$Router.setH5Params('classify/index', { categoryId: id })
				// #endif
			},
			// 跳转到商品详情页
			toGoodDetail(id) {
				this.$Router.push({ name: 'good/detail', params: { detailId: id }})
				// #ifdef H5
				this.$Router.setH5Params('good/detail', { detailId: id })
				// #endif
			},
		}
	}
</script>

<style scoped>
	.swiper {
		width: 100%;
		height: 400rpx;
	}
	.swiper-item img {
		width: 100%;
		height: 100%;
	}
	.menu {
		margin-top: 30rpx;
		display: flex;
	}
	.menu-item {
		display: flex;
		width: 20%;
		flex-direction: column;
		align-items: center;
	}
	.menu-item-img {
		border-radius: 50%;
		width: 80rpx;
		height: 80rpx;
	}
	.menu-item-text {
		margin-top: 10rpx;
		font-size: 20rpx;
	}
	.limit-time {
		margin-top: 30rpx;
	}
	.limit-time-top {
		display: flex;
		align-items: center;
		padding-left: 30rpx;
	}
	.limit-time-title {
		font-size: 40rpx;
	}
	.limit-time-end {
		margin-left: 40rpx;
		font-size: 25rpx;
		color: #ACACAE;
	}
	.time-block {
		display: inline-block;
		width: 45rpx;
		height: 45rpx;
		line-height: 45rpx;
		background-color: #000000;
		color: #ffffff;
		margin: 0 10rpx;
		text-align: center;
	}
	.time-sign {
		font-size: 30rpx;
		color: #000000;
	}
	.seckill-list {
		display: flex;
		white-space: nowrap;  /* 滚动必须 */
		margin: 15rpx auto 0 auto;
		width: 680rpx;
	}
	.seckill-item {
		position: relative;
		display: flex; 
		flex-direction: column;
		margin-right: 40rpx;
	}
	.seckill-img {
		width: 200rpx;
		height: 220rpx;
		border-radius: 5rpx;
	}
	.seckill-shop-name {
		font-size: 18rpx;
		margin-top: 10rpx;
		text-align: left;
	}
	.seckill-price {
		position: relative;
		display: flex;
		align-items: center;
		margin-top: 5rpx;
		margin-bottom: 15rpx;
	}
	.seckill-discount-price {
		font-size: 20rpx;
		color: #C73634;
		text-align: center;
		font-weight: bold;
	}
	.seckill-market-price {
		position: absolute;
		right: 0;
		font-size: 17rpx;
		color: #A9A9A9;
		text-decoration: line-through;
		text-align: center;
	}
	.seckill-icon {
		margin-top: 15rpx;
		width: 96rpx;
		height: 19.5rpx;
	}
	.comer-icon {
		position: absolute;
		top: 0;
		left: 0;
		width: 50rpx;
		height: 50rpx;
	}
	.new-comer {
		margin-top: 30rpx;
	}
	.new-comer-top {
		display: flex;
		align-items: center;
		margin-left: 30rpx;
	}
	.new-comer-title {
		font-size: 40rpx;
		color: #2FC491;
	}
	.new-comer-desc {
		margin-left: 30rpx;
		font-size: 26rpx;
		color: #A4A4A4;
	}
	.more {
		position: absolute;
		right: 30rpx;
		font-size: 26rpx;
		line-height: 28rpx;
	}
	.more-sign {
		margin-left: 7rpx;
		font-size: 32rpx;
		color: #BDBDBD;
	}
	.section {
		
	}
	.section-sale-img {
		display: block;
		width: 650rpx;
		height: 200rpx;
		margin: 50rpx auto 30rpx auto;
	}
	.section-list {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
	}
	.good-item {
		margin: 0 20rpx 30rpx 20rpx;
	}
</style>
