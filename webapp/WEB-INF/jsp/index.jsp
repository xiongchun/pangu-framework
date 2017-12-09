<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="${app_title}" base="http" lib="ext,buttons,filter">
<link rel="stylesheet" type="text/css" href="${cxt}/static/css/modules/index.css" />
<style type="text/css">
.north_el {
	height: 60px;
	background-image:
		url('${cxt}/static/image/background/index/${north_back_img}');
}

.main_text {
	color: ${main_text_color}
}

.nav_text {
	color: ${nav_text_color}
}
#loading-mask {
	z-index: 20000;
	left: 0px;
	top: 0px;
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	background-color: ${south_back_color};
}
</style>
<aos:body>
	<%-- 显示loading --%>
	<div id="loading-mask"></div>
	<div id="loading">
		<c:choose>
			<c:when test="${page_load_gif_ == 'run.gif'}">
				<img src="${cxt}/static/image/gif/pageload/${page_load_gif}">
			</c:when>
			<c:otherwise>
				<img width="100" height="100" src="${cxt}/static/image/gif/pageload/${page_load_gif}">
			</c:otherwise>
		</c:choose>
	</div>
	<%-- Center导航 --%>
	<div id="div_center">
		<iframe id="iframe_main" src="do.jhtml?router=homeService.initPortal&juid=${juid}"></iframe>
	</div>
	<%-- Banner导航 --%>
	<div id="div_north_el" class="x-hidden north_el">
		<table style="width: 100%">
			<tr>
				<td width="300px"><img src="${cxt}/static/image/logo/left-logo.png"></td>
				<td align="left"><c:if test="${navDto.is_show_top_nav == '1' && fn:length(cardDtos) > 1}">
						<c:if test="${navDto.nav_button_style == 'tight' }">
							<div class="button-group">
								<c:forEach var="card" items="${cardDtos}">
									<button id="id_nav_${card.id}" type="button" onclick="fn_nav_btn_click('${card.id}');"
										class="${navDto.nav_bar_style}">
										<c:if test="${card.vector != null}">
											<i id="id_icon_${card.id}" class="fa ${card.vector}"></i>
										</c:if>
										${card.name}
									</button>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${navDto.nav_button_style == 'standalone' }">
							<c:forEach var="card" items="${cardDtos}">
								<a id="id_nav_${card.id}" onclick="fn_nav_btn_click('${card.id}');" class="${navDto.nav_bar_style}"> <c:if
										test="${card.vector_ != null}">
										<i id="id_icon_${card.id}" class="fa ${card.vector}"></i>
									</c:if> ${card.name}
								</a>
							</c:forEach>
						</c:if>
					</c:if></td>
				<td align="right" style="padding: 5px;" width="260px">
					<table style="border-spacing: 3px;">
						<tr align="right">
							<td colspan="4" class="main_text" style="padding-right: 12px;"><nobr>
									${date} ${week} <span id="rTime"></span>
								</nobr></td>
						<tr>
						<tr align="right">
							<td><a class="${navDto.right_button_style}" onmouseout="_btn_onmouseout(this)" onclick="fn_show_myinfo()"
								onmouseover="_btn_onmouseover(this);"><i class="fa fa-github-square"></i> 个人设置</a> <a
								class="${navDto.right_button_style}" onmouseout="_btn_onmouseout(this)" onclick="fn_show_mypwd()"
								onmouseover="_btn_onmouseover(this);"><i class="fa fa-key"></i> 修改密码</a> <a class="${navDto.right_button_style}"
								onclick="fn_logout()" onmouseout="_btn_onmouseout(this)" onmouseover="_btn_onmouseover(this);"><i
									class="fa fa-power-off"></i> 退出</a></td>
						<tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div id="div_south_el" class="x-hidden">
		<div class="south_el_left main_text">
			<i class="fa fa-pagelines"></i> ${welcome_msg}, ${user_name}. 所属组织:${org_name}.
		</div>
		<div class="south_el_right main_text">
			<i class="fa fa-copyright"></i> ${copyright}
		</div>
	</div>
</aos:body>
</aos:html>

