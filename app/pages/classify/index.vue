<template>
	<view class="classify">
		<view class="bar">
			<scroll-view scroll-y="true">
				<view class="bar-list">
					<block v-for="item in barList" :key="item.id">
						<view :class="[currentTab === item.id ? 'activeTab' : '', 'bar-list-item']" @click="changeDetail(item.id)">{{item.name}}</view>
					</block>
				</view>		
			</scroll-view>
		</view>
		<view class="right-content">
			<block v-for="item in dataList" :key="item.id">
				<view class="good-item">
					<image :src="item.coverImage" class="good-img" @click="toGoodDetail(item.id)"></image>
					<view class="right-slide">
						<view class="good-name">{{item.name}}</view>
						<view class="good-sale-num">已售<span class="sale-num">{{item.saleNum}}</span>{{item.salesUnit}}</view>
						<view class="good-price">
							<text class="discount-price"><text class="big-font">{{item.discountPrice}}</text>元/{{item.salesUnit}}</text>
							<text class="market-price">{{item.marketPrice}}元/{{item.salesUnit}}</text>
							<button class="item-buy" @click="addShopCart(item)"></button>
						</view>
					</view>
				</view>
			</block>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 左侧bar列表
				barList: [
					{id: 1, name: '新鲜水果'},
					{id: 2, name: '蔬瓜菜品'},
					{id: 3, name: '满地飞禽'},
					{id: 4, name: '酒水饮料'},
					{id: 5, name: '海鲜水产'},
				],
				// 当前bar id
				currentTab: 1,
				// 数据列表
				dataList: []
			}
		},
		onShow() {
			const id = this.$Route.query.categoryId || this.$Route.H5Params.categoryId || this.currentTab
			this.currentTab = id
			this.getGoodList(id)
		},
		methods: {
			// 获取商品
			getGoodList(id) {
				uni.showLoading({ title: '加载中', mask: true })
				this.$Http.getGoodLists('', {page: 1, limit: 20, discountPrice: 'asc', category: id}).then(res => {
					uni.hideLoading()
					if (res.code == 1) {
						this.dataList = res.data
					} else {
						uni.showModal({ title: '提示', content: `${res.message}`, showCancel: false })
					}
				}).catch(err => {
					uni.hideLoading()
				})
			},
			// 切换选项列表
			changeDetail(id) {
				this.currentTab = id
				this.getGoodList(id)
			},
			// 跳转到商品详情页
			toGoodDetail(id) {
				this.$Router.push({ name: 'good/detail', params: { detailId: id }})
				// #ifdef H5
				this.$Router.setH5Params('good/detail', { detailId: id })
				// #endif
			},
			// 添加到购物车
			addShopCart(item) {
				try {
					let value = uni.getStorageSync('shopCart')
					let index = value.findIndex((value, index) => {
						return value.id === item.id
					})
					if (index !== -1) {
						value[index].buyNum++
					} else {
						item.buyNum = 1
						value.push(item)
					}
					
					try {
						uni.setStorageSync('shopCart', value)
						uni.showToast({
							title: '已添加进购物车',
							icon: 'success',
							duration: 1500
						})
					} catch (e) {
						console.log(e)
					}
				} catch (e) {
					console.log(e)
				}
			}
		},
	}
</script>

<style scoped>
	.classify {
		display: flex;
	}
	.bar {
		width: 150rpx;
		height: 100%;
		border-right: 1px solid #D8D8D8;
	}
	.bar-list-item {
		font-size: 30rpx;
		height: 80rpx;
		line-height: 80rpx;
		text-align: center;
		color: #888888;
		border-left: 3px solid transparent;
	}
	.activeTab {
		border-left: 3px solid purple;
		color: #000000;
	}
	.right-content {
		margin-left: 30rpx;
	}
	.good-item {
		display: flex;
		margin-top: 30rpx;
		width: 540rpx;
		height: 220rpx;
	}
	.good-img {
		width: 200rpx;
		height: 220rpx;
	}
	.right-slide {
		position: relative;
		margin-left: 30rpx;
	}
	.good-name {
		width: 100%;
		font-size: 30rpx;
	}
	.good-sale-num {
		margin-top: 10rpx;
		font-size: 26rpx;
		color: #787878;
	}
	.sale-num {
		color: #D37E53;
		margin: 0 10rpx;
	}
	.good-price {
		position: absolute;
		bottom: 0;
		display: flex;
		flex-direction: column;
		width: 320rpx;
		margin-top: 20rpx;
	}
	.discount-price {
		font-size: 26rpx;
		color: #C73634;
		font-weight: bold;
	}
	.big-font {
		font-size: 40rpx;
	}
	.market-price {
		font-size: 20rpx;
		color: #A9A9A9;
		text-decoration: line-through;
	}
	.item-buy {
		position: absolute;
		top: 15rpx;
		right: 0;
		background: url(../../static/images/home/tianjia.png) no-repeat;
		width: 46rpx;
		height: 46rpx;
		background-size: 100%;
	}
</style>
