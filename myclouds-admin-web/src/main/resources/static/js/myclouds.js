'use strict';

/*
 * ! myclouds.js - v1.0 https://gitee.com/osworks/MyClouds Copyright (c) 2018
 * MyClouds Team;
 */

/* 常用工具类库 */
var My = function() {

	/**
	 * 序列化表单元素
	 * 
	 * @selector JQuery支持的元素选择器表达式
	 */
	var params = function(selector) {
		var formParams = {};
		$.each($(selector).serializeArray(), function(index, obj) {
			formParams[obj.name] = obj.value;
		});
		return formParams;
	}
	
	/**
	 * 弹出窗口
	 * 
	 * @selector JQuery支持的元素选择器表达式
	 */
	var popup = function(selector){
        $.magnificPopup.open({
            items: {
                src: selector
            },
            mainClass : $(selector).attr('data-effect')
        });		
	}
	
	/**
	 * 关闭弹出窗口
	 */
	var close = function(){
		$.magnificPopup.close();
	}

	return {
		params : params,
		popup : popup,
		close : close
	}

}();