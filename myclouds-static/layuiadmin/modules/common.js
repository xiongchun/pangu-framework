/**

 @Name：layuiAdmin 公共业务
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License：LPPL
    
 */

layui.define(['myutil'], function(exports) {
	var $ = layui.$,
		layer = layui.layer,
		laytpl = layui.laytpl,
		setter = layui.setter,
		view = layui.view,
		myutil = layui.myutil,
		admin = layui.admin;

	//公共业务的逻辑处理可以写在此处，切换任何页面都会执行
	//console.log(location.href);

	//全局异常拦截器(http status != 200会执行)
	$(document).ajaxError(function(event, jqxhr, settings) {
		var errMsg = '系统故障。状态码：' + jqxhr.responseJSON.code + '，信息：' + jqxhr.responseJSON.msg;
		if (layui.setter.my.runAs == 'demo') {
			errMsg = '在线演示模式部分功能受限，请下载到本地运行体验。';
		}
		layer.alert(errMsg, {
			icon: 5,
			area: ['450px']
		}, function(index) {
			layer.close(index);
			if (jqxhr.status == 401) {
				myutil.logout();
			}
		});

	});

	//对外暴露的接口
	exports('common', {});
});
