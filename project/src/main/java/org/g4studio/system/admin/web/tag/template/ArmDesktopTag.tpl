<!--
此页面代码由G4系统集成与应用开发平台模板引擎组件强力驱动生成
               copyRight(c) 2007-2012, G4Studio.
                           www.g4studio.org
-->
<html>
<head>
<title>${title}</title>
<meta http-equiv="keywords" content="G4Studio,G4Studio在线演示,G4Studio系统集成与应用开发平台">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="description" content="It's Based G4Studio！copyRight(c) G4Studio">
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache, must-revalidate">  
<meta http-equiv="expires" content="0">
<link rel="shortcut icon" href="${contextPath}/resource/image/${titleIcon}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resource/theme/${theme}/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resource/desktop/css/desktop.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resource/css/ext_icon.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resource/css/g4studio.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resource/css/ext_css_patch.css" />
<script type="text/javascript" src="${contextPath}/resource/extjs/adapter/ext/ext-base.js"></script>
  #if(${extMode} == "debug")
<script type="text/javascript" src="${contextPath}/resource/extjs/ext-all-debug.js"></script>
  #else
<script type="text/javascript" src="${contextPath}/resource/extjs/ext-all.js"></script>
  #end
<script type="text/javascript" src="${contextPath}/resource/commonjs/g4studio.js"></script>
<script type="text/javascript" src="${contextPath}/resource/desktop/js/StartMenu.js"></script>
<script type="text/javascript" src="${contextPath}/resource/desktop/js/TaskBar.js"></script>
<script type="text/javascript" src="${contextPath}/resource/desktop/js/Desktop.js"></script>
<script type="text/javascript" src="${contextPath}/resource/desktop/js/App.js"></script>
<script type="text/javascript" src="${contextPath}/resource/desktop/js/Module.js"></script>
<script type="text/javascript" src="${contextPath}/resource/commonjs/ext-lang-zh_CN.js"></script>

<script type="text/javascript">
/* 全局参数表 */
#foreach($param in $paramList)var ${param.paramkey}='${param.paramvalue}';#end
/* 当前登录用户信息*/
	var userid = '${userInfo.getUserid()}';var username = '${userInfo.getUsername()}';var account = '${userInfo.getAccount()}';
	var deptid = '${userInfo.getDeptid()}';var customId = '${userInfo.getCustomId().trim()}';var theme = '${userInfo.getTheme()}';
	var explorer = '${userInfo.getExplorer()}';
/********************/
  var webContext = '${contextPath}';
  var runMode = '${runMode}';
  var ajaxErrCode = '${ajaxErrCode}';
  var micolor = 'color:${micolor};';
  var default_theme = '${theme}';
  var default_layout = '${layout}';
  var default_background = '${background}';
  Ext.QuickTips.init();
  Ext.form.Field.prototype.msgTarget = 'qtip';
  Ext.BLANK_IMAGE_URL = '${contextPath}/resource/image/ext/s.gif';
/*******************/
Ext.Ajax.on('beforerequest', function(conn, opts) {
  Ext.Ajax.extraParams={'loginuserid':userid};
  });
  
</script>

<style type="text/css">
a.x-menu-item {
    cursor: pointer;
    display: block;
    line-height: 16px;
    outline-color: -moz-use-text-color;
    outline-style: none;
    outline-width: 0;
    padding: 3px 12px 3px 27px; /* 重写ext-all.css 解决IE显示问题 */
    position: relative;
    text-decoration: none;
    white-space: nowrap;
}

.x-menu-item-active {
    background-repeat: repeat-x;
    background-position: left bottom;
    border-style:solid;
    border-width: 1px 0;
    margin:0 0px; /* 重写ext-all.css 解决IE显示问题 */
	padding: 0;
}
</style>
<style type="text/css">
#foreach($menu in $menuList)
#window_${menu.menuid}-shortcut img {
	width: 32px;
	height: 32px;
	background-image: url(${contextPath}/resource/desktop/images/shortcut/${menu.shortcut});
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='${contextPath}/resource/desktop/images/shortcut/${menu.shortcut}',
		sizingMethod='scale' );
}
#end
html, body {
	background: url(${contextPath}/resource/desktop/wallpapers/${background}) repeat right top;
	background-size:100%;
	}
