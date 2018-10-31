'use strict';

/*
 * ! myclouds.js - v1.0 https://gitee.com/osworks/MyClouds Copyright (c) 2018
 * 
 * @author xiongchun
 */

/* 常用工具类库 */
var My = function() {
	
	//定义主题色彩样式
	var theme = {
			color:{
				normal:{
					primary:'#4A89DC',
					success:'#70CA63',
					info:'#3BAFDA',
					warning:'#F6BB42',
					danger:'#E9573F',
					alert:'#967ADC',
					system:'#37BC9B',
					dark:'#3B3F4F'
				},
				light:{
					primary:'#649AE1',
					success:'#85D27A',
					info:'#55BADF',
					warning:'#F7C65F',
					danger:'#EC6F5A',
					alert:'#A992E2',
					system:'#48C9A9',
					dark:'#484D61'
				},
				dark:{
					primary:'#3078D7',
					success:'#5BC24C',
					info:'#27A2CF',
					warning:'#F5B025',
					danger:'#E63F24',
					alert:'#8362D6',
					system:'#30A487',
					dark:'#2E313D'
				}
			}
	}
	
	/**
	 * 初始化
	 */
	var init = function (options){
		doLeftAsideTheme();
		//niceScroll(	);
	}
	
	//左侧导航栏的主题设定
	function doLeftAsideTheme(){
		//当前页面所属功能模块的模块ID
		var mid = $('#my-mid').val();
		if(typeof(mid) !== "undefined" && mid !== ''){
			//高亮导航栏中当前模块菜单
			var mid = '#my-mitem-' + $('#my-mid').val();
			if($(mid).data('level') == '1'){
				$(mid).addClass('active');
			}else{
				var themeSettings = $.parseJSON(localStorage.getItem('myclouds-data-theme'));
				//侧边栏样式
				var sidebarSkin = themeSettings.sidebarSkin;
				if(sidebarSkin == ''){
					//缺省暗夜黑
					$(mid).addClass('active');
				}else{
					//另外的皮肤，如果根据皮肤自定义则也可以在这里处理
					$(mid).addClass('active menu-active');
				}
				
			}
		};
	}
	
	//根据主题选项渲染主窗口滚动条
	function niceScroll(dom, reset,delay){
		dom = dom==undefined ? $("body") : dom;
		delay = delay==undefined ? 200 : delay;
		if(reset == 'reset'){
			dom.niceScroll().remove();
		}
		var themeSettings = $.parseJSON(localStorage.getItem('myclouds-data-theme'));
		var headerSkin = themeSettings.headerSkin;
		var color = '#FAFAFA';
		if(headerSkin != ''){
			headerSkin = headerSkin.substring(3,headerSkin.length);
			color = theme.color.normal[headerSkin];
			color = color == undefined ? theme.color.light['info'] : color;
		}
		dom.niceScroll({
			cursorcolor: color,
			cursorwidth: 	"8px",
			cursorborder: "0px solid #000",
			scrollspeed: 60,
			autohidemode: true,
			background: '#ddd',
			hidecursordelay: delay,
			cursorfixedheight: false,
			cursorminheight: 20,
			enablekeyboard: true,
			horizrailenabled: true,
			bouncescroll: false,
			smoothscroll: true,
			iframeautoresize: true,
			touchbehavior: 	false,
			zindex: 999
			});
	}

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
	 * alert常规提示框
	 * 
	 * @text 提示信息
	 * @size 提示框大小 small large null
	 * @title 标题
	 * @callback 回调函数
	 */
	
	var alert = function(text, size, title, callback) {
		bootbox.setDefaults("locale","zh_CN");
		size = typeof(size) == 'undefined' ? 'small' : size;
		bootbox.alert({
			message : text,
			size : size,
			title : title,
			callback : callback
		})
	}
	
	/**
	 * confirm确认提示框
	 * 
	 * @text 提示信息
	 * @size 提示框大小 small large 缺省 null
	 * @callback 回调函数
	 */
	var confirm = function(text,size,callback){
		bootbox.confirm({
		    message: text,
		    size : size,
		    buttons: {
		        confirm: {
		            label: '确定',
		            className: 'btn-gradient btn-sm btn-success'
		        },
		        cancel: {
		            label: '取消',
		            className: 'btn-gradient btn-sm btn-danger'
		        }
		    },
		    callback: callback
		});
	}

	/**
	 * 表单校验
	 * TODO 需要进一步封装
	 * 
	 * @formSelector 表单选择符
	 * @submitHandler 表单提交响应事件
	 * @options 校验配置项
	 */
	var validate = function(formSelector, submitHandler, options) {
		$(formSelector).validate({
			errorElement : "em",
			// 校验规则
			rules : options.rules,
			// 提示信息
			messages : options.messages,

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
		init : init,
		params : params,
		popup : popup,
		close : close,
		notify : notify,
		alert : alert,
		confirm : confirm,
		validate : validate,
		niceScroll:niceScroll
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

//将Json对象回填表单
$.fn.setForm = function(jsonData) {
	var obj = this;
	$.each(jsonData, function(name, ival) {
		var $oinput = obj.find("input[name=" + name + "]");
		if ($oinput.attr("type") == "radio" || $oinput.attr("type") == "checkbox") {
			$oinput.each(function() {
				if (Object.prototype.toString.apply(ival) == '[object Array]') {//是复选框，并且是数组  
					for (var i = 0; i < ival.length; i++) {
						if ($(this).val() == ival[i])
							$(this).attr("checked", "checked");
					}
				} else {
					if ($(this).val() == ival)
						$(this).attr("checked", "checked");
				}
			});
		} else if ($oinput.attr("type") == "textarea") {//多行文本框  
			obj.find("[name=" + name + "]").html(ival);
		} else {
			obj.find("[name=" + name + "]").val(ival);
		}
	});
};