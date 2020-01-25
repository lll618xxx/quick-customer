<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
			try {
				const value = uni.getStorageSync('shopCart')
				if (value) {
					
				} else {
					try {
						uni.setStorageSync('shopCart', [])
					} catch (e) {
					   console.log(e)
					}
				}
			} catch (e) {
				console.log(e)
			}
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style>
	@import url("./static/css/reset.css");
	@import url("./static/css/iconfont.css");
	/*每个页面公共css */
</style>
