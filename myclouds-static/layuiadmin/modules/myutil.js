/**

 @Name：工具类
 @Author：xiongchun
    
 */
layui.define(function(exports) {
	var $ = layui.$;

	var obj = {
		//将表单序列化为json对象
		json: function(selector) {
			var jsonData = {};
			$.each($(selector).serializeArray(), function(index, obj) {
				if (obj.value) {
					jsonData[obj.name] = obj.value;
				}
			});
			return jsonData;
		},
		//获取URL Path变量
		pathVar: function(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]);
			return null;
		},
		//从json对象数组中获取某个属性并以某分隔符分开
		contactBy: function(arrJson, field, separator) {
			var str = '';
			$.each(arrJson, function(index, obj) {
				str = str + obj[field] + separator;
			});
			return str.substr(0, str.length - 1);
		},
		//Ajax
		ajax: function(options) {
			options.type = options.type || 'post';
			options.dataType = options.dataType || 'json'; //预期的服务器响应的数据类型
			options.contentType = options.contentType || 'application/json';
			options.headers = options.headers || {};
			if (this.user()) {
				// COMMON.js已经做了一次全局设置，但页面初始即ajax的情况全局设置无效，那个设置会无效，所以在这里再设置一次
				options.headers = {
					"X-Auth-Token": this.user().token
				}
			}
			options.data = options.data || {};
			//TODO 自动给参数传入默认 token  参考view.js
			//TODO 自动给 Request Headers 传入 token view.js
			if (options.contentType.indexOf('application/json') >= 0) {
				options.data = JSON.stringify(options.data);
			}
			$.ajax($.extend({
				success: function(res) {
					//请求成功执行success status=200
					if (res.code >= 0) {
						// 状态码code>=0才会执行自定义 ok 函数
						typeof options.ok === 'function' && options.ok(res);
					} else {
						var errMsg = '业务异常。状态码：' + res.code + '，信息：' + res.msg;
						layer.alert(errMsg, {
							icon: 5,
							area: ['450px']
						});
					}
				}
				//error: 参见common.js中的统一异常拦截
			}, options));
		},
		//当前用户
		user: function() {
			var userInfo = layui.sessionData('myAuth', {
				key: 'userVO'
			});
			return userInfo;
		},
		//受管页面初始化
		init: function() {
			//页面访问权限（粒度比较粗，可以再优化）
			if (!this.user()) {
				top.location.href = layui.setter.my.context + 'login.html';
			}
			//COMMON.js中执行追加头信息，table 加载数据的ajax 头信息有bug，所以放在这处理
			$.ajaxSetup({
				headers: {
					"X-Auth-Token": this.user().token
				}
			});
		},
		//注销
		logout: function() {
			layui.sessionData('myAuth', {
				key: 'userVO',
				remove: true
			});
			top.location.href = layui.setter.my.context + 'login.html';
		}

	}

	//对外暴露的接口
	exports('myutil', obj);

});
