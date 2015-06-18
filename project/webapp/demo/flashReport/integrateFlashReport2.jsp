<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="动态切换图表数据源" fcfEnabled="true">
<G4Studio:body>
	<G4Studio:flashReport type="2DC" dataVar="xmlString" id="my2DcChart"
		align="center" visible="false" />
</G4Studio:body>
<script language="JavaScript">
Ext.onReady(function() {
	 var panel = new Ext.Panel({
		tbar:[{
				text : '产品一',
				iconCls : 'pluginIcon',
				handler : function(item) {
				  updateChart('1');
				}
			},'-',{
				text : '产品二',
				iconCls : 'pluginIcon',
				handler : function(item) {
				  updateChart('2');
				}
			}],
        contentEl:'my2DcChart_div'
        });
     
		var window = new Ext.Window({
			layout : 'fit',
			width : 570,
			height : 400,
			resizable : false,
			draggable : true,
			closeAction : 'hide',
			title : '<span class="commoncss">Google软件2010年月度销售业绩图表</span>',
			collapsible : true,
			titleCollapse : false,
			//下拉层的动画效果必须关闭,否则将出现Flash图标下拉动画过场异常的现象
			animCollapse : false,
			maximizable : true,
			border : false,
			closable : false,
			animateTarget : Ext.getBody(),
			constrain : true,
			items : [panel]
		});

     window.show();

     window.on('show',function(){
         setTimeout(function(){
        	 updateChart('2');
             },500)
         });

	function updateChart(pid) {
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