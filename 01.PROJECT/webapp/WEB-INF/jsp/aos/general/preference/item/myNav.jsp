<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="自定义菜单">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:layout type="hbox" align="stretch" />
		<aos:panel flex="1" bodyBorder="0 1 0 0">
			<aos:layout type="hbox" align="stretch" />
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="自定义快捷菜单" />
			</aos:docked>
			<aos:treepanel id="_t_quick" bodyBorder="0 0 0 0" url="getModuleCheckTree4QuickMenu.jhtml" singleClick="false"
				rootId="p" cascade="true" rootText="请选择[自定义]"  width="350">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_quick_load" icon="refresh.png" />
				</aos:menu>
				<aos:docked dock="bottom" forceBoder="1 0 0 0">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem onclick="_t_quick_save" text="保存" icon="ok.png" />
					<aos:dockeditem onclick="_t_quick_load" text="刷新" icon="refresh.png" />
				</aos:docked>
			</aos:treepanel>
			<aos:treepanel id="_t_checked" bodyBorder="0 0 0 1" url="getModuleTree4QuickMenu.jhtml" singleClick="false"
				rootId="p" rootText="已选择[预览]" flex="1">
				<aos:menu>
					<aos:menuitem text="刷新" onclick="_t_checked_load" icon="refresh.png" />
				</aos:menu>
				<aos:docked dock="bottom" forceBoder="1 0 0 1">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem onclick="_t_checked_load" text="刷新" icon="refresh.png" />
				</aos:docked>
			</aos:treepanel>
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
    
	 //刷新快捷菜单  待选
    function _t_quick_load() {
        refreshnode = _t_quick.getRootNode();
        _t_quick_store.load({
            callback: function () {
                //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                refreshnode.collapse();
                refreshnode.expand();
            }
        });
    }
	 
	 //刷新快捷菜单树 已选
    function _t_checked_load() {
        refreshnode = _t_checked.getRootNode();
        _t_checked_store.load({
            callback: function () {
                //收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
                refreshnode.collapse();
                refreshnode.expand();
            }
        });
    }
	 
    //保存自定义快捷菜单
    var aos_rows__t_quick_init;
	AOS.job(function() {
		aos_rows__t_quick_init = AOS.selection(_t_quick, 'id');
	}, 1000);
    function _t_quick_save() {
        var aos_rows_;
        aos_rows_ = AOS.selection(_t_quick, 'id');
        if (aos_rows_ === aos_rows__t_quick_init) {
            AOS.tip('操作被取消，数据无变化不需要保存。');
            return;
        }
        var params = {
            aos_rows_: aos_rows_
        };
        AOS.ajax({
            params: params,
            url: 'saveQuickModuleInfo.jhtml',
            ok: function (data) {
                AOS.tip(data.appmsg);
                aos_rows__t_quick_init = AOS.selection(_t_quick, 'id');
                _t_checked_load();
            }
        });
    }
	 
	</script>
</aos:onready>
</aos:html>