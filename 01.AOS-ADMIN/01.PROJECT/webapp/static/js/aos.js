/**
 * AOS UI前台封装类库 Based ExtJS
 * 
 * @author xiongchun
 */
Ext.ns("AOS");

/**
 * 返回树或表格当前所有选中行的Record对象集合。
 */
AOS.select = function (pObj) {
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
 * 返回树或表格当前选中行的Record对象。
 *  @param pObj
 *          集合ID。如果是树模型，则强制返回选中行的第一行。
 * @param force
 *          true：强制返回选中行的第一行，无提示信息；false：做逻辑校验后返回。缺省：false。
 */
AOS.selectone = function (pObj, force) {
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
    var rows = AOS.rows(pObj);
    if (rows > 1) {
        AOS.tip('操作被取消，该业务只能操作单条记录，请重新选择。')
        return;
    } else if (rows === 0) {
        AOS.tip('操作被取消，请先选择一条记录。')
        return;
    }else{
        var records = pObj.getSelectionModel().getSelection();
        return records[0];
    }
}

/**
 * 提取树或表格选中行的某一字段值以逗号分割传给后台
 */
AOS.selection = function (pObj, pField) {
    if (Ext.isEmpty(pField) || Ext.isEmpty(pObj)) {
        AOS.err('AOS.selection()参数不合法，请检查。');
        console.error('AOS.selection()参数不合法，请检查。');
    }
    var records = AOS.select(pObj);
    var outString = '';
    Ext.Array.each(records, function (record) {
        outString += record.get(pField) + ",";
    });
    return outString;
}

/**
 * 返回树或表格当前所有选中行的所有字段转换为json格式返回
 */
AOS.select2json = function (pObj) {
    var records = AOS.select(pObj);
    var jsonArray = [];
    Ext.each(records, function (record) {
        jsonArray.push(record.data);
    });
    return Ext.encode(jsonArray);
}

/**
 * 返回表格修改数据Json集合。(含新增的和修改的)
 * getModifiedRecords
 * 
 *  @param pObj
 *          表格ID。
 */
AOS.mrs = function (pGrid) {
    var records = pGrid.store.getModifiedRecords();
    var jsonArray = [];
    Ext.each(records, function (record) {
        jsonArray.push(record.data);
    });
    return Ext.encode(jsonArray);
}

/**
 * 返回表格修改行数
 */
AOS.mrows = function (pGrid) {
    var records = pGrid.store.getModifiedRecords();
    return records.length;
}

/**
 * 返回表格或树选中行数
 */
AOS.rows = function (pObj) {
    var records = AOS.select(pObj);
    return records.length;
}

/**
 * 将表单元素设置为只读模式。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
AOS.read = function (pField) {
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
AOS.reads = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        AOS.read(field);
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
AOS.field = function (pForm, pName) {
    return pForm.form.findField(pName);
}

/**
 * 将表单元素设置为可编辑模式。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
AOS.edit = function (pField) {
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
AOS.edits = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        AOS.edit(field);
    });
}

/**
 * 隐藏表单元素的小红星
 */
AOS.unstar = function (pField) {
    var label = Ext.get(pField.id + '-labelEl');
    if (!AOS.empty(label) && label.first()) {
        label.first().hide();
        pField.allowBlank = true;
        pField.clearInvalid();
    }
}

/**
 * 显示表单元素的小红星
 */
AOS.star = function (pField) {
    var label = Ext.get(pField.id + '-labelEl');
    if (!AOS.empty(label) && label.first()) {
        label.first().show();
        pField.allowBlank = false;
    }
}

/**
 * 禁用表单元素。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
AOS.disable = function (pField) {
    pField.disable();
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#F8F8FF"
        });
    }
    // 去除红星
    AOS.unstar(pField);
}

/**
 * 批量禁用表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
AOS.disables = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        AOS.disable(field);
    });
}

/**
 * 启用表单元素。 提示：仅针对表单元素调用此方法，其它组件使用原生方法。
 */
AOS.enable = function (pField) {
    pField.enable();
    if (pField.xtype !== 'checkboxfield' && pField.xtype !== 'radiofield') {
        pField.setFieldStyle({
            background: "#FFFFFF"
        });
    }
    // 显示红星
    AOS.star(pField);
}

/**
 * 批量启用表单元素。
 *
 * @param pForm
 *          表单对象
 * @param pNames
 *          表单元素name值，多个name值用逗号分割。
 */
AOS.enables = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        AOS.enable(field);
    });
}

/**
 * 根据ID批量启用Ext组件(表单输入框元素除外)
 *
 * @param pIds
 *          组件ID值，多个组件其ID值用逗号分割。
 */
