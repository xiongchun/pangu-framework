<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="参数表" base="http" lib="ext">
	<aos:body>
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="g_param" url="masterDataService.listParam" onrender="g_param_query"  forceFit="true"
			onitemdblclick="w_param_u_show">
			<aos:menu>
				<aos:menuitem text="新增" onclick="#w_param.show();" icon="add.png" />
				<aos:menuitem text="修改" onclick="w_param_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="g_param_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#g_param_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:docked forceBoder="0 0 1 0" >
				<aos:dockeditem onclick="#w_param.show();" text="新增" icon="add.png" />
				<aos:dockeditem onclick="w_param_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="g_param_del" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbseparator"/>
				<aos:combobox id="id_group" dicField="params_group"  emptyText="参数分组" onselect="g_param_query" margin="0 5 0 0" selectAll="true" width="180"  />
				<aos:triggerfield emptyText="参数名称|键|值" id="id_nkv" onenterkey="g_param_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="g_param_query" width="180" />
			</aos:docked>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id" fixedWidth="150" hidden="true" />
			<aos:column header="参数名称" dataIndex="name" celltip="true" width="200" />
			<aos:column header="参数键" dataIndex="params_key" width="200" />
			<aos:column header="参数值" dataIndex="value" width="300" celltip="true" />
			<aos:column header="所属分组" dataIndex="params_group" rendererField="params_group" fixedWidth="120" />
			<aos:column header="备注" dataIndex="remark" celltip="true" minWidth="200"  />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="w_param" title="新增参数"  onshow="#AOS.reset(f_param);" >
		<aos:formpanel id="f_param" width="500" layout="anchor" labelWidth="65" >
		    <aos:combobox name="params_group" fieldLabel="所属分组" dicField="params_group"  value="2" allowBlank="false" />
			<aos:textfield name="name" fieldLabel="参数名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="params_key" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value" fieldLabel="参数值" maxLength="4000" allowBlank="false" height="80" />
			<aos:textareafield fieldLabel="备注" name="remark" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_param_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_param.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="w_param_u" title="修改参数">
		<aos:formpanel id="f_param_u" width="500" layout="anchor" labelWidth="65">
			<aos:hiddenfield name="id" />
			<aos:combobox name="params_group" fieldLabel="所属分组" dicField="params_group" allowBlank="false" />
			<aos:textfield name="name" fieldLabel="参数名称" allowBlank="false"  maxLength="50" />
			<aos:textfield name="params_key" fieldLabel="参数键" allowBlank="false" maxLength="50" />
			<aos:textareafield name="value" fieldLabel="参数值" maxLength="4000" allowBlank="false" height="80" />
			<aos:textareafield  name="remark" fieldLabel="备注" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="f_param_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#w_param_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">

            //弹出修改参数窗口
            function w_param_u_show() {
                var record = AOS.selectone(g_param);
                if (record) {
                    w_param_u.show();
                    f_param_u.loadRecord(record);
                }
            }

            //查询参数列表
            function g_param_query() {
                var params = {
                	params_group: id_group.getValue(),
                    nkv: id_nkv.getValue()
                };
                g_param_store.getProxy().extraParams = params;
                g_param_store.loadPage(1);
            }

            //删除参数
            function g_param_del() {
                var selectionIds = AOS.selection(g_param, 'id');
                if (AOS.empty(selectionIds)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(g_param);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'masterDataService.deleteParam',
                        params: {
                            aos_rows: selectionIds
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            g_param_store.reload();
                        }
                    });
                });

            }

            //新增参数保存
            function f_param_submit() {
                AOS.ajax({
                    forms: f_param,
                    url: 'masterDataService.saveParam',
                    ok: function (data) {
                    	if(data.appcode == '1'){
                            w_param.hide();
                            g_param_store.reload();
                            AOS.tip(data.appmsg);
                    	}else{
                    		AOS.err(data.appmsg);
    						AOS.get('f_param.params_key').markInvalid(data.appmsg);
                    	}
                    }
                });
            }

            //修改参数保存
            function f_param_u_submit() {
                AOS.ajax({
                    forms: f_param_u,
                    url: 'masterDataService.updateParam',
                    ok: function (data) {
                    	if(data.appcode == '1'){
                            w_param_u.hide();
                            g_param_store.reload();
                            AOS.tip(data.appmsg);
                    	}else{
    						AOS.get('f_param_u.params_key').markInvalid(data.appmsg);
    						AOS.err(data.appmsg);
                    	}
                    }
                });
            }

        </script>
</aos:onready>