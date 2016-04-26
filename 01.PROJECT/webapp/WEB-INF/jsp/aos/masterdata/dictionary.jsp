<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="数据字典">
	<aos:include lib="ext" />
	<aos:base href="system/dictionary" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_catalog" width="220" region="west" url="${cxt}/system/listCatalogs.jhtml"
			onitemclick="_g_index_query" singleClick="false" useArrows="false" rootVisible="true" rootText="全部分类"
			nodeParam="parent_id_" bodyBorder="0 1 0 0" headerBorder="0 1 0 0" rootId="21d03054afdf43d69972cf6f7db6cfa3">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="字典分类科目" />
				<aos:dockeditem xtype="tbfill" />
				<aos:checkbox boxLabel="含子分类" id="_cascade" name="cascade" checked="true" onchang="_g_index_query" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新分类" onclick="_t_catalog_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:panel region="center" layout="border" border="false">
			<aos:gridpanel id="_g_index" url="listDicindexInfos.jhtml" region="west" bodyBorder="0 1 0 0" hidePagebar="true"
				width="380"  onrender="_g_index_query" onitemclick="_g_dic_query" onitemdblclick="_w_index_u_show" forceFit="true">
				<aos:docked forceBoder="0 1 1 0">
					<aos:dockeditem xtype="button" text="操作" icon="icon140.png">
						<aos:menu>
							<aos:menuitem text="新增字典" onclick="_w_index_show" icon="add.png" />
							<aos:menuitem text="修改字典" onclick="_w_index_u_show" icon="edit.png" />
							<aos:menuitem text="删除字典" onclick="_g_index_del" icon="del.png" />
						</aos:menu>
					</aos:dockeditem>
					<aos:dockeditem xtype="tbfill" />
					<aos:triggerfield emptyText="字典标识或名称" name="key_name_" id="_key_name_" onenterkey="_g_index_query"
						trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_index_query" width="180" />
				</aos:docked>
				<aos:menu>
					<aos:menuitem text="新增字典" onclick="_w_index_show" icon="add.png" />
					<aos:menuitem text="修改字典" onclick="_w_index_u_show" icon="edit.png" />
					<aos:menuitem text="删除字典" onclick="_g_index_del" icon="del.png" />
					<aos:menuitem text="刷新" onclick="#_g_index_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:selmodel type="row" mode="multi" />
				<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="所属分类流水号" dataIndex="catalog_id_" hidden="true" hideable="false" />
				<aos:column header="所属分类名称" dataIndex="catalog_name_" hidden="true" hideable="false" />
				<aos:column header="字典标识" dataIndex="key_" celltip="true" />
				<aos:column header="字典名称" dataIndex="name_" celltip="true" />
				<aos:column header="备注" dataIndex="remark_" hidden="true" />
			</aos:gridpanel>

			<aos:gridpanel id="_g_dic" url="listDicInfos.jhtml" region="center" onitemdblclick="_w_dic_u_show" hidePagebar="true">
				<aos:menu>
					<aos:menuitem text="新增" onclick="_w_dic_show" icon="add.png" />
					<aos:menuitem text="修改" onclick="_w_dic_u_show" icon="edit.png" />
					<aos:menuitem text="删除" onclick="_g_dic_del" icon="del.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="刷新" onclick="#_g_dic_store.reload();" icon="refresh.png" />
				</aos:menu>
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem onclick="_w_dic_show" text="新增" icon="add.png" />
					<aos:dockeditem onclick="_w_dic_u_show" text="修改" icon="edit.png" />
					<aos:dockeditem onclick="_g_dic_del" text="删除" icon="del.png" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:triggerfield emptyText="字典代码或字典值" name="code_desc_" id="_code_desc_" onenterkey="_g_dic_query"
						onTrigger1Click="_g_dic_query" trigger1Cls="x-form-search-trigger" width="180" />
				</aos:docked>
				<aos:selmodel type="checkbox" mode="multi" />
				<aos:column type="rowno"/>
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="字典对照码" dataIndex="code_" />
				<aos:column header="字典对照值" dataIndex="desc_" flex="1" celltip="true" />
				<aos:column header="当前状态" dataIndex="status_" rendererField="enabled_" width="80" />
				<aos:column header="备注" dataIndex="remark_" hidden="true" />
			</aos:gridpanel>
		</aos:panel>
	</aos:viewport>
	<aos:window id="_w_index" title="新增字典">
		<aos:formpanel id="_f_index" width="400" layout="anchor" labelWidth="75">
			<aos:treepicker fieldLabel="所属分类" id="_tp_catalog_id_" name="catalog_id_" allowBlank="false" emptyText="请选择..."
				rootId="21d03054afdf43d69972cf6f7db6cfa3" url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" maxLength="50" />
			<aos:textfield name="name_" fieldLabel="字典名称" maxLength="100" allowBlank="false" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_index_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_index.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_index_u" title="修改字典">
		<aos:formpanel id="_f_index_u" width="400" layout="anchor" labelWidth="75">
			<aos:hiddenfield name="id_" />
			<aos:treepicker fieldLabel="所属分类" id="_tp_u_catalog_id_" name="catalog_id_" allowBlank="false" emptyText="请选择..."
				rootId="21d03054afdf43d69972cf6f7db6cfa3" url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" maxLength="50" />
			<aos:textfield name="name_" fieldLabel="字典名称" maxLength="100" allowBlank="false" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_index_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_index_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_dic" title="新增字典对照">
		<aos:formpanel id="_f_dic" width="400" layout="anchor" labelWidth="75">
			<aos:hiddenfield name="dic_index_id_" fieldLabel="所属字典流水号" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="字典名称" allowBlank="false" readOnly="true" />
			<aos:textfield name="code_" fieldLabel="字典对照码" allowBlank="false" maxLength="100" />
			<aos:textfield name="desc_" fieldLabel="字典对照值" allowBlank="false" maxLength="100" />
			<aos:combobox fieldLabel="当前状态" name="status_" allowBlank="false" dicField="enabled_" value="1" editable="false" />
			<aos:textareafield fieldLabel="备注" name="remark_" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_dic_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_dic.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_dic_u" title="修改字典对照">
		<aos:formpanel id="_f_dic_u" width="400" layout="anchor" labelWidth="75">
			<aos:hiddenfield name="id_" fieldLabel="字典对照流水号" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" readOnly="true" />
			<aos:textfield name="name_" fieldLabel="字典名称" allowBlank="false" readOnly="true" />
			<aos:textfield name="code_" fieldLabel="字典对照码" allowBlank="false" maxLength="100" />
			<aos:textfield name="desc_" fieldLabel="字典对照值" allowBlank="false" maxLength="100" />
			<aos:combobox name="status_" fieldLabel="当前状态" allowBlank="false" dicField="enabled_" editable="false" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="200" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_dic_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_dic_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">

            var _first_load = true;

            //弹出新增数据字典索引窗口
            function _w_index_show() {
                AOS.reset(_f_index);
                var record = AOS.selectone(_t_catalog);
                if (record) {
                    _tp_catalog_id_.setValue(record.raw.id_);
                    _tp_catalog_id_.setRawValue(record.raw.name_);
                }
                _w_index.show();
            }

            //弹出修改据字典索引窗口
            function _w_index_u_show() {
                var record = AOS.selectone(_g_index);
                if (record) {
                    _w_index_u.show();
                    _f_index_u.loadRecord(record);
                    _tp_u_catalog_id_.setRawValue(record.data.catalog_name_);
                }
            }

            //弹出新增数据字典对照窗口
            function _w_dic_show() {
                AOS.reset(_f_dic);
                var record = AOS.selectone(_g_index, true);
                if (AOS.empty(record)) {
                    AOS.tip('请先在数据字典列表上选中1个数据字典。');
                    return;
                }
                _f_dic.down('[name=key_]').setValue(record.data.key_);
                _f_dic.down('[name=name_]').setValue(record.data.name_);
                _f_dic.down('[name=dic_index_id_]').setValue(record.data.id_);
                _w_dic.show();
            }

            //弹出修改据字典对照窗口
            function _w_dic_u_show() {
                var record = AOS.selectone(_g_dic);
                if (record) {
                    _w_dic_u.show();
                    _f_dic_u.loadRecord(record);
                    record = AOS.selectone(_g_index);
                    _f_dic_u.down('[name=key_]').setValue(record.data.key_);
                    _f_dic_u.down('[name=name_]').setValue(record.data.name_);
                }
            }

            //查询字典索引表
            function _g_index_query() {
                var params = {
                    key_name_: _key_name_.getValue(),
                    cascade: _cascade.getValue()
                };
                var record = AOS.selectone(_t_catalog);
                if (!AOS.empty(record)) {
                    params.catalog_id_ = record.raw.id;
                    params.catalog_cascade_id_ = record.raw.cascade_id_;
                }
                _g_index_store.getProxy().extraParams = params;
                _g_index_store.loadPage(1,{
                    callback: function (records) {
                        _g_dic_store.removeAll();
                        if (_first_load && records.length > 0) {
                            _g_index.getSelectionModel().select(0);
                            _g_dic_query();
                        }
                        _first_load = false;
                    }
                });
            }

            //查询字典列表
            function _g_dic_query() {
                var params = {
                    code_desc_: _code_desc_.getValue()
                };
                var record = AOS.selectone(_g_index);
                if (!AOS.empty(record)) {
                    params.dic_index_id_ = record.data.id_;
                }
                _g_dic_store.getProxy().extraParams = params;
                _g_dic_store.loadPage(1);
            }

            //删除数据字典对照
            function _g_dic_del() {
                var selection = AOS.selection(_g_dic, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(_g_dic);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据字典对照明细吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'deleteDic.jhtml',
                        params: {
                            aos_rows_: selection
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            _g_dic_store.reload();
                        }
                    });
                });
            }

            //删除数据字典索引
            function _g_index_del() {
                var selection = AOS.selection(_g_index, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(_g_index);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据字典吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'deleteIndex.jhtml',
                        params: {
                            aos_rows_: selection
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            _g_index_store.reload();
                            _g_dic_store.reload();
                        }
                    });
                });
            }

            //新增数据字典索引保存
            function _f_index_submit() {
                AOS.ajax({
                    forms: _f_index,
                    url: 'saveIndex.jhtml',
                    ok: function (data) {
                        if (data.appcode === 1) {
                            _w_index.hide();
                            _g_index_store.reload();
                        }
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //新增数据字典对照保存
            function _f_dic_submit() {
                AOS.ajax({
                    forms: _f_dic,
                    url: 'saveDic.jhtml',
                    ok: function (data) {
                        _w_dic.hide();
                        _g_dic_store.reload();
                        AOS.tip(data.appmsg);
                    }
                });
            }

            //修改数据字典索引保存
            function _f_index_u_submit() {
                AOS.ajax({
                    forms: _f_index_u,
                    url: 'updateIndex.jhtml',
                    ok: function (data) {
                        if (data.appcode === 1) {
                            _w_index_u.hide();
                            _g_index_store.reload();
                            AOS.tip(data.appmsg);
                        } else {
                            AOS.err(data.appmsg);
                        }
                    }
                });
            }

            //修改数据字典对照保存
            function _f_dic_u_submit() {
                AOS.ajax({
                    forms: _f_dic_u,
                    url: 'updateDic.jhtml',
                    ok: function (data) {
                        _w_dic_u.hide();
                        _g_dic_store.reload();
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