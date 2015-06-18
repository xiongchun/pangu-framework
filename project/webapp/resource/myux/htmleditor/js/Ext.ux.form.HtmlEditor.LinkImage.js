/**
 * @class Ext.ux.form.HtmlEditor.Image
 * @extends Ext.util.Observable
 *          <p>
 *          A plugin that creates an image button in the HtmlEditor toolbar for
 *          inserting an image. The method to select an image must be defined by
 *          overriding the selectImage method. Supports resizing of the image
 *          after insertion.
 *          </p>
 *          <p>
 *          The selectImage implementation must call insertImage after the user
 *          has selected an image, passing it a simple image object like the one
 *          below.
 *          </p>
 * 
 * <pre>
 * var img = {
 * 	Width : 100,
 * 	Height : 100,
 * 	ID : 123,
 * 	Title : 'My Image'
 * };
 * </pre>
 */
Ext.ux.form.HtmlEditor.Image = Ext.extend(Ext.util.Observable, {
	// Image language text
	langTitle : '<span style="font-weight:normal">插入图片</span>',
	urlSizeVars : ['width', 'height'],
	basePath : '',
	init : function(cmp) {
		this.cmp = cmp;
		this.cmp.on('render', this.onRender, this);
		this.cmp.on('initialize', this.onInit, this, {
					delay : 100,
					single : true
				});
	},
	onEditorMouseUp : function(e) {
		Ext.get(e.getTarget()).select('img').each(function(el) {
			var w = el.getAttribute('width'), h = el.getAttribute('height'), src = el
					.getAttribute('src')
					+ ' ';
			src = src.replace(new RegExp(this.urlSizeVars[0]
							+ '=[0-9]{1,5}([&| ])'), this.urlSizeVars[0] + '='
							+ w + '$1');
			src = src.replace(new RegExp(this.urlSizeVars[1]
							+ '=[0-9]{1,5}([&| ])'), this.urlSizeVars[1] + '='
							+ h + '$1');
			el.set({
						src : src.replace(/\s+$/, "")
					});
		}, this);

	},
	onInit : function() {
		Ext.EventManager.on(this.cmp.getDoc(), {
					'mouseup' : this.onEditorMouseUp,
					buffer : 100,
					scope : this
				});
	},
	onRender : function() {
		var btn = this.cmp.getToolbar().addButton({
					iconCls : 'x-edit-image',
					handler : this.selectImage,
					scope : this,
					tooltip : {
						title : this.langTitle
					},
					overflowText : this.langTitle
				});
	},
	selectImage : function() {
		// alert('OK');
		if (!this.imgWindow) {
			this.imgWindow = new Ext.Window({
						title : this.langTitle,
						closeAction : 'hide',
						width : 400,
						height : 140,
						layout : 'fit',
						items : [{
									xtype : 'form',
									itemId : 'insert-img',
									border : false,
									plain : true,
									bodyStyle : 'padding: 10px;',
									labelWidth : 60,
									labelAlign : 'right',
									items : [{
												xtype : 'textfield',
												fieldLabel : '图片URL',
												name : 'url',
												anchor : '100%',
												allowBlank : false,
												emptyText : '请填入支持外链的长期有效的图片URL'
											}, {
												xtype : 'textfield',
												fieldLabel : '图片说明',
												name : 'name',
												maxLength : 100,
												anchor : '100%',
												emptyText : '简短的图片说明'
											}]
								}],
						buttons : [{
							text : '插入',
							iconCls : 'acceptIcon',
							handler : function() {
								var frm = this.imgWindow
										.getComponent('insert-img').getForm();
								if (frm.isValid()) {
									url = frm.findField('url').getValue();
									if(!this.isUrl(url)){
										Ext.Msg.alert('提示', 'URL不合法.请重新输入.格式[http://****]');
										return;
									};
									var img = {
										// Width : 100,
										// Height : 100,
										Url : frm.findField('url').getValue(),
										ID : 'id_img_9999',
										Title : frm.findField('name')
												.getValue()
									};
									this.insertImage(img);
									this.imgWindow.hide();
								} else {
									if (!frm.findField('url').isValid()) {
										frm.findField('url').getEl().frame();
									}
								}

							},
							scope : this
						}, {
							text : '取消',
							iconCls : 'deleteIcon',
							handler : function() {
								this.imgWindow.hide();
							},
							scope : this
						}],
						listeners : {
							show : {
								fn : function() {
									var sel = this.cmp.getSelectedText();
									var frm = this.imgWindow
											.getComponent('insert-img')
											.getForm();
									frm.reset();
									// frm.findField('url').focus(true, 50);
								},
								scope : this,
								defer : 350
							}
						}
					});
			this.imgWindow.show();
		} else {
			this.imgWindow.show();
			this.imgWindow.getEl().frame();
		}
	},
	insertImage : function(img) {
		this.cmp.insertAtCursor('<img src="' + img.Url + '" title="' + img.Name
				+ '" alt="' + img.Name + '">');
	},
	isUrl : function(urlString) {
		regExp = /(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i;
		if (urlString.match(regExp))
			return true;
		else
			return false;
	}

});