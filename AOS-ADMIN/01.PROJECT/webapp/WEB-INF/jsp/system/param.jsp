<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="参数表" base="http" lib="ext">
	<aos:body>
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_param" url="masterDataService.listParam" onrender="_g_param_query"  forceFit="true"
			onitemdblclick="_w_param_u_show">
			<aos:menu>
				<aos:menuitem text="新增" onclick="#_w_param.show();" icon="add.png" />
				<aos:menuitem text="修改" onclick="_w_param_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="_g_param_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_param_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:docked forceBoder="0 0 1 0" >
				<aos:dockeditem onclick="#_w_param.show();" text="新增" icon="add.png" />
				<aos:dockeditem onclick="_w_param_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="_g_param_del" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbseparator"/>
				<aos:combobox id="id_group_" dicField="params_group_"  emptyText="参数分组" onselect="_g_param_query" margin="0 5 0 0" selectAll="true" width="180"  />
				<aos:triggerfield emptyText="参数名称|键|值" id="id_nkv_" onenterkey="_g_param_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_param_query" width="180" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" fixedWidth="150" hidden="true" />
			<aos:column header="参数名称" dataIndex="name_" celltip="true" width="200" />
			<aos:column header="参数键" dataIndex="key_" width="200" />
			<aos:column header="参数值" dataIndex="value_" width="300" celltip="true" />
			<aos:column header="所属分组" dataIndex="group_" rendererField="params_group_" fixedWidth="120" />
			<aos:column header="备注" dataIndex="remark_" celltip="true" minWidth="200"  />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_param" title="新增参数"  onshow="#AOS.reset(_f_param);" >
		<aos:formpanel id="_f_param" width="500" layout="anchor" labelWidth="65" >
		    <aos:combobox name="group_" fieldLabel="所属分组" dicField="params_group_"  value="2" allowBlank="false" />
			<aos:textfield name="name_" fieldLabel="参数名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="key_" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value_" fieldLabel="参数值" maxLength="2000" allowBlank="false" height="60" />
			<aos:textareafield fieldLabel="备注" name="remark_" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_param_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_param.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_param_u" title="修改参数">
		<aos:formpanel id="_f_param_u" width="500" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id_" />
			<aos:combobox name="group_" fieldLabel="所属分组" dicField="params_group_" allowBlank="false" />
			<aos:textfield name="name_" fieldLabel="参数名称" allowBlank="false"  maxLength="50" />
			<aos:textfield name="key_" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value_" fieldLabel="参数值" maxLength="2000" allowBlank="false" height="60" />
			<aos:textareafield fieldLabel="备注" name="remark_" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_param_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_param_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">

            //弹出修改参数窗口
            function _w_param_u_show() {
                var record = AOS.selectone(_g_param);
                if (record) {
                    _w_param_u.show();
                    _f_param_u.loadRecord(record);
                }
            }

            //查询参数列表
            function _g_param_query() {
                var params = {
                    group_: id_group_.getValue(),
                    nkv_: id_nkv_.getValue()
                };
                _g_param_store.getProxy().extraParams = params;
                _g_param_store.loadPage(1);
            }

            //删除参数
            function _g_param_del() {
                var selectionIds = AOS.selection(_g_param, 'id_');
                if (AOS.empty(selectionIds)) {
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
                        url: 'masterDataService.deleteParam',
                        params: {
                            aos_rows_: selectionIds
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
                AOS.ajax({
                    forms: _f_param,
                    url: 'masterDataService.saveParam',
                    ok: function (data) {
                    	if(data.appcode == '1'){
                            _w_param.hide();
                            _g_param_store.reload();
                            AOS.tip(data.appmsg);
                    	}else{
                    		AOS.err(data.appmsg);
    						AOS.get('_f_param.key_').markInvalid(data.appmsg);
                    	}
                    }
                });
            }

            //修改参数保存
            function _f_param_u_submit() {
                AOS.ajax({
                    forms: _f_param_u,
                    url: 'masterDataService.updateParam',
                    ok: function (data) {
                    	if(data.appcode == '1'){
                            _w_param_u.hide();
                            _g_param_store.reload();
                            AOS.tip(data.appmsg);
                    	}else{
    						AOS.get('_f_param_u.key_').markInvalid(data.appmsg);
    						AOS.err(data.appmsg);
                    	}
                    }
                });
            }

        </script>
</aos:onready>