AOS.enableCmps = function (pIds) {
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
AOS.disableCmps = function (pIds) {
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
AOS.shows = function (pForm, pNames) {
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
AOS.hides = function (pForm, pNames) {
    Ext.Array.each(pNames.split(','), function (name) {
        var field = pForm.form.findField(name);
        field.hide();
    });
}

/**
 * 参数式合并填充字符串模版
 * var s =AOS.merge('{0} {1}', v0, v1);
 * 使用原生Ext.String.format可以支持无限多个参数
 */
AOS.merge = function (string, v0, v1, v2, v3, v4, v5, v7, v8, v9) {
    var msg = Ext.String.format(string, v0, v1, v2, v3, v4, v5, v7, v8, v9);
    return msg;
}

/**
 * 判断对象是否为空
 */
AOS.empty = function (obj) {
    return Ext.isEmpty(obj);
}

/**
 * 发起Aiax请求
 *
 * @param wait
 *          是否自动显示等待框。缺省：true。
 * @param wmsg
 *          等待框提示信息。缺省：同AOS.wait()的缺省值。
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
AOS.ajax = function (cfg) {
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
        Ext.log('表单合法性校验未通过，Ajax请求取消。如果这和您的预期不符，请检查调用AOS.ajax()时是否多传或错传了forms参数。');
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
        AOS.wait(cfg.wmsg);
    }
    var _cfg = {
        success: function (response, opts) {
            if (cfg.wait || Ext.isEmpty(cfg.wait)) {
                AOS.hide();
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
AOS.reset = function (forms) {
    if (!Ext.isEmpty(forms)) {
        Ext.Array.each(forms, function (form) {
            form.form.reset();
        });
    }
};

/**
 * 提示信息
 */
AOS.info = function (msg, fn, title) {
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
AOS.err = function (msg, title) {
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
AOS.confirm = function (msg, fn, title) {
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
AOS.wait = function (msg, waitText) {
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
AOS.hide = function () {
    try {
        Ext.MessageBox.hide();
    } catch (e) {
        // do nothing
    }
};

/**
 * 滑出方式的系统通知框
 */
AOS.tip = function (msg, title) {
    if (Ext.isEmpty()) {
        title = '系统提示';
    }
    title = '<i class="fa fa-bell-o"></i> ' + title;
    top.Ext.create('widget.uxNotification', {
        position: 't',
        cls: 'ux-notification-light',
        closable: true,
        title: AOS.title(title),
        slideInDuration: 200,
        autoCloseDelay: 1500,
        slideInAnimation: 'ease',
        minWidth: 200,
        maxWidth: 600,
        html: msg
    }).show();
};

// 全局阴影对象
AOS.MaskObj = {};

/**
 * 阴影遮盖等待信息
 *
 * @param msg
 *          提示信息文本
 * @param parent
 *          遮罩的元素
 */
AOS.mask = function (msg, parent) {
    if (Ext.isEmpty(parent)) {
        parent = Ext.getBody();
    }
    if (Ext.isEmpty(msg)) {
        msg = '系统正在处理您的请求，请稍候...';
    }
    AOS.MaskObj = Ext.create('Ext.LoadMask', {
        target: parent,
        // 只遮盖容器内部区域(不含标题)
        useTargetEl: true,
        msg: msg
    });
    AOS.MaskObj.show();
};

/**
 * 关闭阴影遮盖等待信息
 */
AOS.unmask = function () {
    try {
    	 AOS.MaskObj.hide();
    } catch (e) {
        //
    }
};

/**
 * 设置Title文本字体
 */
AOS.title = function (title) {
    return AOS.merge('<span class="app-container-title-normal">{0}</span>', title);
}

/**
 * 定时作业
 */
AOS.job = function (fn, delay) {
    var job = new Ext.util.DelayedTask(fn);
    job.delay(delay);
}

/**
 * 循环任务
 */
AOS.task = function (fn, interval) {
    var task = Ext.TaskManager.start({
        run: fn,
        interval: interval
    });
}

/**
 * 校验表单是否合法
 */
AOS.valid = function (form) {
    if (form.isValid()) {
        return true;
    } else {
        return false;
    }
}

/**
 * 表单元素赋值方法
 * 用法：(1)、根据表单ID.元素名称的规则设值AOS.setValue('_id__form.name_', 'aos');
 *           (2)、根据元素ID设值AOS.setValue('_id', 'aos');
 */
AOS.setValue = function(target, value){
	if(AOS.empty(target)) return;
	//根据元素ID设值
	if(target.indexOf('.') === -1){
		var field = Ext.getCmp(target);
		if(AOS.empty(field)) return;
		field.setValue(value);
	}else{
		//根据表单ID.元素名称的规则设值
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(AOS.empty(form) || form.xtype != 'formpanel'){
			console.log('AOS.setValue()方法参数错误，表单对象获取失败。');
			return;
		}
		form.down('[name=' + targets[1] + ']').setValue(value);
	}
}

/**
 * 表单元素取值方法
 * 用法：(1)、根据表单ID.元素名称的规则取AOS.getValue('_form.name_');
 *           (2)、根据元素ID取值。AOS.getValue('_id');
 *           (3)、根据表单ID取出，返回JSON格式。
 */
AOS.getValue = function(target){
	if(AOS.empty(target)) return;
	//根据元素ID取值
	if(target.indexOf('.') === -1){
		var obj = Ext.getCmp(target);
		if(AOS.empty(obj)) return;
		if(obj.xtype === 'formpanel'){
			return obj.getValues();
		}else{
			return obj.getValue();
		}
	}else{
		//根据表单ID.元素名称的规则取值
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(AOS.empty(form) || form.xtype != 'formpanel'){
			console.log('AOS.getValue()方法参数错误，表单对象获取失败。');
			return;
		}
		return form.down('[name=' + targets[1] + ']').getValue();
	}
}

/**
 * 获取组件对象的方法
 * 用法：(1)、根据组件ID获取AOS.get('_id');
 *           (2)、根据表单ID.表单元素名称获取表单元素对象。AOS.get('_id_form.name_');
 */
AOS.get = function(target){
	if(AOS.empty(target)) return;
	//根据ID获取组件
	if(target.indexOf('.') === -1){
		var obj = Ext.getCmp(target);
		if(AOS.empty(obj)) return;
		return obj;
	}else{
		//根据表单ID.元素名称的规则取组件
		var targets = target.split('.');
		var form = Ext.getCmp(targets[0]);
		if(AOS.empty(form) || form.xtype != 'formpanel'){
			console.error('AOS.get()方法参数错误，对象获取失败。');
		}
		return form.down('[name=' + targets[1] + ']');
	}
}

/**
 * 生成UUID
 */
AOS.uuid = function() {
    return Ext.data.IdGenerator.get('uuid').generate();
};

/**
 * 下载文件
 */
AOS.file = function(url) {
	var iframe = document.createElement('iframe');
	iframe.style.display = "none";
	iframe.src = url;
	document.body.appendChild(iframe);
};

/**
 * 获取身份证相关信息
 */
AOS.idinfo = function(cardno) {
	var info = {
		isTrue : false,
		year : null,
		month : null,
		day : null,
		isMale : false,
		isFemale : false
	};
	if (!cardno || (15 != cardno.length && 18 != cardno.length)) {
		info.isTrue = false;
		return info;
	}
	if (15 == cardno.length) {
		var year = cardno.substring(6, 8);
		var month = cardno.substring(8, 10);
		var day = cardno.substring(10, 12);
		var p = cardno.substring(14, 15); // 性别位
		var birthday = new Date(year, parseFloat(month) - 1, parseFloat(day));
		// 对于老身份证中的年龄则不需考虑千年虫问题而使用getYear()方法
		if (birthday.getYear() != parseFloat(year)
				|| birthday.getMonth() != parseFloat(month) - 1
				|| birthday.getDate() != parseFloat(day)) {
			info.isTrue = false;
		} else {
			info.isTrue = true;
			info.year = birthday.getFullYear();
			info.month = birthday.getMonth() + 1;
			info.day = birthday.getDate();
			if (p % 2 == 0) {
				info.isFemale = true;
				info.isMale = false;
			} else {
				info.isFemale = false;
				info.isMale = true
			}
		}
		return info;
	}
	if (18 == cardno.length) {
		var year = cardno.substring(6, 10);
		var month = cardno.substring(10, 12);
		var day = cardno.substring(12, 14);
		var p = cardno.substring(14, 17)
		var birthday = new Date(year, parseFloat(month) - 1, parseFloat(day));
		// 这里用getFullYear()获取年份，避免千年虫问题
		if (birthday.getFullYear() != parseFloat(year)
				|| birthday.getMonth() != parseFloat(month) - 1
				|| birthday.getDate() != parseFloat(day)) {
			info.isTrue = false;
			return info;
		}
		var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子
		var Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值.10代表X
		// 验证校验位
		var sum = 0; // 声明加权求和变量
		var _cardno = cardno.split("");
		if (_cardno[17].toLowerCase() == 'x') {
			_cardno[17] = 10;// 将最后位为x的验证码替换为10方便后续操作
		}
		for ( var i = 0; i < 17; i++) {
			sum += Wi[i] * _cardno[i];// 加权求和
		}
		var i = sum % 11;// 得到验证码所位置
		if (_cardno[17] != Y[i]) {
			return info.isTrue = false;
		}
		info.isTrue = true;
		info.year = birthday.getFullYear();
		info.month = birthday.getMonth() + 1;
		info.day = birthday.getDate();
		if (p % 2 == 0) {
			info.isFemale = true;
			info.isMale = false;
		} else {
			info.isFemale = false;
			info.isMale = true
		}
		return info;
	}
	return info;
};

/**
 * 身份证快捷校验
 */
AOS.idcheck = function(obj_) {
	   if(AOS.empty(obj_.getValue())) return;
	   if(!AOS.idinfo(obj_.getValue()).isTrue){
		   obj_.markInvalid('身份证校验失败，请核对。');
	   }
}

/**
 * 自定义Window : 例子而已
 */
Ext.define('Ext.AOS.Msg', {
    extend: 'Ext.window.Window',
    alias: 'aos.msg',
    initComponent: function () {
        var me = this;
        me.callParent(arguments);
    }
});