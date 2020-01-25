<template>
	<view class="good-item">
		<image class="item-img" :src="itemData.coverImage" @click="toGoodDetail(itemData.id)"></image>
		<view class="item-name">{{itemData.name}}</view>
		<view class="item-under">
			<text class="item-discount-price">{{itemData.discountPrice}}元/{{itemData.salesUnit}}</text>
			<text class="item-market-price">{{itemData.marketPrice}}元/{{itemData.salesUnit}}</text>
			<button class="item-buy" @click="addShopCart()"></button>
		</view>
	</view>
</template>

<script>
	
	export default {
		props:['itemData'],
		data() {
			return {
				
			}
		},
		methods: {
			// 跳转到商品详情页
			toGoodDetail(id) {
				this.$Router.push({ name: 'good/detail', params: { detailId: id }})
				// #ifdef H5
				this.$Router.setH5Params('good/detail', { detailId: id })
				// #endif
			},
			// 添加到购物车
			addShopCart() {
				try {
					let value = uni.getStorageSync('shopCart')
					let index = value.findIndex((v) => {
						return v.id === this.itemData.id
					})
					if (index !== -1) {
						value[index].buyNum++
					} else {
						this.itemData.buyNum = 1
						value.push(this.itemData)
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
	.good-item {
		width: 300rpx;
	}
	.item-img {
		width: 300rpx;
		height: 200rpx;
	}
	.item-name {
		margin-top: 20rpx;
		font-size: 22rpx;
	}
	.item-under {
		position: relative;
		margin-top: 20rpx;
		display: flex;
		flex-direction: column;
	}
	.item-discount-price {
		font-size: 18rpx;
		color: #C73634;
	}
	.item-market-price {
		font-size: 15rpx;
		color: #A9A9A9;
		text-decoration: line-through;
	}
	.item-buy {
		position: absolute;
		top: 7rpx;
		right: 0;
		background: url(../static/images/home/tianjia.png) no-repeat;
		width: 36rpx;
		height: 36rpx;
		background-size: 100%;
	}
</style>
