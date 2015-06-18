<!-- 由<G4Studio:flashReport/>标签生成的代码开始 -->
<div id="${id}_div" class="${cls}" align="${align}" style="${style}"></div>
<script type="text/javascript">
		var ${id}_chart_object = new FusionCharts("${swfModelPath}", "${id}", "${width}", "${height}");
		${id}_chart_object.setDataXML("${reportXMLData}");
		${id}_chart_object.addParam("wmode","Opaque");
		${id}_chart_object.render("${id}_div");
</script>
<!-- 由<G4Studio:flashReport/>标签生成的代码结束 -->