<aos:onready ux="iframe">
	<aos:viewport layout="border">
		<aos:panel id="b_north" region="north" contentEl="div_north_el" height="60" maxHeight="60" minHeight="60"
			border="false" header="false" collapsible="true" collapseMode="mini" split="true">
		</aos:panel>

		<aos:panel id="b_south" region="south" contentEl="div_south_el" height="18" border="false" header="false"
			bodyStyle="backgroundColor:'${south_back_color}'">
		</aos:panel>

		<aos:tabpanel id="b_west" region="west" activeTab="0" plain="true" tabBarHeight="30" bodyBorder="0 1 1 1" split="true"
			maxWidth="300" border="true" minWidth="220" width="240" collapsible="true" collapseMode="mini" header="false">
			<aos:tab id="sys_nav" title="系统导航" layout="accordion" animate="false">
				<aos:docked forceBoder="0 0 1 0">
					<aos:triggerfield id="id_filter" emptyText="过滤功能菜单..." trigger1Cls="x-form-search-trigger"
						onchange="fn_find_modules" onTrigger1Click="fn_find_modules" width="185" />
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="" tooltip="更多选型" icon="icon141.png">
						<aos:menu>
							<aos:menuitem text="个人设置" icon="user20.png" onclick="fn_show_myinfo" />
							<aos:menuitem text="修改密码" icon="key.png" onclick="fn_show_mypwd" />
							<aos:menuitem xtype="menuseparator" />
							<%-- <aos:menuitem text="锁定离开" icon="lock.png" onclick="fn_find_modules" /> --%>
							<aos:menuitem text="安全退出" icon="close2.png" onclick="fn_logout" />
						</aos:menu>
					</aos:dockeditem>
				</aos:docked>
				<c:forEach var="card" items="${cardDtos}">
					<aos:treepanel id="id_card_${card.id}" onitemclick="fn_node_click" onexpand="fn_card_onexpand"
						oncollapse="fn_find_modules" icon="${card.icon_name}" title="${card.name}" rootVisible="false"
						rootId="${card.cascade_id}" url="homeService.getCardTree" nodeParam="cascade_id">
					</aos:treepanel>
				</c:forEach>
			</aos:tab>
			<aos:tab title="发现">
			</aos:tab>
		</aos:tabpanel>
		<aos:tabpanel id="tabs" region="center" activeTab="0" plain="true" tabBarHeight="30" bodyBorder="0 1 1 1">
			<aos:plugins>
				<aos:tabCloseMenu extraItemsTail1="最大化 还原:fn_collapse_expand:shape_move_back.png"
					extraItemsTail2="刷新:fn_reload:refresh2.png" />
				<aos:tabReorderer />
			</aos:plugins>
			<aos:tab id="id_tab_welcome" reorderable="false" title="${welcome_page_title}" contentEl="div_center" />
		</aos:tabpanel>
	</aos:viewport>

	<aos:window id="w_myinfo" title="我的个人设置" iconVec="fa-github-square" iconVecSize="15" resizable="false"
		onshow="w_myinfo_onshow">
		<aos:formpanel id="f_myinfo" width="650" labelWidth="65">
			<aos:fieldset title="基础信息" labelWidth="75" columnWidth="1">
				<aos:textfield name="org_name" fieldLabel="所属部门" readOnly="true" columnWidth="0.5" />
				<aos:textfield name="name" fieldLabel="姓名" allowBlank="false" maxLength="20" columnWidth="0.49" />
				<aos:combobox name="sex" fieldLabel="性别" allowBlank="false" dicField="sex" value="3" columnWidth="0.5" />
				<aos:textfield name="email" fieldLabel="电子邮件" vtype="email" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="mobile" fieldLabel="联系电话" maxLength="50" columnWidth="0.5" />
				<aos:textfield name="idno" fieldLabel="身份证号" maxLength="50" columnWidth="0.49" />
				<aos:textfield name="address" fieldLabel="联系地址" maxLength="500" columnWidth="0.99" />
				<aos:textareafield name="remark" fieldLabel="备注" maxLength="4000" height="60" columnWidth="0.99" />
			</aos:fieldset>
			<aos:fieldset title="配置信息" labelWidth="75" columnWidth="1">
				<aos:combobox name="skin" fieldLabel="界面皮肤" allowBlank="false" dicField="skin" value="blue" columnWidth="0.5" />
				<aos:textfield name="biz_code" fieldLabel="扩展码" maxLength="200" readOnly="true" columnWidth="0.49" />
			</aos:fieldset>
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_myinfo_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_myinfo.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<aos:window id="w_mypwd" title="修改密码" iconVec="fa-key" iconVecSize="15" resizable="false"
		onshow="#AOS.reset(f_mypwd);">
		<aos:formpanel id="f_mypwd" width="400" labelWidth="75">
			<aos:textfield name="password" fieldLabel="原密码" inputType="password" allowBlank="false" maxLength="20"
				columnWidth="0.99" />
			<aos:textfield name="new_password" fieldLabel="新密码" inputType="password" allowBlank="false" maxLength="20"
				columnWidth="0.99" />
			<aos:textfield name="confirm_new_password" fieldLabel="确认新密码" inputType="password" allowBlank="false" maxLength="20"
				columnWidth="0.99" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_mypwd_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_mypwd.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>

	<script type="text/javascript">
	    //快速过滤
		function fn_find_modules(){
			<c:forEach var="card" items="${cardDtos}">
			    	Ext.getCmp('id_card_${card.id}').filterByText(id_filter.getValue());
			</c:forEach>
		}
		
		//获取我的个人设置信息
		function w_myinfo_onshow(){
			AOS.ajax({
				url : 'homeService.getUser',
				ok : function(data) {
					f_myinfo.form.setValues(data);
				}
			});
		}
		
		//修改我的个人设置信息
		function f_myinfo_save(){
			AOS.ajax({
				forms : f_myinfo,
				url : 'homeService.updateMyInfo',
				ok : function(data) {
					AOS.tip(data.appmsg);
					w_myinfo.hide();
					if(data.is_skin_changed_ == '1'){
						AOS.job(function(){
							location.reload();
						},200)
					}
				}
			});
		}
		
		//修改我的密码
		function f_mypwd_save(){
			AOS.ajax({
				forms : f_mypwd,
				url : 'homeService.updateMyPwd',
				ok : function(data) {
					if(data.appcode == '1'){
						AOS.tip(data.appmsg);
						w_mypwd.hide();
					}else{
						AOS.err(data.appmsg);
					}
				}
			});
		}
		
	    //刷新当前活动卡片
	    function fn_reload(){
	    	var cur_tab_id = tabs.getLayout().activeItem.id;
	    	if(cur_tab_id === 'id_tab_welcome'){
	    		Ext.get('iframe_main').dom.contentWindow.location.reload();
	    	}else{
	    		Ext.getCmp(cur_tab_id + '.iframe').load();
	    	}
	    }
	    
	    //最大化 还原
	    function fn_collapse_expand(){
	    	b_west.toggleCollapse();
	    	b_north.toggleCollapse();
	    }
		
		//响应卡片展开事件
		function fn_card_onexpand(me, eOpts) {
			var id_ = me.id.substr(9)
			fn_nav_btn_click(id_);
		}

		//响应导航菜单树节点单击事件
		function fn_node_click(view, record, item, index, e) {
			//菜单节点所属的那个卡片标识，也是当前菜单树的根节点
			var root_id = record.getPath().split('/')[2];
			var url =  record.raw.a;
			if (!Ext.isEmpty(url)) {
				fnaddtab(url,record.raw.text,record.raw.id,  root_id);
			}else{
				if(record.raw.leaf){
					 AOS.tip('没有配置菜单的请求地址。');
				}
			}
		}
		
		//响应快捷菜单单击事件
		function fn_quick_click(id, name, url) {
			fnaddtab(id, name, url);
		}
		
		b_west.setActiveTab(0);
	</script>
