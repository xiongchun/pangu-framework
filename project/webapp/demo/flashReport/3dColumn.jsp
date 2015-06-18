<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="FCF_3d柱状图" fcfEnabled="true">
<G4Studio:body>
	<G4Studio:flashReport type="3DC" dataVar="xmlString" id="my3DcChart"
		align="center" visible="false" />
</G4Studio:body>
<script language="JavaScript">
Ext.onReady(function() {
	 var panel = new Ext.Panel({
        contentEl:'my3DcChart_div'
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
<script type="text/javascript">
function fnMyJs(pName){
	alert('hi,' + pName + '\n你可以在这个JS函数里做任何你想做的事情 :)');
}
</script>
</G4Studio:html>