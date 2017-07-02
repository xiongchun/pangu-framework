<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="按钮|工具栏|状态栏" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="_id_tabs" region="center" tabPosition="bottom" bodyBorder="0 0 0 0" margin="0 0 2 0">

			<aos:tab title="按钮" border="false">
				<aos:panel layout="anchor">
					<aos:panel layout="hbox" margin="50 0 0 20" anchor="100%">
						<aos:button text="新增" icon="add.png" onclick="fn_add" />
						<aos:button text="修改" icon="edit.png" onclick="!fn_handler" margin="0 0 0 20" />
						<aos:button text="删除" icon="del.png" onclick="#AOS.tip('你点击了删除按钮。')" margin="0 0 0 20" />
						<aos:button text="查看" icon="query.png" disabled="true" tooltip="按钮已禁用" margin="0 0 0 20" />
						<aos:button text="操作" iconVec="fa-wrench" margin="0 0 0 20" />
						<aos:button text="执行" icon="go.gif" margin="0 0 0 20">
							<aos:menu plain="true">
								<aos:menuitem text="下拉菜单①" icon="icq.png" />
								<aos:menuitem text="下拉菜单②" icon="ok.png" />
								<aos:menuitem text="下拉菜单③" />
								<aos:menuitem xtype="menuseparator" />
								<aos:menuitem text="下拉菜单③" icon="ok3.png">
									<aos:menuitem text="嵌套下拉菜单①" icon="webcam.png" />
									<aos:menuitem text="嵌套下拉菜单②" icon="send_receive.png" />
								</aos:menuitem>
							</aos:menu>
						</aos:button>
						<aos:button text="禁用" icon="plugin2.png" onclick="fn_disable" margin="0 0 0 20" />
						<aos:button text="激活" icon="plugin.png" onclick="fn_enable" margin="0 0 0 20" />
						<aos:button text="测试" id="id_test" icon="wand.png" onclick="fn_add" margin="0 0 0 20" />
					</aos:panel>

					<aos:panel layout="hbox" margin="50 0 0 20" anchor="100%">
						<aos:button text="新增" icon="add.png" scale="medium" onclick="fn_add" />
						<aos:button text="修改" icon="edit.png" scale="medium" onclick="!fn_handler" margin="0 0 0 20" />
						<aos:button text="删除" icon="del.png" scale="medium" onclick="#AOS.tip('你点击了删除按钮。')" margin="0 0 0 20" />
						<aos:button text="查看" icon="query.png" scale="medium" disabled="true" tooltip="按钮已禁用" margin="0 0 0 20" />
						<aos:button text="操作" iconVec="fa-wrench" scale="medium" margin="0 0 0 20" />
						<aos:button text="执行" iconVec="fa-arrow-circle-right" scale="medium" margin="0 0 0 20">
							<aos:menu plain="true">
								<aos:menuitem text="下拉菜单①" />
								<aos:menuitem text="下拉菜单②" />
								<aos:menuitem text="下拉菜单③" />
							</aos:menu>
						</aos:button>
						<aos:button text="新增" iconVec="fa-check-square-o" scale="medium" onclick="fn_add" margin="0 0 0 20" />
					</aos:panel>

					<aos:panel layout="hbox" margin="50 0 0 20" anchor="100%">
						<aos:button text="新增" icon="add.png" scale="large" onclick="fn_add" />
						<aos:button text="修改" icon="edit.png" scale="large" onclick="!fn_handler" margin="0 0 0 20" />
						<aos:button text="删除" icon="del.png" scale="large" onclick="#AOS.tip('你点击了删除按钮。')" margin="0 0 0 20" />
						<aos:button text="查看" icon="query.png" scale="large" disabled="true" tooltip="按钮已禁用" margin="0 0 0 20" />
						<aos:button text="操作" iconVec="fa-wrench" scale="large" margin="0 0 0 20" />
						<aos:button text="新增" icon="add2.png" scale="large" onclick="fn_add" margin="0 0 0 20" />
						<aos:button text="执行" icon="go.gif" arrowAlign="bottom" scale="medium" margin="0 0 0 20">
							<aos:menu plain="true">
								<aos:menuitem text="下拉菜单①" icon="icq.png" />
								<aos:menuitem text="下拉菜单②" icon="ok.png" />
							</aos:menu>
						</aos:button>
						<aos:button text="修改" icon="edit2.png" iconAlign="top" margin="0 0 0 20" />
						<aos:button text="删除" icon="del.png" iconAlign="bottom" onclick="#AOS.tip('你点击了我。')" margin="0 0 0 20" />
					</aos:panel>

					<aos:iframe src="do.jhtml?router=demoService.initToggle&juid=${juid}" margin="40 0 0 20"   anchor="100% 50%" />

				</aos:panel>

			</aos:tab>

			<aos:tab title="消息提示">
				<aos:panel layout="hbox" margin="50 0 0 20" anchor="100%">
					<aos:button text="提示信息" onclick="fnmsg1" scale="medium" />
					<aos:button text="警告信息" onclick="#AOS.warn('这是一个警告信息');" scale="medium" margin="0 0 0 20" />
					<aos:button text="错误信息" onclick="fnmsg2" scale="medium" margin="0 0 0 20" />
					<aos:button text="确认信息" onclick="fnmsg3" scale="medium" margin="0 0 0 20" />
					<aos:button text="等待信息" onclick="fnmsg4" scale="medium" margin="0 0 0 20" />
					<aos:button text="滑动信息" onclick="fnmsg5" scale="medium" margin="0 0 0 20" />
					<aos:button text="滑动信息全家福" onclick="msgAll()" scale="medium" margin="0 0 0 20" />
				</aos:panel>
			</aos:tab>

			<aos:tab title="停靠栏(工具栏、状态栏)" layout="anchor" onactivate="fnBusy2">
				<aos:panel title="面板1：信用卡申请列表" anchor="100% 20%" headerBorder="1 0 0 0">
					<aos:docked border="1 1 1 0">
						<aos:dockeditem text="新增" icon="add.png" />
						<aos:dockeditem text="修改" icon="edit.png" />
						<aos:dockeditem text="删除" icon="del.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem xtype="button" text="操作" icon="config.png">
							<aos:menu>
								<aos:menuitem text="新增" icon="add.png" />
								<aos:menuitem text="编辑" icon="edit.png">
									<aos:menuitem text="复制" icon="copy.png" />
									<aos:menuitem text="粘贴" icon="cut.png" />
								</aos:menuitem>
							</aos:menu>
						</aos:dockeditem>
						<aos:dockeditem xtype="tbfill" />
						<aos:combobox id="id_card_type_" fieldLabel="卡类型" value="1" labelAlign="right" dicField="card_type_" />
						<aos:textfield id="name_" labelAlign="right" fieldLabel="姓名" labelWidth="50" emptyText="姓名" width="220" />
						<aos:dockeditem text="查询" icon="query.png" />
					</aos:docked>
				</aos:panel>
				<aos:panel title="面板2：信用卡申请人基本信息" anchor="100% 30%" headerBorder="1 0 0 0">
					<aos:docked border="1 0 1 0">
						<aos:dockeditem text="新增" icon="add.png" />
						<aos:dockeditem text="修改" disabled="true" icon="edit.png" />
						<aos:dockeditem text="删除" disabled="true" icon="del.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem text="禁用" onclick="fn_disable1" icon="plugin2.png" />
						<aos:dockeditem text="激活" onclick="fn_enable1" icon="plugin.png" />
						<aos:dockeditem text="测试" id="id_test1" icon="wand.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem text="禁用工具栏" onclick="fn_disable2" icon="plugin2.png" />
						<aos:dockeditem text="激活工具栏" onclick="fn_enable2" icon="plugin.png" />
					</aos:docked>

					<aos:docked forceBoder="1 0 0 0" dock="bottom" id="id_docked">
						<aos:dockeditem text="新增" icon="add.png" />
						<aos:dockeditem text="修改" icon="edit.png" />
						<aos:dockeditem text="删除" icon="del.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem xtype="tbtext" text="工具栏上面也可以显示文本信息。" />
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem xtype="tbtext" text="工具栏也可以显示在容器型组件的下方。" />
					</aos:docked>
				</aos:panel>
				<aos:panel title="面板3：信用卡申请人影像件（演示状态栏）" anchor="100% 50%" headerBorder="1 0 0 0">

					<aos:docked id="_id_statusbar" forceBoder="1 0 1 0" xtype="statusbar" dock="bottom" iconCls="status-ok"
						text="影像件加载完成" defaultText="缺省文本信息">
						<aos:dockeditem xtype="button" text="加载" onclick="fnBusy" icon="down.png" />
						<aos:dockeditem xtype="button" text="加载完成" onclick="fnOk" icon="ok1.png" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem xtype="button" text="清空" onclick="fnClear" icon="refresh.png" />
					</aos:docked>
				</aos:panel>
			</aos:tab>

		</aos:tabpanel>

	</aos:viewport>

	<script type="text/javascript">
	
		//响应事件
		function fn_add(){
			AOS.tip('你点击了新增按钮。');
		}
		
	    //响应事件，可以将按钮点击事件句柄obj传过来
		function fn_handler(obj){
			AOS.tip('你点击了：' + obj.text + '。');
		}
	    
	    //激活测试按钮
	    function fn_enable(){
	    	AOS.enableCmps('id_test');
	    	AOS.tip('启用测试按钮。');
	    }
	    
	    //禁用测试按钮
	    function fn_disable(){
	    	AOS.disableCmps('id_test');
	    	AOS.tip('禁用测试按钮。');
	    }
	    
	    //激活测试按钮
	    function fn_enable1(){
	    	AOS.enableCmps('id_test1');
	    	AOS.tip('启用测试按钮。');
	    }
	    
	    //禁用测试按钮
	    function fn_disable1(){
	    	AOS.disableCmps('id_test1');
	    	AOS.tip('禁用测试按钮。');
	    }
	    
	    //激活工具栏
	    function fn_enable2(){
	    	AOS.enableCmps('id_docked');
	    	AOS.tip('启用工具栏。');
	    }
	    
	    //禁用工具栏
	    function fn_disable2(){
	    	AOS.disableCmps('id_docked');
	    	AOS.tip('禁用工具栏。');
	    }
	    
	    //状态栏的正在加载方法
		function fnBusy() {
			_id_statusbar.showBusy('正在加载影像件...');
		}
	    
		//状态栏的正在加载方法
	    function fnBusy2(){
	    	AOS.job(function(){
	    		_id_statusbar.showBusy('正在加载影像件...');
	    	},500);
	    }

	    //状态栏加载完成
		function fnOk() {
			_id_statusbar.setStatus({
				text : '加载完成',
				iconCls : 'status-ok'
				//设置的text是否会在一段间隔后自动消失并显示toobar设置的defaultText
				//clear : true
			});
		}

	    //状态栏重置
		function fnClear() {
			_id_statusbar.clearStatus();
		}
	    
		function fnmsg1() {
			AOS.info('数据保存成功');
		}

		function fnmsg2() {
			AOS.err('程序出错啦!');
		}

		function fnmsg3() {
			AOS.confirm('真的要放弃保存数据吗？', function(btn) {
				if(btn == 'ok'){
					AOS.info('你点击了确认按钮');
				}else{
					AOS.warn('你点击了取消按钮');
				}
			});
		}

		function fnmsg4() {
			AOS.wait('正在保存数据，请稍候...');
			AOS.job(function() {
				//请在需要结束等待窗口的地方调用此函数
				AOS.hide();
			}, 1000);
		}

		function fnmsg5() {
			AOS.tip('演示滑动提示框！');
		}
		
	    var msg1 = 'AOSuite开发套件基于JavaEE技术体系，以“标准功能可复用、通用模块可配置、行业需求快速开发、异构系统无缝集成”为目标，为软件开发团队提供高效可控、随需应变、快速实现业务需求的全栈式技术解决方案。帮助企业落实IT策略、屏蔽技术壁垒，快速实现业务愿景。使其获得更低成本、更高质量、更快交付业务和运维支持的核心技术竞争力。';
		
	    function fnnoti1() {
			Ext.create(
							'widget.uxNotification',
							{
								position : 'br',
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								closable : false,
								autoCloseDelay : 2000,
								slideInDuration : 200,
								useXAxis : false,
								width : 400,
								html : msg1
							}).show();
		}

		function fnnoti6() {
			Ext.create(
							'widget.uxNotification',
							{
								position : 'bl',
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								closable : false,
								autoCloseDelay : 2000,
								slideInDuration : 200,
								useXAxis : true,
								width : 400,
								html : msg1
								}).show();
		}

		function fnnoti2() {
			Ext.create(
							'widget.uxNotification',
							{
								position : 'tl',
								title : '<span class="app-container-title-normal"><i class="fa fa-volume-up"></i> 通知</span>',
								closable : true,
								autoCloseDelay : 1000,
								slideInDuration : 1500,
								slideInAnimation : 'elasticIn',
								html : '细节决定成败，态度决定品质！'
							}).show();
		}

		function fnnoti3() {
			Ext.create(
							'widget.uxNotification',
							{
								position : 't',
								cls : 'ux-notification-light',
								closable : true,
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								slideInDuration : 200,
								slideBackDuration : 1000,
								autoCloseDelay : 2000,
								slideInAnimation : 'ease',
								html : '细节决定成败，态度决定品质！'
							}).show();
		}

		function fnnoti4() {
			Ext.create(
							'widget.uxNotification',
							{
								position : 'tr',
								cls : 'ux-notification-light',
								closable : true,
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								slideInDuration : 200,
								autoCloseDelay : 1000,
								width : 320,
								html : "It's AOSuite, enjoy it!"
							}).show();
		}

		function fnnoti5() {
			AOS.tip('AOSuite开发套件');
		}
		
		function msgAll(){
			fnnoti1();
			fnnoti2();
			fnnoti3();
			fnnoti4();
			fnnoti5();
			fnnoti6();
		}
	    
	</script>
</aos:onready>