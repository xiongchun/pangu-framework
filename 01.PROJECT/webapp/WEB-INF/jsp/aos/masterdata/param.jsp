<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="参数表">
	<aos:include lib="ext" />
	<aos:base href="system/param" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_catalog" width="220" region="west" url="${cxt}/system/listCatalogs.jhtml"
			onitemclick="_g_param_query" singleClick="false" useArrows="false" rootVisible="true" rootText="全部分类"
			nodeParam="parent_id_" bodyBorder="0 1 0 0" headerBorder="0 1 0 0" rootId="cd14928a239b448b867c2e45246cd038">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="参数分类科目" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="含子分类" id="_cascade" name="cascade" checked="true" onchang="_g_param_query" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新分类" onclick="_t_catalog_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_param" url="listParams.jhtml" region="center" onrender="_g_param_query" 
			onitemdblclick="_w_param_u_show">
			<aos:menu>
				<aos:menuitem text="新增" onclick="_w_param_show" icon="add.png" />
				<aos:menuitem text="修改" onclick="_w_param_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="_g_param_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_param_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem onclick="_w_param_show" text="新增" icon="add.png" id="_btn_add_demo" />
				<aos:dockeditem onclick="_w_param_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="_g_param_del" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="参数键或参数值" name="keyorvalue" id="_keyorvalue" onenterkey="_g_param_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_param_query" width="180" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="所属分类流水号" dataIndex="catalog_id_" hidden="true" />
			<aos:column header="参数名称" dataIndex="name_" width="200" celltip="true" />
			<aos:column header="参数键" dataIndex="key_" width="180" celltip="true" />
			<aos:column header="参数值" dataIndex="value_" width="220" celltip="true" />
			<aos:column header="覆盖字段" dataIndex="overwrite_field_" rendererField="bool_" width="140" />
			<aos:column header="可覆盖" dataIndex="is_overwrite_" rendererField="bool_" width="60" />
			<aos:column header="所属分类" dataIndex="catalog_name_" width="120" />
			<aos:column header="备注" dataIndex="remark_" celltip="true" minWidth="200" flex="1" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_param" title="新增参数">
		<aos:formpanel id="_f_param" width="420" layout="anchor" labelWidth="70">
			<aos:treepicker fieldLabel="所属分类" name="catalog_id_" allowBlank="false" id="_tp_catalog_id_" emptyText="请选择..."
				rootId="cd14928a239b448b867c2e45246cd038" url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_" />
			<aos:textfield name="name_" fieldLabel="参数名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="key_" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value_" fieldLabel="参数值" maxLength="200" allowBlank="false" height="40" />
			<aos:rowset rowSpace="5">
				<aos:textfield name="overwrite_field_" fieldLabel="覆盖字段" columnWidth="0.5" padding="0 5 0 0" />
				<aos:displayfield value="(用户配置表中和此参数对应的字段)" columnWidth="0.5" />
			</aos:rowset>
			<aos:rowset rowSpace="5">
				<aos:combobox name="is_overwrite_" allowBlank="false" fieldLabel="是否覆盖" editable="false" value="0" dicField="bool_"
					columnWidth="0.5" padding="0 5 0 0" />
				<aos:displayfield value="(用户配置参数是否覆盖此系统参数)" columnWidth="0.5" />
			</aos:rowset>
			<aos:textareafield fieldLabel="备注" name="remark_" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_param_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_param.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_param_u" title="修改参数">
		<aos:formpanel id="_f_param_u" width="420" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="id_" />
			<aos:treepicker fieldLabel="所属分类" id="_tp_catalog_id_u" name="catalog_id_" allowBlank="false" emptyText="请选择..."
				rootId="cd14928a239b448b867c2e45246cd038" url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_" />
			<aos:textfield name="name_" fieldLabel="参数名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="key_" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value_" fieldLabel="参数值" maxLength="200" allowBlank="false" height="40" />
			<aos:rowset rowSpace="5">
				<aos:textfield name="overwrite_field_" fieldLabel="覆盖字段" columnWidth="0.5" padding="0 5 0 0" />
				<aos:displayfield value="(用户配置表中和此参数对应的字段)" columnWidth="0.5" />
			</aos:rowset>
			<aos:rowset rowSpace="5">
				<aos:combobox name="is_overwrite_" allowBlank="false" fieldLabel="是否覆盖" editable="false" dicField="bool_"
					columnWidth="0.5" padding="0 5 0 0" />
				<aos:displayfield value="(用户配置参数是否覆盖此系统参数)" columnWidth="0.5" />
			</aos:rowset>
			<aos:textareafield fieldLabel="备注" name="remark_" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_param_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_param_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
          
            //弹出新增参数窗口
            function _w_param_show() {
                AOS.reset(_f_param);
                var record = AOS.selectone(_t_catalog);
                if (record) {
                    _tp_catalog_id_.setValue(record.raw.id_);
                    _tp_catalog_id_.setRawValue(record.raw.name_);
                }
                _w_param.show();
            }

            //弹出修改参数窗口
            function _w_param_u_show() {
                var record = AOS.selectone(_g_param);
                if (record) {
                    _w_param_u.show();
                    _f_param_u.loadRecord(record);
                    _tp_catalog_id_u.setRawValue(record.raw.catalog_name_);
                }
            }

            //查询参数列表
            function _g_param_query() {
                var params = {
                    keyorvalue: _keyorvalue.getValue(),
                    cascade: _cascade.getValue()
                };
                var record = AOS.selectone(_t_catalog);
                if (record) {
                    params.catalog_id_ = record.raw.id;
                    params.catalog_cascade_id_ = record.raw.cascade_id_;
                }
                _g_param_store.getProxy().extraParams = params;
                _g_param_store.loadPage(1);
            }

            //删除参数
            function _g_param_del() {
                var selection = AOS.selection(_g_param, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(_g_param);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'deleteParam.jhtml',
                        params: {
                            aos_rows_: selection
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            _g_param_store.reload();
                        }
                    });
                });

            }

            //新增参数保存
            function _f_param_submit() {
                var overwrite_field_ = _f_param.form.findField('overwrite_field_').getValue();
                var is_overwrite_ = _f_param.form.findField('is_overwrite_').getValue();
                if (AOS.empty(overwrite_field_) && is_overwrite_ === '1') {
                    AOS.tip('覆盖字段为空的时候，是否覆盖只能选择否。请核对。');
                    return;
                }
                AOS.ajax({
                    forms: _f_param,
                    url: 'saveParam.jhtml',
                    ok: function (data) {
                    	if(data.appcode !== -1){
                            _w_param.hide();
                            _g_param_store.reload();
                    	}
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //修改参数保存
            function _f_param_u_submit() {
                var overwrite_field_ = _f_param_u.form.findField('overwrite_field_').getValue();
                var is_overwrite_ = _f_param_u.form.findField('is_overwrite_').getValue();
                if (AOS.empty(overwrite_field_) && is_overwrite_ === '1') {
                    AOS.tip('覆盖字段为空的时候，是否覆盖只能选择否。请核对。');
                    return;
                }
                AOS.ajax({
                    forms: _f_param_u,
                    url: 'updateParam.jhtml',
                    ok: function (data) {
                    	if(data.appcode !== -1){
                            _w_param_u.hide();
                            _g_param_store.reload();
                    	}
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //刷新分类树
            function _t_catalog_refresh() {
                var refreshnode = AOS.selectone(_t_catalog);
                if (refreshnode.isLeaf()) {
                    refreshnode = refreshnode.parentNode;
                }
                _t_catalog_store.load({
                    node: refreshnode,
                    callback: function () {
                        refreshnode.collapse();
                        refreshnode.expand();
                    }
                });
            }
        </script>
</aos:onready>
</aos:html>