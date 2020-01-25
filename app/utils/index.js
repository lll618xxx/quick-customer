/**
 * 常用工具函数封装 
 */

/**
 * 时间倒计转换-天-时-分-秒
 * @param {Number} targetTime 
 * @return {Array} [天，时，分，秒]
 */
export function countdown(time){
	if(time < 0){  // 时间过期
		return -1;
	}
	// 获取还剩多少天
	const day = timeFullZero(parseInt(time/3600/24));
	// 获取还剩多少小时
	const hour = timeFullZero(parseInt(time/3600%24));
	// 获取还剩多少分钟
	const minute = timeFullZero(parseInt(time/60%60));
	// 获取还剩多少秒
	const second = timeFullZero(time%60);
	
	return [day, hour, minute, second]; // 结果数组 [天，时，分，秒]
}
function timeFullZero(num){
	return num>=10 ? `${num}` : `0${num}`;
}