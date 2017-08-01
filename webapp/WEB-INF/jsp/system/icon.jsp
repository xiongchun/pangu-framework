<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html title="图标" base="http" lib="ext">
<style type="text/css">
		#icons div.icon {
			float: left;
			padding: 5px 5px;
			margin: 3px;
			line-height: 15px;
			height: ${height}px;
			width: 100px;
			overflow: hidden;
			border-top: 1px solid transparent;
			text-align: center;
			color: #222222;
			font-size: 13px;
			cursor: pointer;
		}
		
		#icons div.icon img {
			margin-bottom: 3px;
		}
		
		#icons div.icon-hover {
			border: 1px solid #DFDFDF !important;
		}
		
		#icons .x-item-selected {
			border: 1px solid #EEEEEE !important;
		}
</style>
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel border="false" autoScroll="true">
			<aos:docked forceBoder="0 0 1 0" onrender="icons_query">
			    <aos:combobox  emptyText="图标类型" value="${type}" dicField="icon_type" onselect="fn_select" width="180" />
				<aos:triggerfield emptyText="图标名称" id="id_name" onenterkey="icons_filter"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="icons_filter" width="180" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:textfield id="detail" width="200" readOnly="true" emptyText="当前选中图标" />
			</aos:docked>
			<%-- 如果客户端是IE，则需要禁止动画。否则动画会出现瑕疵。提示：已经在标签内部实现。  --%>
			<aos:dataview fields="name,type,name_s,html" url="iconService.listIcons" itemSelector="div.icon" id="icons"
				overItemCls="icon-hover" onload="fn_onload" onselectionchange="fn_onselectionchange" animated="true">
				<aos:xtemplate>
					<script>
						'<tpl for=".">', '<div name="icons" class="icon">',
								'{html}<br>', '<span>{name_s}</span>',
						'</div>', '</tpl>'
					</script>
				</aos:xtemplate>
			</aos:dataview>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
	
	      //监听选择事件
	     function fn_select(me){
	    	 window.location.replace("do.jhtml?router=iconService.init&juid=${juid}&type=" + me.getValue());
	     }
	      
		//图标焦点动画
		AOS.job(function() {
			Ext.get('icons').select('i').addClsOnOver('fa-spin');
			Ext.get('icons').select('img').addClsOnOver('fa-spin');
		}, 1000);

		//矢量图标颜色切换
		var icons_vector_colors = [ "#0099CC", "#555555", "#096600" ];
		AOS.task(function() {
			Ext.get('icons').select('i').setStyle('color',
					icons_vector_colors[Ext.Number.randomInt(0, 2)]);
		}, 10000);

		//查询ICON列表
		function icons_query() {
			detail.reset();
			var params = {
                    type: '${type}'
                };
			icons_store.getProxy().extraParams = params;
			icons_store.loadPage(1);
		}

		//加载完毕
		function fn_onload() {

		}

		//项目选中事件
		function fn_onselectionchange(me, selecteds, eOpts) {
			var selectedIcon = selecteds[0];
			if (selectedIcon.data.type == '1' || selectedIcon.data.type == '2') {
				detail.setWidth(200, true);
				detail.setValue(selectedIcon.data.name);
			} else {
				var text = selectedIcon.data.name + ' 或 '
						+ '<i class="fa {0}"></i>';
				text = AOS.merge(text, selectedIcon.data.name);
				detail.setWidth(380, true);
				detail.setValue(text);
			}
		}

		//图标名称过滤+排序
		function icons_filter() {
			detail.reset();
			icons_store.clearFilter(true);
			icons_store.filterBy(function(record) {
			var name = record.get('name');
				if (name.indexOf(id_name.getValue()) != -1) {
					return true;
				}
			});
			icons_store.sort('name', 'DESC'); //排序
		}
		
	</script>
</aos:onready>