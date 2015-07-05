/**
 * AOS UI前台封装类库 Based ExtJS
 */
Ext.ns("App");

/**
 * 返回树或表格当前所有选中行的Record对象集合。
 */
App.select = function (pObj) {
    var records;
    if (pObj.xtype === 'treepanel') {
        //树复选框
        records = pObj.getView().getChecked();
    } else {
        //表格
        records = pObj.getSelectionModel().getSelection();
    }
    return records;
}

/**
 * 提取树或表格选中行的某一字段值以逗号分割传给后台
 */
App.selection = function (pObj, pField) {
    if (Ext.isEmpty(pField) || Ext.isEmpty(pObj)) {
        App.err('App.selection()参数不合法，请检查。');
        console.error('App.selection()参数不合法，请检查。');
    }
    var records = App.select(pObj);
    var outString = '';
    Ext.Array.each(records, function (record) {
        outString += record.get(pField) + ",";
    });
    return outString;
}

/**
 * 返回树或表格当前选中行的Record对象。
 *  @param pObj
 *          集合ID。如果是树模型，则强制返回选中行的第一行。
 * @param force
 *          true：强制返回选中行的第一行，无提示信息；false：做逻辑校验后返回。缺省：false。
 */
App.selectone = function (pObj, force) {
    //如果是树模型则总是返回选中的第一条
    if(pObj.xtype === 'treepanel'){
        var records = pObj.getSelectionModel().getSelection();
        return records[0];
    }
    //表格
    if(force === true){
        var records = pObj.getSelectionModel().getSelection();
        return records[0];
    }
    var rows = App.rows(pObj);
    if (rows > 1) {
        App.tip('操作被取消，该业务只能操作单条记录，请重新选择。')
        return;
    } else if (rows === 0) {
        App.tip('操作被取消，请先选择一条记录。')
        return;
    }else{
        var records = pObj.getSelectionModel().getSelection();
        return records[0];
    }
}

/**
 * 返回树或表格当前所有选中行的所有字段转换为json格式返回
 */
App.selection2 = function (pObj) {
    var records = App.select(pObj);
    var jsonArray = [];
    Ext.each(records, function (record) {
        jsonArray.push(record.data);
    });
    return Ext.encode(jsonArray);
}

/**
 * 返回表格或树选中行数
 */
App.rows = function (pObj) {
    var records = App.select(pObj);
    return records.length;
}

/**
 * 将表单元素设置为只读模式。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
App.read = function (pField) {
    pField.setReadOnly(true);
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#F8F8FF"
        });
    }
}

/**
 * 批量将表单元素设置为只读模式。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.reads = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        App.read(field);
    });
}

/**
 * 获取表单元素
 *
 * @param pForm
 *          表单对象
 * @param pName
 *          表单元素name值
 */
App.field = function (pForm, pName) {
    return pForm.form.findField(pName);
}

/**
 * 将表单元素设置为可编辑模式。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
App.edit = function (pField) {
    pField.setReadOnly(false);
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#FFFFFF"
        });
    }
}

/**
 * 批量将表单元素设置为可编辑模式。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.edits = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        App.edit(field);
    });
}

/**
 * 隐藏表单元素的小红星
 */
App.unstar = function (pField) {
    var label = Ext.get(pField.id + '-labelEl');
    if (!App.empty(label) && label.first()) {
        label.first().hide();
    }
}

/**
 * 显示表单元素的小红星
 */
App.star = function (pField) {
    var label = Ext.get(pField.id + '-labelEl');
    if (!App.empty(label) && label.first()) {
        label.first().show();
    }
}

/**
 * 禁用表单元素。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
App.disable = function (pField) {
    pField.disable();
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#F8F8FF"
        });
    }
    // 去除红星
    App.unstar(pField);
}

/**
 * 批量禁用表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.disables = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        App.disable(field);
    });
}

/**
 * 启用表单元素。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
App.enable = function (pField) {
    pField.enable();
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#FFFFFF"
        });
    }
    // 显示红星
    App.star(pField);
}

/**
 * 批量启用表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.enables = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        App.enable(field);
    });
}

/**
 * 根据ID批量启用Ext组件(表单输入框元素除外)
 *
 * @param pIds
 *          组件ID值，多个组件其ID值用逗号分割。
 */
App.enableCmps = function (pIds) {
    Ext.Array.each(pIds.split(','), function (id) {
        Ext.getCmp(id).enable();
    });
}

/**
 * 根据ID批量禁用Ext组件(表单输入框元素除外)
 *
 * @param pIds
 *          组件ID值，多个组件其ID值用逗号分割。
 */
App.disableCmps = function (pIds) {
    Ext.Array.each(pIds.split(','), function (id) {
        Ext.getCmp(id).disable();
    });
}

/**
 * 批量显示表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.shows = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        field.show();
    });
}

/**
 * 批量隐藏表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
App.hides = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        field.hide();
    });
}

/**
 * 参数式合并填充字符串模版
 * var s =App.merge('{0} {1}', v0, v1);
 * 使用原生Ext.String.format可以支持无限多个参数
 */
