/**
 * @class Ext.ux.form.HtmlEditor.Link
 * @extends Ext.util.Observable
 *          <p>
 *          A plugin that creates a button on the HtmlEditor for inserting a
 *          link.
 *          </p>
 */
Ext.ux.form.HtmlEditor.Link = Ext.extend(Ext.util.Observable, {
	// Link language text
	langTitle : '<span style="font-weight:normal">插入超链接</span>',
	langInsert : '插入',
	langCancel : '取消',
	langTarget : '打开目标',
	langURL : '链接地址',
	langText : '显示文本',
	// private
	linkTargetOptions : [['_self', '当前窗口'], ['_blank', '新窗口']],
	init : function(cmp) {
		cmp.enableLinks = false;
		this.cmp = cmp;
		this.cmp.on('render', this.onRender, this);
	},
	onRender : function() {
		var cmp = this.cmp;
		var btn = this.cmp.getToolbar().addButton({
			iconCls : 'x-edit-createlink',
			handler : function() {
				var sel = this.cmp.getSelectedText();
				if (!this.linkWindow) {
					this.linkWindow = new Ext.Window({
						title : this.langTitle,
						closeAction : 'hide',
						width : 350,
						height : 160,
						layout : 'fit',
						items : [{
							xtype : 'form',
							itemId : 'insert-link',
							border : false,
							plain : true,
							bodyStyle : 'padding: 10px;',
							labelWidth : 60,
							labelAlign : 'right',
							items : [{
										xtype : 'textfield',
										fieldLabel : this.langText,
										name : 'text',
										anchor : '100%',
										allowBlank : false,
										emptyText : '显示文本'
									}, {
										xtype : 'textfield',
										fieldLabel : this.langURL,
										name : 'url',
										anchor : '100%',
										allowBlank : false,
										emptyText : '请填入链接地址'
									}, {
										xtype : 'combo',
										fieldLabel : this.langTarget,
										name : 'target',
										forceSelection : true,
										mode : 'local',
										editable : false, // 选择输入框可编辑
										store : new Ext.data.ArrayStore({
													autoDestroy : true,
													fields : ['spec', 'val'],
													data : this.linkTargetOptions
												}),
										triggerAction : 'all',
										value : '_blank',
										displayField : 'val',
										valueField : 'spec',
										anchor : '100%'
									}]
						}],
						buttons : [{
							text : this.langInsert,
							iconCls : 'acceptIcon',
							handler : function() {
								var frm = this.linkWindow
										.getComponent('insert-link').getForm();
								if (frm.isValid()) {
									url = frm.findField('url').getValue();
									if (!this.isUrl(url)) {
										Ext.Msg.alert('提示', 'URL不合法.请重新输入.格式[http://****]');
										return;
									};
									afterSpace = '', sel = this.cmp
											.getSelectedText(true), text = frm
											.findField('text').getValue(), url = frm
											.findField('url').getValue(), target = frm
											.findField('target').getValue();
									if (text.length
											&& text[text.length - 1] == ' ') {
										text = text.substr(0, text.length - 1);
										afterSpace = ' ';
									}
									if (sel.hasHTML) {
										text = sel.html;
									}
									var html = '<a href="' + url + '" target="'
											+ target + '">' + text + '</a>'
											+ afterSpace;
									this.cmp.insertAtCursor(html);
									this.linkWindow.hide();
								} else {
									if (!frm.findField('url').isValid()) {
										frm.findField('url').getEl().frame();
									} else if (!frm.findField('target')
											.isValid()) {
										frm.findField('target').getEl().frame();
									}
								}

							},
							scope : this
						}, {
							text : this.langCancel,
							iconCls : 'deleteIcon',
							handler : function() {
								this.linkWindow.hide();
							},
							scope : this
						}],
						listeners : {
							show : {
								fn : function() {
									var sel = this.cmp.getSelectedText();
									var frm = this.linkWindow
											.getComponent('insert-link')
											.getForm();
									frm.reset();
									if (sel.textContent != '') {
										frm.findField('text')
												.setValue(sel.textContent)
												.setDisabled(sel.hasHTML);
									}
								},
								scope : this,
								defer : 350
							}
						}
					});
					this.linkWindow.show();
				} else {
					this.linkWindow.show();
					this.linkWindow.getEl().frame();
				}
			},
			scope : this,
			tooltip : this.langTitle
		});
	},
	isUrl : function(urlString) {
		regExp = /(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i;
		if (urlString.match(regExp))
			return true;
		else
			return false;
	}
});
