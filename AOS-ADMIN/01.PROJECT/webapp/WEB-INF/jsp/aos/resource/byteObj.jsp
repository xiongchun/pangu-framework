<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
    <aos:head title="流文件">
        <aos:include lib="ext"/>
        <aos:base href="system/byteObj"/>
    </aos:head>
    <aos:body>
        <div id="_div_view" class="x-hidden" align="center">
            <img id="_img_view" style="vertical-align: middle;"/>
        </div>
    </aos:body>
    <aos:onready>
        <aos:viewport layout="border">
            <aos:treepanel id="_t_catalog" width="220" region="west" url="${cxt}/system/listCatalogs.jhtml"
                           onitemclick="_g_byteobj_query" singleClick="false" useArrows="false" rootVisible="true"
                           rootText="全部分类"
                           nodeParam="parent_id_" bodyBorder="0 1 0 0" headerBorder="0 1 0 0" rootId="611">
                <aos:docked forceBoder="0 1 1 0">
                    <aos:dockeditem xtype="tbtext" text="流文件分类科目"/>
                    <aos:dockeditem xtype="tbfill"/>
                    <aos:checkbox boxLabel="含子分类" id="_cascade" name="cascade" checked="true"
                                  onchang="_g_byteobj_query"/>
                </aos:docked>
                <aos:menu>
                    <aos:menuitem text="刷新分类" onclick="_t_catalog_refresh" icon="refresh.png"/>
                </aos:menu>
            </aos:treepanel>
            <aos:gridpanel id="_g_byteobj" url="listByteObjs.jhtml" region="center" onrender="_g_byteobj_query"
                           onitemdblclick="_w_byteobj_u_show">
                <aos:menu>
                    <%-- <aos:menuitem text="新增" onclick="_w_byteobj_show" icon="add.png"/> --%>
                    <aos:menuitem text="修改" onclick="_w_byteobj_u_show" icon="edit.png"/>
                    <aos:menuitem text="删除" onclick="_g_byteobj_del" icon="del.png"/>
                    <aos:menuitem xtype="menuseparator"/>
                    <aos:menuitem text="刷新" onclick="#_g_byteobj_store.reload();" icon="refresh.png"/>
                </aos:menu>
                <aos:docked forceBoder="0 0 1 0">
                    <%-- <aos:dockeditem onclick="_w_byteobj_show" text="新增" icon="add.png" id="_btn_add"/> --%>
                    <aos:dockeditem onclick="_w_byteobj_u_show" text="修改" icon="edit.png"/>
                    <aos:dockeditem onclick="_g_byteobj_del" text="删除" icon="del.png"/>
                    <aos:dockeditem xtype="tbseparator"/>
                    <aos:dockeditem onclick="_w_view_show" text="查看/下载" icon="query.png"/>
                    <aos:dockeditem xtype="tbseparator"/>
                    <aos:triggerfield emptyText="标识键或名称" name="keyorname" id="_keyorname" onenterkey="_g_byteobj_query"
                                      trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_byteobj_query"
                                      width="180"/>
                </aos:docked>
                <aos:selmodel type="checkbox" mode="multi"/>
                <aos:column type="rowno"/>
                <aos:column header="流水号" dataIndex="id_" hidden="true"/>
                <aos:column header="所属分类流水号" dataIndex="catalog_id_" hidden="true"/>
                <aos:column header="标识键" dataIndex="key_" width="150" hidden="true" celltip="true"/>
                <aos:column header="名称" dataIndex="name_" width="180" celltip="true"/>
                <aos:column header="内容类型" dataIndex="content_type_" width="160" celltip="true"/>
                <aos:column header="标题" dataIndex="title_" width="180" celltip="true"/>
                <aos:column header="大小[KB]" dataIndex="size_" width="80"/>
                <aos:column header="创建人" dataIndex="creater_name_" width="80"/>
                <aos:column header="创建时间" dataIndex="create_time_" width="150"/>
                <aos:column header="备注" dataIndex="remark_" celltip="true" minWidth="200" />
            </aos:gridpanel>
        </aos:viewport>
        <aos:window id="_w_byteobj" title="新增流文件">
            <aos:formpanel id="_f_byteobj" width="500" layout="anchor" labelWidth="65">
                <aos:treepicker fieldLabel="所属分类" name="catalog_id_" allowBlank="false" id="_tp_catalog_id_"
                                emptyText="请选择..."
                                rootId="611"
                                url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_"/>
                <aos:textfield name="key_" fieldLabel="标识键" allowBlank="false" maxLength="50" selectOnFocus="true"/>
                <aos:filefield name="myfile_" fieldLabel="流文件" buttonText="浏览" allowBlank="false"
                               emptyText="请选择文件..."/>
                <aos:textfield name="title_" fieldLabel="标题" maxLength="250"/>
                <aos:textareafield fieldLabel="备注" name="remark_" maxLength="500"/>
            </aos:formpanel>
            <aos:docked dock="bottom" ui="footer">
                <aos:dockeditem xtype="tbfill"/>
                <aos:dockeditem onclick="_f_byteobj_submit" text="保存" icon="ok.png"/>
                <aos:dockeditem onclick="#_w_byteobj.hide();" text="关闭" icon="close.png"/>
            </aos:docked>
        </aos:window>
        <aos:window id="_w_byteobj_u" title="修改流文件">
            <aos:formpanel id="_f_byteobj_u" width="420" layout="anchor" labelWidth="70">
                <aos:hiddenfield name="id_"/>
                <aos:hiddenfield name="old_key_"/>
                <aos:treepicker fieldLabel="所属分类" id="_tp_catalog_id_u" name="catalog_id_" allowBlank="false"
                                emptyText="请选择..." rootId="611"
                                url="${cxt}/system/listCatalogs.jhtml" nodeParam="parent_id_"/>
                <aos:textfield name="key_" fieldLabel="标识键" allowBlank="false" maxLength="50" selectOnFocus="true"/>
                <aos:filefield name="myfile_" fieldLabel="流文件" buttonText="浏览" emptyText="请选择文件..."/>
                <aos:textfield name="title_" fieldLabel="标题" maxLength="250"/>
                <aos:textareafield fieldLabel="备注" name="remark_" maxLength="500"/>
            </aos:formpanel>
            <aos:docked dock="bottom" ui="footer">
                <aos:dockeditem xtype="tbfill"/>
                <aos:dockeditem onclick="_f_byteobj_u_submit" text="保存" icon="ok.png"/>
                <aos:dockeditem onclick="#_w_byteobj_u.hide();" text="关闭" icon="close.png"/>
            </aos:docked>
        </aos:window>
        <aos:window id="_w_view" title="查看/下载" autoScroll="true" onshow="_w_view_onshow"
                    contentEl="_div_view" width="500" height="400">
            <aos:docked dock="bottom" ui="footer">
                <aos:dockeditem xtype="tbfill"/>
                <aos:dockeditem onclick="_fn_downlod" text="下载" icon="down.png"/>
                <aos:dockeditem onclick="_w_view_hide" text="关闭" icon="close.png"/>
            </aos:docked>
        </aos:window>
        <script type="text/javascript">

            //关闭流程图窗口
            function _w_view_hide() {
                _w_view.hide();
                _w_view.center();
            }

            //显示流程图窗口
            function _w_view_show() {
                if (AOS.selectone(_g_byteobj)) {
                    _w_view.show();
                }
            }

            //监听流程图弹出窗口
            function _w_view_onshow() {
                var record = AOS.selectone(_g_byteobj);
                if(record.data.content_type_.indexOf('image') === 0) {
                    Ext.get('_img_view').dom.src = "viewByteObj.jhtml?id_=" + record.data.id_;
                }else{
                    Ext.get('_img_view').dom.src = '${cxt}/static/image/no_view.png';
                }
                var imgObj = document.getElementById('_img_view');
                //图像数据加载完毕
                if (imgObj.complete) {
                    //
                }
                imgObj.onload = function () {
                    AOS.unmask();
                    var width = Ext.get('_img_view').getWidth() + 100;
                    var height = Ext.get('_img_view').getHeight() + 65;
                    var viewWidth = Ext.getBody().getViewSize().width;
                    var viewHeight = Ext.getBody().getViewSize().height;
                    width = width > viewWidth ? viewWidth : width;
                    height = height > viewHeight ? viewHeight : height;
                    var left = (viewWidth - width) / 2;
                    var top = (viewHeight - height) / 2;
                    _w_view.animate({
                        to: {
                            width: width,
                            height: height,
                            top: top,
                            left: left
                        }
                    });
                }
            }

            //下载流文件
            function _fn_downlod() {
                var record = AOS.selectone(_g_byteobj);
                var downloadIframe = document.createElement('iframe');
                downloadIframe.src = "downByteObj.jhtml?id_=" + record.data.id_;
                downloadIframe.style.display = "none";
                document.body.appendChild(downloadIframe);
            }

            //弹出新增流文件窗口
            function _w_byteobj_show() {
                AOS.reset(_f_byteobj);
                var record = AOS.selectone(_t_catalog);
                if (record) {
                    _tp_catalog_id_.setValue(record.raw.id_);
                    _tp_catalog_id_.setRawValue(record.raw.name_);
                }
                _f_byteobj.down('[name=key_]').setValue(AOS.uuid());
                _w_byteobj.show();
            }

            //弹出修改流文件窗口
            function _w_byteobj_u_show() {
                var record = AOS.selectone(_g_byteobj);
                if (record) {
                    _w_byteobj_u.show();
                    _f_byteobj_u.loadRecord(record);
                    _tp_catalog_id_u.setRawValue(record.raw.catalog_name_);
                    _f_byteobj_u.down('[name=old_key_]').setValue(record.raw.key_);
                }
            }

            //查询流文件列表
            function _g_byteobj_query() {
                var params = {
                    keyorname: _keyorname.getValue(),
                    cascade: _cascade.getValue()
                };
                var record = AOS.selectone(_t_catalog);
                if (record) {
                    params.catalog_id_ = record.raw.id;
                    params.catalog_cascade_id_ = record.raw.cascade_id_;
                }
                _g_byteobj_store.getProxy().extraParams = params;
                _g_byteobj_store.loadPage(1);
            }

            //新增流文件保存(注：文件上传操作不能使用AOS.Ajax()方法，只能使用Form自带的submit()函数)。
            function _f_byteobj_submit() {
                var form = _f_byteobj.getForm();
                if (!form.isValid()) {
                    return;
                }
                AOS.wait();
                form.submit({
                    timeout: 60000, // 60s
                    url: 'saveByteObj.jhtml',
                    success: function (form, action) {
                        if (action.result.appcode !== -1) {
                            _w_byteobj.hide();
                            _g_byteobj_store.reload();
                        }
                        AOS.hide();
                        AOS.tip(action.result.appmsg);
                    }
                });
            }

            //修改流文件保存
            function _f_byteobj_u_submit() {
                var form = _f_byteobj_u.getForm();
                if (!form.isValid()) {
                    return;
                }
                AOS.wait();
                form.submit({
                    timeout: 60000, // 60s
                    url: 'updateByteObj.jhtml',
                    success: function (form, action) {
                        if (action.result.appcode !== -1) {
                            _w_byteobj_u.hide();
                            _g_byteobj_store.reload();
                        }
                        AOS.hide();
                        AOS.tip(action.result.appmsg);
                    }
                });
            }

            //删除流文件
            function _g_byteobj_del() {
                var selection = AOS.selection(_g_byteobj, 'id_');
                if (AOS.empty(selection)) {
                    AOS.tip('删除前请先选中数据。');
                    return;
                }
                var rows = AOS.rows(_g_byteobj);
                var msg = AOS.merge('确认要删除选中的[{0}]条数据吗？', rows);
                AOS.confirm(msg, function (btn) {
                    if (btn === 'cancel') {
                        AOS.tip('删除操作被取消。');
                        return;
                    }
                    AOS.ajax({
                        url: 'deleteByteObj.jhtml',
                        params: {
                            aos_rows_: selection
                        },
                        ok: function (data) {
                            AOS.tip(data.appmsg);
                            _g_byteobj_store.reload();
                        }
                    });
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