/**
 * 获取服务器信息及内存CPU实时监控
 * 
 * @author XiongChun
 * @since 2010-11-27
 */
Ext.onReady(function() {

			var serverInfoGrid = new Ext.grid.PropertyGrid({
						title : '<span class="commoncss">服务器信息</span>',
						iconCls: 'server_connectIcon',
						width : 320,
						collapsible : true,
						split : true,
						region : 'west',
						margins : '3 3 3 3',
						source : jsonInfo
					});

			serverInfoGrid.on("beforeedit", function(e) {
						// e.cancel = true;
						// return false;
					});

			var jvmMemPanel = new Ext.Panel({
						title : '<span class="commoncss">JVM内存监控视图</span>',
						contentEl : 'jvmMemChart_div',
						region : 'center',
						bodyStyle:'5,5,5,5',
						margins : '3 3 3 3',
						autoScroll:true
					});

			var viewport = new Ext.Viewport({
						layout : 'border',
						items : [serverInfoGrid, jvmMemPanel]
					});

			var jvmtask = {
				run : function() {
					updateJVMChart();
				},
				interval : 3000
			};

			var taskRunner = new Ext.util.TaskRunner();
			taskRunner.start(jvmtask);

			function updateJVMChart() {
				Ext.Ajax.request({
							url : 'serverInfo.do?reqCode=updateJvmChart',
							success : function(response, opts) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								var xmlstring = resultArray.xmlstring;
								updateChartXML('jvmMemChart', xmlstring);
							},
							failure : function(response, opts) {
								Ext.MessageBox.alert('提示', '获取监控数据失败');
							},
							params : {}
						});
			}

		});