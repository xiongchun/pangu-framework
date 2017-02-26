<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="数据字典" base="http" lib="ext">
	<aos:body >
	</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_dic" url="masterDataService.listDic" onrender="_g_dic_query" onitemdblclick="_g_dic_dbclick"
			forceFit="true">
			<aos:docked forceBoder="0 0 1 0" >
				<aos:dockeditem text="新增" onclick="#_w_dic.show();" icon="add.png" />
				<aos:dockeditem text="修改" onclick="_w_dic_u_show" icon="edit.png" />
				<aos:dockeditem text="删除" onclick="_g_dic_del" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:combobox id="id_group_" dicField="dic_group_" emptyText="字典分组" onselect="_g_dic_query" margin="0 5 0 0"
					selectAll="true" width="180" />
				<aos:triggerfield emptyText="字典名称|标识" id="id_where1_" onenterkey="_g_dic_query" margin="0 5 0 0"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_dic_query" width="180" />
				<aos:triggerfield emptyText="对照码|值" id="id_where2_" onenterkey="_g_dic_query" trigger1Cls="x-form-search-trigger"
					onTrigger1Click="_g_dic_query" width="180" />
				<aos:dockeditem xtype="tbfill" />
                 <aos:dockeditem xtype="tbtext" text="提示：双击表格行可下钻或上翻" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="下钻|上翻" onclick="_g_dic_dbclick" icon="send_receive.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增字典" onclick="#_w_dic.show();" icon="add.png" />
				<aos:menuitem text="修改字典" onclick="_w_dic_u_show" icon="edit.png" />
				<aos:menuitem text="删除字典" onclick="_g_dic_del" icon="del.png" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="#_g_dic_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" fixedWidth="150" hidden="true" />
			<aos:column header="字典名称" dataIndex="name_" celltip="true" maxWidth="200" />
			<aos:column header="字典标识" dataIndex="key_" celltip="true" maxWidth="150" />
			<aos:column header="对照码" dataIndex="code_" maxWidth="80" />
			<aos:column header="对照值" dataIndex="desc_" celltip="true" />
			<aos:column header="排序号" dataIndex="sort_no_" maxWidth="80" />
			<aos:column header="是否启用" dataIndex="is_enable_" rendererField="is_" maxWidth="80" />
			<aos:column header="所属分组" dataIndex="group_" rendererField="dic_group_" fixedWidth="120"  />
			<aos:column header="备注" dataIndex="remark_" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_dic" title="新增字典" onshow="_w_dic_onshow">
		<aos:formpanel id="_f_dic" width="500" layout="anchor" labelWidth="65">
			<aos:combobox name="group_" fieldLabel="所属分组" dicField="dic_group_" value="2" allowBlank="false" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" maxLength="255" />
			<aos:textfield name="name_" fieldLabel="字典名称" maxLength="100" allowBlank="false" />
			<aos:textfield name="code_" fieldLabel="对照码" maxLength="100" allowBlank="false" />
			<aos:textareafield name="desc_" fieldLabel="对照值" maxLength="4000" allowBlank="false" height="80" />
			<aos:combobox name="is_enable_" fieldLabel="是否启用" dicField="is_" value="1" allowBlank="false" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="1" minValue="1" maxValue="9999" allowBlank="false" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_dic_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_dic.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<aos:window id="_w_dic_u" title="修改字典">
		<aos:formpanel id="_f_dic_u" width="400" layout="anchor" labelWidth="75">
			<aos:hiddenfield name="id_" />
			<aos:combobox name="group_" fieldLabel="所属分组" dicField="dic_group_" value="2" allowBlank="false" />
			<aos:textfield name="key_" fieldLabel="字典标识" allowBlank="false" maxLength="50" />
			<aos:textfield name="name_" fieldLabel="字典名称" maxLength="100" allowBlank="false" />
			<aos:textfield name="code_" fieldLabel="对照码" maxLength="100" allowBlank="false" />
			<aos:textareafield name="desc_" fieldLabel="对照值" maxLength="4000" allowBlank="false" height="80" />
			<aos:combobox name="is_enable_" fieldLabel="是否启用" dicField="is_" value="1" allowBlank="false" />
			<aos:numberfield name="sort_no_" fieldLabel="排序号" value="0" minValue="0" maxValue="9999" allowBlank="false" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="2000" height="60" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_dic_u_submit" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_dic_u.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
	        var key_ = '';
	        //表格行双击事件
	        function _g_dic_dbclick(){
	        	 var record = AOS.selectone(_g_dic);
	        	 if (record) {
	        		 key_ = AOS.empty(key_) ? record.data.key_ : '';
	        		 _g_dic_query();
	        	 }
	        }

            //监听弹出新增数据字典窗口
            function _w_dic_onshow() {
                AOS.reset(_f_dic);
                var record = AOS.selectone(_g_dic,true);
                if (record) {
                	AOS.setValue('_f_dic.key_', record.data.key_);
                	AOS.setValue('_f_dic.name_', record.data.name_);
                }
            }

            //弹出修改据字典索引窗口
            function _w_dic_u_show() {
                var record = AOS.selectone(_g_dic);
                if (record) {
                    _w_dic_u.show();
                    _f_dic_u.loadRecord(record);
                }
            }
            
            //查询数据字典列表
            function _g_dic_query() {
                var params = {
                    group_: id_group_.getValue(),
                    where1_: id_where1_.getValue(),
                    where2_: id_where2_.getValue(),
                    key_:key_
                };
                _g_dic_store.getProxy().extraParams = params;
                _g_dic_store.loadPage(1);
            }

            //删除数据字典
            function _g_dic_del() {
                var selection = AOS.selection(_g_dic, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(_g_dic);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据字典吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'masterDataService.deleteDic',
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

            //新增数据字典保存
            function _f_dic_submit() {
                AOS.ajax({
                    forms: _f_dic,
                    url: 'masterDataService.saveDic',
                    ok: function (data) {
                        if (data.appcode == '1') {
                            _w_dic.hide();
                            _g_dic_store.reload();
                            AOS.tip(data.appmsg);
                    	}else{
                    		AOS.err(data.appmsg);
                    		AOS.get('_f_dic.code_').markInvalid(data.appmsg);
                    	}
                    }
                });
            }

            //修改数据字典保存
            function _f_dic_u_submit() {
                AOS.ajax({
                    forms: _f_dic_u,
                    url: 'masterDataService.updateDic',
                    ok: function (data) {
                        if (data.appcode == '1') {
                            _w_dic_u.hide();
                            _g_dic_store.reload();
                            AOS.tip(data.appmsg);
                        } else {
                            AOS.err(data.appmsg);
                            AOS.get('_f_dic_u.code_').markInvalid(data.appmsg);
                        }
                    }
                });
            }

        </script>
</aos:onready>