</style>

</head>
<body scroll="no">
	<div id="themeTreeDiv" class="x-hidden"  ></div>
	<div id="previewDiv" class="x-hidden"  >
		<img src="${contextPath}/resource/image/theme/${theme}.jpg" />
	</div>
	
	<div id="layoutTreeDiv" class="x-hidden"  ></div>
	<div id="layout_previewDiv" class="x-hidden"  >
		<img src="${contextPath}/resource/image/theme/layout/${layout}.jpg" />
	</div>
	
	<div id="backgroundTreeDiv" class="x-hidden"  ></div>
	<div id="background_previewDiv" class="x-hidden"  >
		<img src="${contextPath}/resource/desktop/wallpapers/mini/${background}" />
	</div>
	
	<div id="x-desktop">
		<dl id="x-shortcuts">
		#foreach($menu in $menuList)
			<dt id="window_${menu.menuid}-shortcut">
				<a href="#"><img src="${contextPath}/resource/image/ext/s.gif" />
					<div class="commoncss">${menu.menuname}</div></a>
			</dt>
		#end
		</dl>
    </div>

	<div id="ux-taskbar">
		<div id="ux-taskbar-start"></div>
		<div id="ux-taskbuttons-panel"></div>
		<div class="x-clear"></div>
	</div>
</body>

<script type="text/javascript">
	MyDesktop = new Ext.app.App({
		init : function() {
			Ext.QuickTips.init();
		},
		getModules : function() {
			return [ 
			#set($size = $menuList.size()) 
			#foreach($menu in $menuList)
			  #if($velocityCount != $size) 
                new MyDesktop.Window_${menu.menuid}(),  
              #else
                 new MyDesktop.Window_${menu.menuid}()
              #end 
			 #end
			];
		},

		// config for the start menu
		getStartConfig : function() {
			return {
				title : '<span class=commoncss>${username}[${account}]</span>',
				iconCls : 'userIcon',
				toolItems : [ {
					text : '皮肤设置',
					iconCls : 'bugIcon',
					handler:function(){
					  themeWindowInit();
					},
					scope : this
				}, {
					text : '布局方案',
					iconCls : 'app_rightIcon',
					handler:function(){
					  layoutWindowInit();
					},
					scope : this
				},  {
					text : '桌面背景',
					iconCls : 'window_caise_listIcon',
					handler:function(){
					  backgroundWindowInit();
					},
					scope : this
				}, '-', {
					text : '密码修改',
					iconCls : 'keyIcon',
					handler:function(){
					  updateUserInit();
					},
					scope : this
				}, '-', {
					text : '系统锁定',
					iconCls : 'lockIcon',
					handler:function(){
					    lockWindow.show();
						setCookie("g4.lockflag", '1', 240);
					},
					scope : this
				}, '-', {
					text : '安全退出',
					tooltip:'安全退出',
					iconCls : 'deleteIcon',
					handler:function(){
					  logout();
					},
					scope : this
				} ]
			};
		}
	});

#foreach($menu in $menuList)
	MyDesktop.Window_${menu.menuid} = Ext.extend(
					Ext.app.Module,
					{
						id : 'window_${menu.menuid}',
						init : function() {
							this.launcher = {
								text : '${menu.menuname}',
								iconCls : 'bogus',
								handler : this.createWindow,
								scope : this
							}
						},
						createWindow : function(src) {
							var desktop = this.app.getDesktop();
							var win = desktop.getWindow('window_${menu.menuid}');
							if (!win) {
								win = desktop
										.createWindow({
											id : 'window_${menu.menuid}',
											layout : 'fit', 
											title : '  ${menu.menuname}',
											//iconCls : 'applicationIcon',
											width : ${menu.width},
											height : ${menu.height},
											maximized :${menu.maxed},
											bodyStyle : 'background-color:#FFFFFF',
											//closeAction : 'close', 
											//collapsible : true, 
											pageY : document.body.clientHeight / 2 - ${menu.height} / 2,
				                            pageX : document.body.clientWidth / 2 - ${menu.width} / 2,
											animCollapse : true,
											animateTarget : Ext.getBody(),
											border : false,
											constrainHeader : true,
											constrain: true,
											html : '<iframe id="topMain" scrolling="${menu.scrollbar}" frameborder="0" style="width:100%;height:100%;" src="${menu.request}"></iframe>'
										});
							}
							win.show();
						}
					});
