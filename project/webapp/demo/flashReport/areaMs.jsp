<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="FCF_面积组合图" fcfEnabled="true">
<G4Studio:body>
	<G4Studio:flashReport type="A_MS" dataVar="xmlString" id="myAreaMsChart" align="center"
		visible="false" />
</G4Studio:body>
<script language="JavaScript">
Ext.onReady(function() {
	 var panel = new Ext.Panel({
        contentEl:'myAreaMsChart_div'
        });
     
		var window = new Ext.Window({
			layout : 'fit',
			width : 570,
			height : 390,
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
});
</script>
</G4Studio:html>