App.merge = function (string, v0, v1, v2, v3, v4, v5, v7, v8, v9) {
    var msg = Ext.String.format(string, v0, v1, v2, v3, v4, v5, v7, v8, v9);
    return msg;
}

/**
 * 判断对象是否为空
 */
App.empty = function (obj) {
    return Ext.isEmpty(obj);
}

/**
 * 发起Aiax请求
 *
 * @param wait
 *          是否自动显示等待框。缺省：true。
 * @param wmsg
 *          等待框提示信息。缺省：同App.wait()的缺省值。
 * @param url
 *          Ajax的请求地址
 * @param ok
 *          成功回调函数(参数为Json返回JS对象)
 * @param params
 *          参数Json对象
 * @param forms
 *          参与这次提交的相关表单或表单数组(复合参数类型)。
 * @param timeout
 *          超时时间，缺省为120s。
 * @param validate
 *          是否对forms参数传入的表单开启表单校验功能。缺省：true。
 *
 */
App.ajax = function (cfg) {
    var validate = cfg.validate;
    // 缺省开启表单校验开关
    if (Ext.isEmpty(validate)) {
        validate = true;
    }
    var params = cfg.params;
    if (Ext.isEmpty(params)) {
        params = {};
    }
    var forms = cfg.forms;
    // 表单验证通过标志，缺省为true
    var isValid = true;
    if (!Ext.isEmpty(forms)) {
        Ext.Array.each(forms, function (form) {
            // 表单验证
            if (validate && !form.isValid()) {
                isValid = false;
            }
            // 表单参数复制
            Ext.apply(params, form.getValues());
        });
    }
    // 如果是表单提交，且表单验证不通过则返回
    if (!isValid) {
        Ext.log('表单合法性校验未通过，Ajax请求取消。如果这和您的预期不符，请检查调用App.ajax()时是否多传或错传了forms参数。');
        return;
    }
    var mycfg = {
        params: params,
        url: cfg.url
    }
    // 如果未配置则缺省使用全局配置的超时时间120S
    if (!Ext.isEmpty(cfg.timeout)) {
        mycfg.timeout = cfg.timeout;
    }
    if (cfg.wait || Ext.isEmpty(cfg.wait)) {
        App.wait(cfg.wmsg);
    }
    var _cfg = {
        success: function (response, opts) {
            if (cfg.wait || Ext.isEmpty(cfg.wait)) {
                App.hide();
            }
            var responseText = response.responseText;
            if (Ext.isEmpty(responseText)) {
                responseText = "{}";
            }
            cfg.ok(Ext.decode(responseText));
        }
    }
    Ext.apply(_cfg, mycfg);
    Ext.Ajax.request(_cfg);
};

/**
 * 重置表单
 *
 * @param forms
 *          复合参数，可以是一个表单对象，也可以是一个表单对象数组
 */
App.reset = function (forms) {
    if (!Ext.isEmpty(forms)) {
        Ext.Array.each(forms, function (form) {
            form.form.reset();
        });
    }
};

/**
 * 提示信息
 */
App.info = function (msg, fn, title) {
    if (Ext.isEmpty(title)) {
        title = '提示';
    }
    Ext.Msg.show({
        title: '<span class="app-container-title-normal">' + title + '</span>',
        msg: msg,
        buttons: Ext.Msg.OK,
        fn: fn,
        buttonText: {
            ok: '<span class="app-normal">确定</span>'
        },
        icon: Ext.Msg.INFO
    });
};

/**
 * 错误信息
 */
App.err = function (msg, title) {
    if (Ext.isEmpty(title)) {
        title = '提示';
    }
    Ext.Msg.show({
        title: '<span class="app-container-title-normal">' + title + '</span>',
        msg: msg,
        buttons: Ext.Msg.OK,
        buttonText: {
            ok: '<span class="app-normal">确定</span>'
        },
        icon: Ext.Msg.ERROR
    });
};

/**
 * 确认信息
 */
App.confirm = function (msg, fn, title) {
    if (Ext.isEmpty(title)) {
        title = '请确认';
    }
    Ext.Msg.show({
        title: '<span class="app-container-title-normal">' + title + '</span>',
        msg: msg,
        buttons: Ext.Msg.OKCANCEL,
        fn: fn,
        buttonText: {
            ok: '<span class="app-normal">确定</span>',
            cancel: '<span class="app-normal">取消</span>'
        },
        icon: Ext.Msg.QUESTION
    });
};

/**
 * 等待信息
 */
App.wait = function (msg, waitText) {
    if (Ext.isEmpty(waitText)) {
        waitText = '处理中...';
    }
    if (Ext.isEmpty(msg)) {
        msg = '系统正在处理您的请求，请稍候...';
    }
    Ext.MessageBox.show({
        msg: msg,
        wait: true,
        waitConfig: {
            interval: 1,
            increment: 280,
            text: '<span class="app-normal">' + waitText + '</span>'
        }
    });
};