#end

/**************************/
	var userFormPanel = new Ext.form.FormPanel({
				defaultType : 'textfield',
				labelAlign : 'right',
				labelWidth : 70,
				frame : false,
				bodyStyle : 'padding:5 5 0',
				items : [{
							fieldLabel : '登录帐户',
							name : 'account',
							id : 'account',
							allowBlank : false,
							readOnly : true,
							fieldClass : 'x-custom-field-disabled',
							anchor : '99%'
						}, {
							fieldLabel : '姓名',
							name : 'username',
							id : 'username',
							allowBlank : false,
							readOnly : true,
							fieldClass : 'x-custom-field-disabled',
							anchor : '99%'
						}, {
							fieldLabel : '当前密码',
							name : 'password2',
							id : 'password2',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							fieldLabel : '新密码',
							name : 'password',
							id : 'password',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							fieldLabel : '确认新密码',
							name : 'password1',
							id : 'password1',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							id : 'userid',
							name : 'userid',
							hidden : true
						}]
			});

	var userWindow = new Ext.Window({
				layout : 'fit',
				width : 300,
				height : 215,
				resizable : false,
				draggable : true,
				closeAction : 'hide',
				modal : true,
				title : '<span class="commoncss">密码修改</span>',
				iconCls : 'keyIcon',
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				constrain : true,
				listeners : {
					'show' : function(obj) {
						Ext.getCmp('password2').focus(true, 200);
					}
				},
				items : [userFormPanel],
				buttons : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						updateUser();
					}
				}, {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						userWindow.hide();
					}
				}]
			});
			
	/**
	 * 修改用户信息
	 */
	function updateUser() {
		if (!userFormPanel.form.isValid()) {
			return;
		}
		password1 = Ext.getCmp('password1').getValue();
		password = Ext.getCmp('password').getValue();
		if (password1 != password) {
			Ext.Msg.alert('提示', '两次输入的密码不匹配,请重新输入!');
			Ext.getCmp('password').setValue('');
			Ext.getCmp('password1').setValue('');
			return;
		}
		userFormPanel.form.submit({
					url : 'index.do?reqCode=updateUserInfo',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						Ext.MessageBox.alert('提示', '密码修改成功', function() {
									userWindow.hide();
								});
					},
					failure : function(form, action) {
						var flag = action.result.flag;
						if (flag == '0') {
							Ext.MessageBox.alert('提示', '您输入的当前密码验证失败,请重新输入',
									function() {
										Ext.getCmp('password2').setValue('');
										Ext.getCmp('password2').focus();
									});
						} else {
							Ext.MessageBox.alert('提示', '密码修改失败');
						}
					}
				});
	}
	
	/**
	 * 加载当前登录用户信息
	 */
	function updateUserInit() {
		userFormPanel.form.reset();
		userWindow.show();
		userWindow.on('show', function() {
					setTimeout(function() {
								userFormPanel.form.load({
											waitTitle : '提示',
											waitMsg : '正在读取用户信息,请稍候...',
											url : 'index.do?reqCode=loadUserInfo',
											success : function(form, action) {
											},
											failure : function(form, action) {
												Ext.Msg
														.alert(
																'提示',
																'数据读取失败:'
																		+ action.failureType);
											}
										});
							}, 5);
				});
	}
