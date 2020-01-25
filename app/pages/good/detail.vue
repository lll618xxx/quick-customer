<template>
	<view class="good-detail">
		<image :src="dataList.coverImage" class="good-img"></image>
		<view class="good-main">
			<view class="good-name">{{dataList.name}}</view>
			<view class="good-desc">{{dataList.shopDesc}}</view>
			<view class="good-price">
				<text class="discount-price"><text class="big-font">{{dataList.discountPrice}}</text>元/{{dataList.salesUnit}}</text>
				<text class="market-price">{{dataList.marketPrice}}元/{{dataList.salesUnit}}</text>
			</view>
			<view class="other-message">
				<text class="praise-number"><text class="iconfont icon-like"></text>{{dataList.praiseNumber}}人赞过</text>
				<text class="stock">剩余库存:{{dataList.stock}}/{{dataList.salesUnit}}</text>
			</view>
		</view>
		<view class="bottom">
			<text @click="subNum()" class="iconfont icon-jianghao sub-btn"></text>
			<text class="good-num">{{goodNum}}</text>
			<text @click="addNum()" class="iconfont icon-jiahao add-btn"></text>
			<button class="shop-cart-btn" @click="addShopCart">加入购物车</button>
		</view>
		<button class="back-btn" @click="toBack()">
			<text class="icon-houtui iconfont"></text>
		</button>
	</view>
</template>
z
<script>
	
	export default {
		data() {
			return {
				dataList: {}, // 数据列表
				goodNum: 1    // 商品数量
			}
		},
		onShow() {
			const id = this.$Route.query.detailId || this.$Route.H5Params.detailId
			this.getGoodDetail(id)
		},
		methods: {
			// 获取秒杀商品列表
			getGoodDetail(id) {
				uni.showLoading({ title: '加载中', mask: true });
				this.$Http.getGoodDetail('', {id : id}).then(res => {
					uni.hideLoading();
					if (res.code == 1) {
						this.dataList = res.data
					} else {
						uni.showModal({ title: '提示', content: `${res.message}`, showCancel: false })
					}
				}).catch(err => {
					uni.hideLoading();
				})
			},
			// 增加数量
			addNum() {
				this.goodNum ++
				this.dataList.buyNum = this.goodNum
			},
			// 减少数量
			subNum() {
				if(this.goodNum !== 1) {
					this.goodNum --
				}
				this.dataList.buyNum = this.goodNum
			},
			// 返回上一级路由
			toBack() {
				this.$Router.back(1)
			},
			// 添加到购物车
			addShopCart() {
				try {
					let value = uni.getStorageSync('shopCart')
					let index = value.findIndex((v) => {
						return v.id === this.dataList.id
					})
					if (index !== -1) {
						value[index].buyNum += this.goodNum
					} else {
						this.dataList.buyNum = 1
						value.push(this.dataList)
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
		}
	}
</script>

<style scoped>
	.good-detail {
		position: relative;
	}
	.good-img {
		width: 100%;
		height: 600rpx;
	}
	.good-name {
		font-size: 30rpx;
		padding-left: 20rpx;
	}
	.good-desc {
		margin-top: 10rpx;
		font-size: 26rpx;
		padding-left: 20rpx;
		color: #707070;
	}
	.good-price {
		position: relative;
		display: flex;
		align-items: center;
		margin-top: 20rpx;
	}
	.discount-price {
		font-size: 30rpx;
		color: #C73634;
		font-weight: bold;
		padding-left: 25rpx;
	}
	.big-font {
		font-size: 50rpx;
	}
	.market-price {
		position: absolute;
		right: 30rpx;
		font-size: 24rpx;
		color: #A9A9A9;
		text-decoration: line-through;
	}
	.bottom {
		position: fixed;
		bottom: 0;
		display: flex;
		align-items: center;
		width: 100%;
		height: 100rpx;
		z-index: 1;
	  box-shadow:-5px 10px 20px #333333;
	}
	.shop-cart-btn {
		position: absolute;
		right: 0;
		width: 220rpx;
		height: 100rpx;
		line-height: 100rpx;
		background: linear-gradient(90deg, #FF572E 30%, #FF7B28 60%, #FF9C21 100%);
		color: #FFFFFF;
		font-size: 32rpx;
		letter-spacing: 5rpx;
	}
	.sub-btn {
		font-size: 55rpx;
		color: #C0C0C0;
		margin-left: 30rpx;
	}
	.good-num {
		display: inline-block;
		width: 80rpx;
		font-size: 34rpx;
		color: #282828;
		margin: 0 5rpx;
		text-align: center;
	}
	.add-btn {
		font-size: 55rpx;
		color: #FF9C21;
	}
	.other-message {
		margin-top: 20rpx;
		display: flex;
		align-items: center;
	}
	.praise-number {
		font-size: 22rpx;
		color: #888888;
		margin-left: 30rpx;
	}
	.stock {
		position: absolute;
		right: 30rpx;
		font-size: 22rpx;
		color: #888888;
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