/**
 * 结束等待信息
 */
App.hide = function () {
    try {
        Ext.MessageBox.hide();
    } catch (e) {
        // do nothing
    }
};

/**
 * 滑出方式的系统通知框
 */
App.tip = function (msg, title) {
    if (Ext.isEmpty()) {
        title = '系统提示';
    }
    title = '<i class="fa fa-bell-o"></i> ' + title;
    top.Ext.create('widget.uxNotification', {
        position: 't',
        cls: 'ux-notification-light',
        closable: true,
        title: App.title(title),
        slideInDuration: 200,
        autoCloseDelay: 1500,
        slideInAnimation: 'ease',
        minWidth: 200,
        maxWidth: 600,
        html: msg
    }).show();
};

// 全局阴影对象
App.MaskObj = {};

/**
 * 阴影遮盖等待信息
 *
 * @param msg
 *          提示信息文本
 * @param parent
 *          遮罩的元素
 */
App.mask = function (msg, parent) {
    if (Ext.isEmpty(parent)) {
        parent = Ext.getBody();
    }
    if (Ext.isEmpty(msg)) {
        msg = '系统正在处理您的请求，请稍候...';
    }
    App.MaskObj = Ext.create('Ext.LoadMask', {
        target: parent,
        // 只遮盖容器内部区域(不含标题)
        useTargetEl: true,
        msg: msg
    });
    App.MaskObj.show();
};

/**
 * 关闭阴影遮盖等待信息
 */
App.unmask = function () {
    try {
    	 App.MaskObj.hide();
    } catch (e) {
        //
    }
};

/**
 * 设置Title文本字体
 */
App.title = function (title) {
    return App.merge('<span class="app-container-title-normal">{0}</span>', title);
}

/**
 * 定时作业
 */
App.job = function (fn, delay) {
    var job = new Ext.util.DelayedTask(fn);
    job.delay(delay);
}

/**
 * 循环任务
 */
App.task = function (fn, interval) {
    var task = Ext.TaskManager.start({
        run: fn,
        interval: interval
    });
}

/**
 * 校验表单是否合法
 */
App.valid = function (form) {
    if (form.isValid()) {
        return true;
    } else {
        return false;
    }
}

/**
 * 表单元素赋值方法
 * 用法：(1)、根据表单ID.元素名称的规则设值App.val('_id__form.name_', 'aos');
 *           (2)、根据元素ID设值App.val('_id', 'aos');
 */
App.val = function(target, value){
	if(App.empty(target)) return;
	//根据元素ID设值
	if(target.indexOf('.') === -1){
		var field = Ext.getCmp(target);
		if(App.empty(field)) return;
		field.setValue(value);
	}else{
		//根据表单ID.元素名称的规则设值
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(App.empty(form) || form.xtype != 'formpanel'){
			console.log('App.val()方法参数错误，表单对象获取失败。');
			return;
		}
		form.down('[name=' + targets[1] + ']').setValue(value);
	}
}

/**
 * 表单元素取值方法
 * 用法：(1)、根据表单ID.元素名称的规则取App.val('_form.name_');
 *           (2)、根据元素ID取值。App.val('_id');
 *           (3)、根据表单ID取出，返回JSON格式。
 */
App.val = function(target){
	if(App.empty(target)) return;
	//根据元素ID取值
	if(target.indexOf('.') === -1){
		var obj = Ext.getCmp(target);
		if(App.empty(obj)) return;
		if(obj.xtype === 'formpanel'){
			return obj.getValues();
		}else{
			return obj.getValue();
		}
	}else{
		//根据表单ID.元素名称的规则取值
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(App.empty(form) || form.xtype != 'formpanel'){
			console.log('App.val()方法参数错误，表单对象获取失败。');
			return;
		}
		return form.down('[name=' + targets[1] + ']').getValue();
	}
}

/**
 * 获取组件对象的方法
 * 用法：(1)、根据组件ID获取App.get('_id');
 *           (2)、根据表单ID.表单元素名称获取表单元素对象。App.get('_id_form.name_');
 */
App.get = function(target){
	if(App.empty(target)) return;
	//根据ID获取组件
	if(target.indexOf('.') === -1){
		var obj = Ext.getCmp(target);
		if(App.empty(obj)) return;
		return obj;
	}else{
		//根据表单ID.元素名称的规则取组件
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(App.empty(form) || form.xtype != 'formpanel'){
			console.error('App.get()方法参数错误，对象获取失败。');
		}
		return form.down('[name=' + targets[1] + ']');
	}
}



App.uuid = function() {
    return Ext.data.IdGenerator.get('uuid').generate();
};

/**
 * 自定义Window
 */
Ext.define('Ext.App.Msg', {
    extend: 'Ext.window.Window',
    alias: 'app.msg',
    initComponent: function () {
        var me = this;
        me.callParent(arguments);
    }
});