<template>
	<view class="chop-cart-index">
		<view v-if="shopCart.length === 0" class="shop-none">
			<image src="../../static/images/shopCart/no-shop.jpg" class="shop-none-img"></image>
			<text class="shop-none-title">购车车空空如也</text>
			<text class="shop-none-desc">不管怎样，希望你能把我装满~</text>
		</view>
		<view v-else class="shop-list">
			<checkbox-group>
				<block v-for="(item, index) of shopCart" :key="item.id">
					<view class="list-item">
						<checkbox :value="item.id.toString()" :checked="item.checked" @click="getCheckbox(index)"/>
						<image :src="item.coverImage" class="list-item-img"/>
						<view class="list-item-right">
							<text class="list-item-name">{{item.name}}</text>
							<text class="list-item-dcp"><text class="list-item-sign">￥</text>{{item.discountPrice}}</text>
							<view class="num-group">
								<button class="buy-sub" @click="subNum(index)">-</button>
								<text class="buy-num">{{item.buyNum}}</text>
								<button class="buy-add" @click="addNum(index)">+</button>
							</view>
						</view>
					</view>
				</block>
			</checkbox-group>
			<view class="under">
				<label class="all-select" @click="radioChange()"><radio value="" :checked="redioChecked" /><text class="all-select-word">全选</text></label>
				<text class="total-price">￥{{totalPrice}}</text>
				<button class="delete" :style="{display: deleteActived ? 'block' : 'none'}" @click="deleteGood" type="warn" size="mini">删除</button>
				<button class="to-pay">去买单</button>
			</view>
		</view>
	</view>
</template>

<script>
	import {setStorageSync} from '../../utils/storage.js'
	
	export default {
		data() {
			return {
				shopCart: [],
				deleteActived: false
			}
		},
		onShow() {
			this.shopCart = uni.getStorageSync('shopCart')
			this.shopCart.map((item, index) => {
				return item.checked = false
			})
			this.totalPrice = new Number(0).toFixed(2)
			this.redioChecked = false
		},
		methods: {
			getCheckbox(index) {
				this.shopCart[index].checked = !this.shopCart[index].checked
				this.countPrice()
				this.isShowDelete()
			},
			// 删除商品
			deleteGood() {
				let that = this
				uni.showModal({
					title: '提示',
					content: '确定要删除选中商品吗?',
					success: function (res) {
						if (res.confirm) {
							that.shopCart = that.shopCart.filter((item, index) => {
								return item.checked !== true
							})
							setStorageSync('shopCart', that.shopCart)
						} else if (res.cancel) {
							
						}
					}
				})
			},
			// 增加数量
			addNum(index) {
				this.shopCart[index].buyNum++
				this.countPrice()
				setStorageSync('shopCart', this.shopCart)
			},
			// 减少数量
			subNum(index) {
				if (this.shopCart[index].buyNum > 1) {
					this.shopCart[index].buyNum--
					this.countPrice()
					setStorageSync('shopCart', this.shopCart)
				}
			},
			// 单选改变
			radioChange() {
				if (this.redioChecked) {
					this.shopCart.map((item, index) => {
						return item.checked = false
					})
				} else {
					this.shopCart.map((item, index) => {
						return item.checked = true
					})
				}
				this.redioChecked = !this.redioChecked
				this.countPrice()
				this.isShowDelete()
			},
			// 计算价格
			countPrice() {
				const initPrice = 0
				this.totalPrice = this.shopCart.reduce((total, value, index) => {
					let tempPrice =  value.checked ? value.discountPrice*value.buyNum : 0
					return total + tempPrice
				}, initPrice).toFixed(2)
			},
			// 检查是否能删除
			isShowDelete() {
				this.deleteActived =  this.shopCart.some(item => {
					return item.checked === true
				})
			}
		}
	}
</script>

<style>
	page {
	  position: relative;
		width: 100%;
		height: 100%;
		background-color: #F8F8F8;
	}
</style>

<style scoped>
	.shop-none {
		position: absolute;
		left: 0;
		right: 0;
		top: 20%;
		margin: auto;
		display: flex;	
		flex-direction: column;
		align-items: center;
	}
	.shop-none-img {
		width: 300rpx;
		height: 300rpx;
	}
	.shop-none-title {
		margin-top: 50rpx;
		font-size: 40rpx;
	}
	.shop-none-desc {
		margin-top: 30rpx;
		font-size: 30rpx;
		color: #707070;
	}
	.shop-list {
		padding-bottom: 120rpx;
	}
	.list-item {
		height: 240rpx;
		padding-left: 30rpx;
		display: flex;
		align-items: center;
		margin-bottom: 50rpx;
		background-color: #FFFFFF;
		box-shadow:-1px 3px 10px #E7EAED;
	}
	.list-item-img {
		margin-left: 30rpx;
		width: 200rpx;
		height: 200rpx;
	}
	.list-item-right {
		margin-left: 30rpx;
		width: 360rpx;
		height: 200rpx;
		display: flex;
		flex-direction: column;
	}
	.list-item-name {
		font-size: 36rpx;
	}
	.list-item-dcp {
		margin-top: 20rpx;
		font-size: 34rpx;
		color: red;
	}
	.list-item-sign {
		font-size: 26rpx;
	}
	.num-group {
		margin-top: 30rpx;
		display: flex;
	}
	.buy-sub {
		width: 80rpx;
		height: 40rpx;
		line-height: 24rpx;
		font-size: 70rpx;
		color: black;
		border: 1px solid #606060;
	}
	.buy-num {
		box-sizing: border-box;
		font-size: 30rpx;
		text-align: center;
		width: 60rpx;
		height: 40rpx;
		line-height: 40rpx;
		border-top: 1px solid #606060;
		border-bottom: 1px solid #606060;
	}
	.buy-add {
		width: 80rpx;
		height: 40rpx;
		line-height: 32rpx;
		font-size: 44rpx;
		color: black;
		border: 1px solid #606060;
	}
	.under {
		position: fixed;
		bottom: var(--window-bottom);
		display: flex;
		align-items: center;
		width: 100%;
		height: 100rpx;
		box-shadow: -5px 10px 20px #333333;
		background-color: #FFFFFF;
		z-index: 1;
	}
	.total-price {
		font-size: 36rpx;
		color: red;
	}
	.all-select {
		margin-left: 40rpx;
	}
	.all-select-word {
		font-size: 26rpx;
	}
	.delete {
		position: absolute;
		left: 320rpx;
		font-size: 28rpx;
		letter-spacing: 4rpx;	
	}
	.to-pay {
		position: absolute;
		top: 0;
		right: 0;
		width: 250rpx;
		height: 100rpx;
		color: #FFFFFF;
		text-align: center;
		background-color: #2FC491;
		font-size: 40rpx;
		letter-spacing: 2rpx;
	}
</style>
