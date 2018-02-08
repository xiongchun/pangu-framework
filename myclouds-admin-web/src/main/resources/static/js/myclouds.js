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
	 * @beforeEvent 监听打开前事件
	 * @afterEvent 监听关闭后事件
	 */
	var popup = function(selector, beforeEvent, afterEvent){
        $.magnificPopup.open({
            items: {
                src: selector
            },
            mainClass : $(selector).attr('data-effect'),
            callbacks: {
                beforeOpen: beforeEvent,
                afterClose: afterEvent
            }
        });		
	}

	return {
		params : params,
		popup : popup
	}

}();