<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="动态切换图表类型" fcfEnabled="true">
<G4Studio:body>
	<G4Studio:flashReport type="2DP" dataVar="xmlString" id="my2DpChart" align="center"
		visible="false" />
	<G4Studio:flashReport type="2DC" dataVar="xmlString" id="my2DcChart"
		align="center" visible="false" />
</G4Studio:body>
<script language="JavaScript">
Ext.onReady(function() {
	 var panel_pie = new Ext.Panel({
		 border : false,
         contentEl:'my2DpChart_div'
                    });

	 var panel_column = new Ext.Panel({
		border : false,
        contentEl:'my2DcChart_div'
        });
     
		var window = new Ext.Window({
			tbar:[{
				text : '饼图',
				iconCls : 'pluginIcon',
				handler : function(item) {
				  panel_column.hide();
				  panel_pie.show();
				}
			},'-',{
				text : '柱状图',
				iconCls : 'pluginIcon',
				handler : function(item) {
				  panel_pie.hide();
				  panel_column.show();
				}
			}],
			layout : 'fit',
			width : 570,
			height : 400,
			resizable : false,
			draggable : true,
			closeAction : 'hide',
			title : '<span class="commoncss">Google软件2010年月度销售业绩图表</span>',
			collapsible : false,
			titleCollapse : false,
			//下拉层的动画效果必须关闭,否则将出现Flash图标下拉动画过程异常的现象
			animCollapse : false,
			maximizable : true,
			border : true,
			closable : false,
			animateTarget : Ext.getBody(),
			constrain : true,
			items : [panel_pie,panel_column]
		});

     window.show();

     window.on('show',function(){
         setTimeout(function(){
        	 initPieReport('1');
        	 initColumnReport(1);
             },500)
         });
     
     panel_pie.on('show',function(){
         setTimeout(function(){
        	 initPieReport('1');
             },200)
         });

     panel_column.on('show',function(){
         setTimeout(function(){
        	 initColumnReport(1);
             },200)
         });
    
	function initPieReport(pid) {
			Ext.Ajax.request({
						url : 'flashReportDemo.do?reqCode=queryReportXmlDatas',
						success : function(response, opts) {
							var resultArray = Ext.util.JSON
									.decode(response.responseText);
							// Ext.Msg.alert('提示', resultArray.msg);
							var xmlstring = resultArray.xmlstring;
							updateChartXML('my2DpChart', xmlstring);
						},
						failure : function(response, opts) {
							Ext.MessageBox.alert('提示', '获取报表数据失败');
						},
						params : {
							product : pid
						}
					});
		}

	function initColumnReport(pid) {
		Ext.Ajax.request({
					url : 'flashReportDemo.do?reqCode=queryReportXmlDatas',
					success : function(response, opts) {
						var resultArray = Ext.util.JSON
								.decode(response.responseText);
						// Ext.Msg.alert('提示', resultArray.msg);
						var xmlstring = resultArray.xmlstring;
						updateChartXML('my2DcChart', xmlstring);
					},
					failure : function(response, opts) {
						Ext.MessageBox.alert('提示', '获取报表数据失败');
					},
					params : {
						product : pid
					}
				});
	}
});
</script>
</G4Studio:html>