</aos:onready>

<script type="text/javascript">
	//打开菜单功能页面
	function fnaddtab(url, menuname, module_id, root_id) {
		if (Ext.isEmpty(url)) {
			return;
		}
		var id = "id_tab_" + module_id;
		url = url.indexOf('http://') === 0 ? url : '${cxt}/http/do.jhtml?router=' + url;
		var index = url.indexOf('?');
		//一级菜单的主页面所属的页面元素其pageid_同moduleid_。
		url = url + (index === -1 ? '?' : '&') + 'juid=${juid}' + '&aos_module_id=' + module_id;
		var tabs = Ext.getCmp('tabs');
		var tab = tabs.getComponent(id);
		var tempflag = 0;
		if (!tab) {
			var iframe = Ext.create('AOS.ux.IFrame', {
				id : id + '.iframe',
				mask : true,
				layout : 'fit',
				//这个参数仅起到将iframe组件自带的mask调节到相对居中位置的作用
				height : document.body.clientHeight - 200,
				loadMask : '${page_load_msg}'
			});
			tab = tabs.add({
				id : id,
				module_id: module_id, //供Tab与导航树逆向联动使用。
				root_id: root_id, //菜单节点所属的那个卡片标识，也是当前菜单树的根节点。供Tab与导航树逆向联动使用。
				title : '<span class="app-container-title-normal">' + menuname + '</span>',
				closable : true,
				layout : 'fit',
				items : [ iframe ]
			});
			tab.on('activate', function() {
				//防止已打开的功能页面切回时再次加载
				if (tempflag === 0) {
					iframe.load(url);
					tempflag = 1;
				}
				//切换的时候和导航树保持同步
				fn_sync_tab_tree(tab);
			});
		}
		//激活新增Tab
		tabs.setActiveTab(tab);
	}
	
	//切换卡片的时候和导航树保持同步
	function fn_sync_tab_tree(tab){
		if(AOS.empty(tab.root_id) || AOS.empty(tab.module_id)){
			return;
		}
		var sys_nav_tab = Ext.getCmp('sys_nav');
		if(!sys_nav_tab.isVisible()){
			return;
		}
		var expanded_tree = Ext.getCmp('id_card_' + tab.root_id);
		var expanded_tree_store = expanded_tree.getStore();
		var cur_node = expanded_tree_store.getById(tab.module_id);
		if(AOS.empty(cur_node)) return;
		//如果节点所属卡片不可见，则使之可见
		fn_nav_left_mode1(tab.root_id);
		//如果节点不可见，则使之可见
		if(!cur_node.isVisible()) expanded_tree.expandPath(cur_node.getPath());
		var sm = expanded_tree.getSelectionModel();
		sm.select(cur_node);
	}

	//当前已按下的导航按钮
	var g_visited_domid = '';
	//横向导航和左侧导航的互动
	function fn_nav_btn_click(id_) {
		//重定位当前卡片位
		var sys_nav = Ext.getCmp('sys_nav');
		if(!sys_nav.isVisible()){
			Ext.getCmp('b_west').setActiveTab(sys_nav);
		}
		var domid = 'id_nav_' + id_;
		var dom_obj = Ext.getDom(domid);
		if (!AOS.empty(g_visited_domid)) {
			var dom_visited = Ext.getDom(g_visited_domid);
			dom_visited.className = '${navDto.nav_bar_style}';
			//停止ICON转动
			if(Ext.get(dom_visited).down('i')) Ext.get(dom_visited).down('i').removeCls('fa-spin');
		}
		//ICON转动
		if(Ext.get(dom_obj).down('i')) Ext.get(dom_obj).down('i').addCls('fa-spin');
		dom_obj.className = '${navDto.nav_bar_style_visited}';
		g_visited_domid = domid;
		fn_nav_left_mode1(id_);
	}

	//当导航模式为1时，水平和左侧导航的互动模式
	function fn_nav_left_mode1(id) {
		var cmpid = 'id_card_' + id;
		var cmp_card = Ext.getCmp(cmpid);
		if (cmp_card.getCollapsed()) {
			cmp_card.expand(true)
		}
	}

	//移除首页正在加载的缓冲div
	Ext.EventManager.on(window, 'load', function() {
		AOS.job(function() {
			Ext.get('loading').fadeOut({
				duration : 500, //遮罩渐渐消失
				remove : true
			});
			Ext.get('loading-mask').fadeOut({
				duration : 500,
				remove : true
			});
		}, 0); //做这个延时，只是为在Dom加载很快的时候GIF动画效果更稍微显著一点

	});

	//注销
	function fn_logout() {
		AOS.confirm('注销并安全退出系统吗？', function(btn) {
			if (btn === 'cancel') {
				AOS.tip('操作被取消。');
				return;
			}
			AOS.mask('正在注销, 请稍候...');
			AOS.ajax({
				url : 'homeService.logout',
				wait : false,
				ok : function(data) {
					AOS.unmask();
					window.location.href = 'do.jhtml?router=homeService.initLogin';
				}
			});
		});
	}

	//打开我的个人设置
	function fn_show_myinfo() {
		Ext.getCmp('w_myinfo').show();
	}
	
	//打开修改密码窗口
	function fn_show_mypwd(){
		Ext.getCmp('w_mypwd').show();
	}

	//按钮矢量图标动画控制
	function _btn_onmouseout(me) {
		//停止ICON转动
		Ext.get(me).down('i').removeCls('fa-spin');
	}

	//按钮矢量图标动画控制
	function _btn_onmouseover(me) {
		//ICON转动
		Ext.get(me).down('i').addCls('fa-spin');
	}

	//显示系统时钟
	function showTime() {
		Ext.get('rTime').update(Ext.Date.format(new Date(), 'H:i:s'));
	}

	//加载完毕执行函数
	window.onload = function() {
		showTime();
		AOS.task(showTime, 1000);
		//页面加载完毕后选中第一个导航按钮
		if (!AOS.empty('${first_card_id}')) {
			var nav_tab_index_ = '0';
			if(nav_tab_index_ === '0'){
				fn_nav_btn_click('${first_card_id}');
			}
		}
	}
	
	<c:if test="${run_mode == '2'}">
    //在线演示系统自动弹出加入QQ群对话框
    window.onload=function(){
   	 setTimeout(function(){
				var downloadIframe = document.createElement('iframe');
				downloadIframe.src = '${qq_group_link}';
				downloadIframe.style.display = "none";
				document.body.appendChild(downloadIframe);
   	 },20000);
    };	
   </c:if>
</script>