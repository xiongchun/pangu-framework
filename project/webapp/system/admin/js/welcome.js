/**
 * 欢迎页面
 * 
 */
Ext.onReady(function() {
			new Ext.ux.TipWindow({
						title : '<span class=commoncss>提示</span>',
						html : '您有[0]条未读信息. ',
						iconCls : 'commentsIcon'
					}).show(Ext.getBody());
		});

Ext.onReady(function() {
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

	var tools = [{
				id : 'maximize',
				handler : function(e, target, panel) {
				}
			}];

	var my_height1 = document.body.clientHeight - 35;
	var my_height = document.body.clientHeight - 65;
	var my_doc = '<div style="margin:10px"><a href="http://42.120.21.17:8888/g4studio/g4studio-doc.zip">《G4Studio开发指南》下载</a></div>';
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [{
			xtype : 'portal',
			region : 'center',
			margins : '3 3 3 3',
			items : [{
						columnWidth : .7,
						style : 'padding:8px 0px 8px 8px',
						items : [{
									title : '《G4Studio开发指南》',
									layout : 'fit',
									height : 550,
									html:'<iframe width="738" height="550" class="preview-iframe" scrolling="no" frameborder="0" src="http://download.csdn.net/source/preview/7902861/c74a39e3e0a9823d54541e98ea96f5a7" ></iframe>'
								}]
					}, {
						columnWidth : .3,
						style : 'padding:8px 8px 8px 8px',
						items : [{
							title : '文档下载 ',
							html : my_doc
						}, {
							title : '联系方式',
							// tools : tools,
							html : '<div style=height:60px;line-height:25px class=commoncss>&nbsp;&nbsp;电子邮箱: 307916217@qq.com<br>&nbsp;&nbsp;项目主页：<a href="http://www.g4it.org" target="_blank">www.g4it.org</a></div>'
						},{
							title : '新浪微博',
							contentEl:'sina_weibo'
						}, {
							title : '舍我其谁',
							// tools : tools,
							html : '<div style=height:155px;line-height:25px class=commoncss>&nbsp;&nbsp;如果G4Studio与你无缘, 那我推荐如下一些优秀的开发平台类产品. '
									+ ' <br>&nbsp;&nbsp;AppFuse：<a href="http://www.appfuse.org" target="_blank">www.appfuse.org</a>'
									+ ' <br>&nbsp;&nbsp;Primeton EOS：<a href="http://www.primeton.com/products/bap" target="_blank">www.primeton.com</a>'
									+ ' </div>'
						}]
					}]
		}]
	});
});