/*********************/
	var lockForm = new Ext.form.FormPanel({
		labelWidth : 60,
		defaultType : 'textfield',
		labelAlign : 'right',
		bodyStyle : 'padding:10 5 5 5',
		layout : 'form',
		items : [{
					fieldLabel : '帐户密码',
					name : 'password',
					inputType : 'password',
					id : 'password_lock',
					labelStyle : micolor,
					allowBlank : false,
					maxLength : 50,
					listeners : {
						specialkey : function(field, e) {
							if (e.getKey() == Ext.EventObject.ENTER) {
								unlockSystem();
							}
						}
					},
					anchor : '100%'
				}, {
					xtype : 'panel',
					border : false,
					html : '<div style="font-size:12px;margin-left:10px">(提示:系统已成功锁定,解锁请输入登录帐户密码)</div>'
				}]
	});

	var lockWindow = new Ext.Window({
				title : '<span class="commoncss">系统锁定</span>',
				iconCls : 'lockIcon',
				layout : 'fit',
				width : 320,
				height : 130,
				closeAction : 'hide',
				collapsible : false,
				closable : false,
				maximizable : false,
				border : false,
				modal : true,
				constrain : true,
				animateTarget : Ext.getBody(),
				items : [lockForm],
				listeners : {
					'show' : function(obj) {
						lockForm.form.reset();
						lockForm.findById('password_lock').focus(true, 50);
					}
				},
				buttons : [{
							text : '解锁',
							iconCls : 'keyIcon',
							handler : function() {
								unlockSystem();
							}
						}, {
							text : '重新登录',
							iconCls : 'tbar_synchronizeIcon',
							handler : function() {
								window.location.href = 'login.do?reqCode=logout';
							}
						}]
			});

	function unlockSystem() {
		// showWaitMsg();
		if (!lockForm.form.isValid())
			return;
		var params = lockForm.getForm().getValues();
		Ext.Ajax.request({
					url : 'index.do?reqCode=unlockSystem',
					success : function(response, opts) {
						var resultArray = Ext.util.JSON
								.decode(response.responseText);
						if (resultArray.flag == "1") {
							lockWindow.hide();
							setCookie("g4.lockflag", '0', 240);
						} else {
							Ext.Msg.alert('提示', '密码错误,请重新输入', function() {
										lockForm.form.reset();
										lockForm.findById('password_lock')
												.focus();
									});
						}
					},
					failure : function(response, opts) {
					},
					params : params
				});
	}
	
/*********************/
    function logout(){
			Ext.MessageBox.show({
					title : '提示',
					msg : '确认要注销系统,退出登录吗?',
					width : 250,
					buttons : Ext.MessageBox.YESNO,
					animEl : Ext.getBody(),
					icon : Ext.MessageBox.QUESTION,
					fn : function(btn) {
						if (btn == 'yes') {
								Ext.MessageBox.show({
										title : '请等待',
										msg : '正在注销...',
										width : 300,
										wait : true,
										waitConfig : {
											interval : 50
										}
									});
						  window.location.href = 'login.do?reqCode=logout';
						}
					}
				});
    }
	
