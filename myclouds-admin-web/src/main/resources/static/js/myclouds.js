'use strict';

/*
 * ! myclouds.js - v1.0 https://gitee.com/osworks/MyClouds Copyright (c) 2018
 * 
 * @author xiongchun
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
	 * 弹出窗口 窗口事件可以通过其他方式绑定
	 * 
	 * @selector JQuery支持的元素选择器表达式
	 */
	var popup = function(selector) {
		$.magnificPopup.open({
			items : {
				src : selector
			},
			mainClass : $(selector).attr('data-effect')
		});
	}

	/**
	 * 关闭弹出窗口
	 */
	var close = function() {
		$.magnificPopup.close();
	}

	/**
	 * 消息通知
	 */
	var notify = function(text, type, stack) {
		if (typeof (text) == "undefined" || text == null) {
			text = '^_^';
		}
		if (typeof (type) == "undefined" || type == null) {
			type = 'success';
		}
		if (typeof (stack) == "undefined" || stack == null) {
			stack = 'stack_top_right';
		}
		// Create new Notification
		new PNotify({
			title : '提示',
			text : text,
			opacity : 1,
			addclass : stack,
			type : type,
			stack : Stacks[stack],
			width : '25%',
			delay : 1000
		});
	}

	/**
	 * 常规alert提示框
	 * 
	 * @text 提示信息
	 * @size 提示框大小 small large 缺省 null
	 * @title 标题
	 * @size 回调函数
	 */
	var alert = function(text, size, title, callback) {
		bootbox.alert({
			message : text,
			size : size,
			title : title,
			callback : callback
		})
	}

	/**
	 * 表单校验
	 * 
	 * @formSelector 表单选择符
	 * @submitHandler 表单提交响应事件
	 * @options 校验配置项
	 */
	var validate = function(formSelector, submitHandler, options) {
		$(formSelector).validate({
			errorElement : "em",
			// 校验规则
			rules : {
				name : {
					required : true
				},
				param_key : {
					required : true
				},
				sys_key : {
					required : true
				},
				value : {
					required : true
				}
			},
			// 提示信息
			messages : {
				name : {
					required : '请输入参数名称'
				},
				param_key : {
					required : '请输入参数键'
				},
				sys_key : {
					required : '请选择所属系统'
				},
				value : {
					required : '请输入参数值'
				}
			},

			highlight : function(element, errorClass, validClass) {
				$(element).closest('.field').addClass('has-error');
			},
			success : function(element, errorClass, validClass) {
				$(element).closest('.field').removeClass('has-error');
			},
			errorPlacement : function(error, element) {
				if (element.is(":radio") || element.is(":checkbox")) {
					element.closest('.option-group').after(error);
				} else {
					error.insertAfter(element);
				}
			},
			// 拦截并阻止原生submit事件，提供新的事件句柄接口
			submitHandler : submitHandler
		});
	}

	return {
		params : params,
		popup : popup,
		close : close,
		notify : notify,
		alert : alert,
		validate : validate
	}

}();

/* ====== 消息通知配置项 ====== */
// A "stack" controls the direction and position
// of a notification. Here we create an array w
// with several custom stacks that we use later
var Stacks = {
	stack_top_right : {
		"dir1" : "down",
		"dir2" : "left",
		"push" : "top",
		"spacing1" : 10,
		"spacing2" : 10
	},
	stack_top_left : {
		"dir1" : "down",
		"dir2" : "right",
		"push" : "top",
		"spacing1" : 10,
		"spacing2" : 10
	},
	stack_bottom_left : {
		"dir1" : "right",
		"dir2" : "up",
		"push" : "top",
		"spacing1" : 10,
		"spacing2" : 10
	},
	stack_bottom_right : {
		"dir1" : "left",
		"dir2" : "up",
		"push" : "top",
		"spacing1" : 10,
		"spacing2" : 10
	},
	stack_bar_top : {
		"dir1" : "down",
		"dir2" : "right",
		"push" : "top",
		"spacing1" : 0,
		"spacing2" : 0
	},
	stack_bar_bottom : {
		"dir1" : "up",
		"dir2" : "right",
		"spacing1" : 0,
		"spacing2" : 0
	},
	stack_context : {
		"dir1" : "down",
		"dir2" : "left",
		"push" : "top",
		"context" : $("#stack_context")
	},
}