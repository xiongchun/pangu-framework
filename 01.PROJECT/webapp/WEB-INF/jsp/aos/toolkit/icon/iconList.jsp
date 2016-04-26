<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="图标详细列表">
	<aos:base href="system/icon" />
	<aos:include lib="ext" />
	<style type="text/css">
		#_icons div.icon {
			float: left;
			padding: 5px 5px;
			margin: 3px;
			line-height: 15px;
			height: ${height_}px;
			width: 100px;
			overflow: hidden;
			border-top: 1px solid transparent;
			text-align: center;
			color: #222222;
			font-size: 13px;
			cursor: pointer;
		}
		
		#_icons div.icon img {
			margin-bottom: 3px;
		}
		
		#_icons div.icon-hover {
			border: 1px solid #DFDFDF !important;
		}
		
		#_icons .x-item-selected {
			border: 1px solid #EEEEEE !important;
		}
    </style>
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel border="false" autoScroll="true">
			<aos:docked forceBoder="0 0 1 0" onrender="_icons_query">
				<aos:triggerfield emptyText="图标名称" name="name_" id="_name_" onenterkey="_icons_filter"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_icons_filter" width="180" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem xtype="tbtext" text="复制图标名称:" />
				<aos:textfield id="_detail" width="200" readOnly="true" emptyText="当前选中图标" />
				<c:if test="${type_ != '3' }">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem  text="同步更新" icon="send_receive.png" onclick="_fn_sync" />
				</c:if>
			</aos:docked>
			<%-- 如果客户端是IE，则需要禁止动画。否则动画会出现瑕疵。提示：已经在标签内部实现。  --%>
			<aos:dataview fields="name_,type_,name_s,html" url="listIcons.jhtml" itemSelector="div.icon" id="_icons"
				overItemCls="icon-hover" onload="_fn_onload" onselectionchange="_fn_onselectionchange" animated="true">
				<aos:xtemplate>
					<script>
						'<tpl for=".">', '<div name="_icons" class="icon">',
								'{html}<br>', '<span>{name_s}</span>',
						'</div>', '</tpl>'
					</script>
				</aos:xtemplate>
			</aos:dataview>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
		//图标焦点动画
		AOS.job(function() {
			Ext.get('_icons').select('i').addClsOnOver('fa-spin');
			Ext.get('_icons').select('img').addClsOnOver('fa-spin');
		}, 1000);

		//矢量图标颜色切换
		var _icons_vector_colors = [ "#0099CC", "#555555", "#096600" ];
		AOS.task(function() {
			Ext.get('_icons').select('i').setStyle('color',
					_icons_vector_colors[Ext.Number.randomInt(0, 2)]);
		}, 10000);

		//查询ICON列表
		function _icons_query() {
			_detail.reset();
			var params = {
                    type_: ${type_}
                };
			_icons_store.getProxy().extraParams = params;
			_icons_store.loadPage(1);
		}

		//加载完毕
		function _fn_onload() {

		}

		//项目选中事件
		function _fn_onselectionchange(me, selecteds, eOpts) {
			var selectedIcon = selecteds[0];
			if (selectedIcon.data.type_ === '1' || selectedIcon.data.type_ === '2') {
				_detail.setWidth(200, true);
				_detail.setValue(selectedIcon.data.name_);
			} else {
				var text = selectedIcon.data.name_ + ' 或 '
						+ '<i class="fa {0}"></i>';
				text = AOS.merge(text, selectedIcon.data.name_);
				_detail.setWidth(380, true);
				_detail.setValue(text);
			}
		}

		//图标名称过滤+排序
		function _icons_filter() {
			_detail.reset();
			_icons_store.clearFilter(true);
			_icons_store.filterBy(function(record) {
			var name_ = record.get('name_');
				if (name_.indexOf(_name_.getValue()) != -1) {
					return true;
				}
			});
			_icons_store.sort('name_', 'DESC'); //排序
		}
		
		//图标同步
		function _fn_sync(){
			AOS.confirm('确认与文件系统同步图标数据吗？', function(btn){
					if(btn === 'cancel'){
						AOS.tip('同步操作被取消。');
						return;
					}
					AOS.ajax({
						params:{type_:${type_}},
						url : 'syncIcon.jhtml',
						ok : function(data) {
							AOS.tip(data.appmsg);
							_icons_query();
						}
					});
			});
		}
	</script>
</aos:onready>
</aos:html>