/**********************/
	var root = new Ext.tree.TreeNode({
				text : '根节点',
				id : '00'
			});
	var node01 = new Ext.tree.TreeNode({
				text : '蓝色妖姬',
				theme : 'default',
				id : '01'
			});
	var node02 = new Ext.tree.TreeNode({
				text : '粉红之恋',
				theme : 'lightRed',
				id : '02'
			});
	var node03 = new Ext.tree.TreeNode({
				text : '金碧辉煌',
				theme : 'lightYellow',
				id : '03'
			});
	var node04 = new Ext.tree.TreeNode({
				text : '钢铁战士',
				theme : 'gray',
				id : '04'
			});
	var node05 = new Ext.tree.TreeNode({
				text : '绿水青山',
				theme : 'lightGreen',
				id : '05'
			});
	var node06 = new Ext.tree.TreeNode({
				text : '紫色忧郁',
				theme : 'purple2',
				id : '06'
			});
	var node07 = new Ext.tree.TreeNode({
					text : '火红爱情',
					theme : 'red',
					id : '07'
				});
	root.appendChild(node01);
	root.appendChild(node02);
	root.appendChild(node03);
	root.appendChild(node04);
	root.appendChild(node05);
	root.appendChild(node06);
	root.appendChild(node07);
	var themeTree = new Ext.tree.TreePanel({
				autoHeight : false,
				autoWidth : false,
				autoScroll : false,
				animate : false,
				rootVisible : false,
				border : false,
				containerScroll : true,
				applyTo : 'themeTreeDiv',
				root : root
			});
	themeTree.expandAll();
	themeTree.on('click', function(node) {
				var theme = node.attributes.theme;
				var o = document.getElementById('previewDiv');
				o.innerHTML = '<img src="./resource/image/theme/' + theme
						+ '.jpg" />';
			});
			
	var previewPanel = new Ext.Panel({
				region : 'center',
				title : '<span class="commoncss">皮肤预览</span>',
				margins : '3 3 3 0',
				activeTab : 0,
				defaults : {
					autoScroll : true
				},
				contentEl : 'previewDiv'
			});

	var themenav = new Ext.Panel({
		title : '<span class="commoncss">皮肤列表</span>',
		region : 'west',
		split : true,
		width : 120,
		minSize : 120,
		maxSize : 150,
		collapsible : true,
		margins : '3 0 3 3',
		contentEl : 'themeTreeDiv',
		bbar : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						var o = themeTree.getSelectionModel().getSelectedNode();
						saveUserTheme(o);
					}
				}, '->', {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						themeWindow.hide();
					}
				}]
	});

	var themeWindow = new Ext.Window({
				title : '<span class="commoncss">皮肤设置</span>',
				closable : true,
				width : 500,
				height : 350,
				closeAction : 'hide',
				iconCls : 'bugIcon',
				collapsible : true,
				titleCollapse : true,
				border : true,
				maximizable : false,
				resizable : false,
				//modal : true,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				// border:false,
				plain : true,
				layout : 'border',
				items : [themenav, previewPanel]
			});
			
	/**
	 * 皮肤窗口初始化
	 */
	function themeWindowInit() {
		for (i = 0; i < root.childNodes.length; i++) {
			var child = root.childNodes[i];
			if (default_theme == child.attributes.theme) {
				child.select();
			}
		}
		var o = document.getElementById('previewDiv');
		o.innerHTML = '<img src="./resource/image/theme/' + default_theme
				+ '.jpg" />';
		themeWindow.show();

	}

	/**
	 * 保存用户自定义皮肤
	 */
	function saveUserTheme(o) {
		showWaitMsg();
		Ext.Ajax.request({
			url : './index.do?reqCode=saveUserTheme',
			success : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.MessageBox
						.confirm(
								'请确认',
								'您选择的['
										+ o.text
										+ ']皮肤保存成功,立即应用该皮肤吗?<br>提示：页面会被刷新,请先确认是否有尚未保存的业务数据,以免丢失!',
								function(btn, text) {
									if (btn == 'yes') {
										showWaitMsg('正在为您应用皮肤...');
										location.reload();
									} else {
										Ext.Msg.alert('提示',
												'请在任何时候按[F5]键刷新页面或者重新登录系统以启用['
														+ o.text + ']皮肤!',
												function() {
													themeWindow.hide();
												});

									}
								});
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.Msg.alert('提示', '数据保存失败');
			},
			params : {
				theme : o.attributes.theme
			}
		});
	}
	
	/**布局设置**/
	var layout_root = new Ext.tree.TreeNode({
				text : '根节点',
				id : '00'
			});
	var layout_node01 = new Ext.tree.TreeNode({
				text : '传统经典布局',
				layout : '1',
				id : '01'
			});
	var layout_node02 = new Ext.tree.TreeNode({
				text : '个性桌面布局',
				layout : '2',
				id : '02'
			});		
	layout_root.appendChild(layout_node01);
	layout_root.appendChild(layout_node02);	
	var layoutTree = new Ext.tree.TreePanel({
				autoHeight : false,
				autoWidth : false,
				autoScroll : false,
				animate : false,
				rootVisible : false,
				border : false,
				containerScroll : true,
				applyTo : 'layoutTreeDiv',                 
				root : layout_root
			});                                                                                                                                                                             
	layoutTree.expandAll();
	layoutTree.on('click', function(node) {
				var layout = node.attributes.layout;
				var o = document.getElementById('layout_previewDiv');
				o.innerHTML = '<img src="./resource/image/theme/layout/' + layout
						+ '.jpg" />';
			});
			
	var layout_previewPanel = new Ext.Panel({
				region : 'center',
				title : '<span class="commoncss">布局预览</span>',
				margins : '3 3 3 0',
				defaults : {
					autoScroll : true
				},
				contentEl : 'layout_previewDiv'
			});

	var layoutnav = new Ext.Panel({
		title : '<span class="commoncss">布局列表</span>',
		region : 'west',
		split : true,
		width : 120,
		minSize : 120,
		maxSize : 150,
		collapsible : true,
		margins : '3 0 3 3',
		contentEl : 'layoutTreeDiv',
		bbar : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						var o = layoutTree.getSelectionModel().getSelectedNode();
						saveUserLayout(o);
					}
				}, '->', {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						layoutWindow.hide();
					}
				}]
	});
	
	var layoutWindow = new Ext.Window({
				title : '<span class="commoncss">布局设置</span>',
				closable : true,
				width : 723,
				height : 398,
				closeAction : 'hide',
				iconCls : 'app_rightIcon',
				collapsible : true,
				titleCollapse : true,
				border : true,
				maximizable : false,
				resizable : false,
				//modal : true,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				// border:false,
				plain : true,
				layout : 'border',
				items : [layoutnav, layout_previewPanel]
			});	
			
	/**
	 * 布局窗口初始化
	 */
	function layoutWindowInit() {
		for (i = 0; i < layout_root.childNodes.length; i++) {
			var child = layout_root.childNodes[i];
			if (default_layout == child.attributes.layout) {
				child.select();
			}
		}
		var o = document.getElementById('previewDiv');
		o.innerHTML = '<img src="./resource/image/theme/layout/' + default_layout
				+ '.jpg" />';
		layoutWindow.show();

	}

	/**
	 * 保存用户自定义布局
	 */
	function saveUserLayout(o) {
		showWaitMsg();
		Ext.Ajax.request({
			url : './index.do?reqCode=saveUserLayout',
			success : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.MessageBox
						.confirm(
								'请确认',
								'您选择的['
										+ o.text
										+ ']布局保存成功,立即应用该布局吗?<br>提示：页面会被刷新,请先确认是否有尚未保存的业务数据,以免丢失!',
								function(btn, text) {
									if (btn == 'yes') {
										showWaitMsg('正在为您应用布局...');
										location.reload();
									} else {
										Ext.Msg.alert('提示',
												'请在任何时候按[F5]键刷新页面或者重新登录系统以启用['
														+ o.text + ']布局!',
												function() {
													themeWindow.hide();
												});

									}
								});
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.Msg.alert('提示', '数据保存失败');
			},
			params : {
				layout : o.attributes.layout
			}
		});
	}
	
	/**桌面背景设置**/
	var background_root = new Ext.tree.TreeNode({
				text : '根节点',
				id : '00'
			});
	var background_node01 = new Ext.tree.TreeNode({
				text : '经典蓝',
				background : 'desktop1.jpg',
				id : '01'
			});
	var background_node02 = new Ext.tree.TreeNode({
				text : '个性灰',
				background : 'desktop2.jpg',
				id : '02'
			});
	var background_node03 = new Ext.tree.TreeNode({
					text : '天空蓝',
					background : 'desktop3.jpg',
					id : '03'
				});			
	var background_node04 = new Ext.tree.TreeNode({
					text : '清新绿',
					background : 'desktop4.jpg',
					id : '04'
				});		
	var background_node05 = new Ext.tree.TreeNode({
					text : '一点红',
					background : 'desktop5.jpg',
					id : '05'
				});			
	background_root.appendChild(background_node01);
	background_root.appendChild(background_node03);
	background_root.appendChild(background_node02);	
	background_root.appendChild(background_node04);
	//background_root.appendChild(background_node05);
	var backgroundTree = new Ext.tree.TreePanel({
				autoHeight : false,
				autoWidth : false,
				autoScroll : false,
				animate : false,
				rootVisible : false,
				border : false,
				containerScroll : true,
				applyTo : 'backgroundTreeDiv',                 
				root : background_root
			});                                                                                                                                                                             
	backgroundTree.expandAll();
	backgroundTree.on('click', function(node) {
				var background = node.attributes.background;
				var o = document.getElementById('background_previewDiv');
				o.innerHTML = '<img src="./resource/desktop/wallpapers/mini/' + background + '" />';
			});
			
	var background_previewPanel = new Ext.Panel({
				region : 'center',
				title : '<span class="commoncss">桌面背景预览</span>',
				margins : '3 3 3 0',
				defaults : {
					autoScroll : true
				},
				contentEl : 'background_previewDiv'
			});

	var backgroundnav = new Ext.Panel({
		title : '<span class="commoncss">桌面背景列表</span>',
		region : 'west',
		split : true,
		width : 120,
		minSize : 120,
		maxSize : 150,
		collapsible : true,
		margins : '3 0 3 3',
		contentEl : 'backgroundTreeDiv',
		bbar : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						if (runMode == '0') {
							Ext.Msg.alert('提示',
									'系统正处于演示模式下运行,您的操作被取消!该模式下只能进行查询操作!');
							return;
						}
						var o = backgroundTree.getSelectionModel().getSelectedNode();
						saveUserbackground(o);
					}
				}, '->', {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						backgroundWindow.hide();
					}
				}]
	});
	
	var backgroundWindow = new Ext.Window({
				title : '<span class="commoncss">桌面背景设置</span>',
				closable : true,
				width : 600,
				height : 350,
				closeAction : 'hide',
				iconCls : 'window_caise_listIcon',
				collapsible : true,
				titleCollapse : true,
				border : true,
				maximizable : false,
				resizable : false,
				//modal : true,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				// border:false,
				plain : true,
				layout : 'border',
				items : [backgroundnav, background_previewPanel]
			});	
			
	/**
	 * 桌面背景窗口初始化
	 */
	function backgroundWindowInit() {
		for (i = 0; i < background_root.childNodes.length; i++) {
			var child = background_root.childNodes[i];
			if (default_background == child.attributes.background) {
				child.select();
			}
		}
		var o = document.getElementById('previewDiv');
		o.innerHTML = '<img src="./resource/desktop/wallpapers/mini/' + default_background + '" />';
		backgroundWindow.show();

	}

	/**
	 * 保存用户自定义桌面背景
	 */
	function saveUserbackground(o) {
		showWaitMsg();
		Ext.Ajax.request({
			url : './index.do?reqCode=saveUserBackground',
			success : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.MessageBox
						.confirm(
								'请确认',
								'您选择的['
										+ o.text
										+ ']桌面背景保存成功,立即应用该桌面背景吗?<br>提示：页面会被刷新,请先确认是否有尚未保存的业务数据,以免丢失!',
								function(btn, text) {
									if (btn == 'yes') {
										showWaitMsg('正在为您应用桌面背景...');
										location.reload();
									} else {
										Ext.Msg.alert('提示',
												'请在任何时候按[F5]键刷新页面或者重新登录系统以启用['
														+ o.text + ']桌面背景!',
												function() {
													themeWindow.hide();
												});

									}
								});
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.Msg.alert('提示', '数据保存失败');
			},
			params : {
				background : o.attributes.background
			}
		});
	}	
	window.onload=function(){
	   if (getCookie("g4.lockflag") == '1') {
		lockWindow.show();
	  }
	}
</script>
</html>
