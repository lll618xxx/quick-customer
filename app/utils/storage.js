export function setStorageSync(name, data) {
	try {
		uni.setStorageSync(name, data)
	} catch (e) {
		console.log(e)
	}
}