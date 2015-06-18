<!-- Datatimefield扩展组件所需的资源 -->
#if(${uxType} == "datatimefield")
<link rel="stylesheet" type="text/css" href="${contextPath}/resource/myux/datatimefield/css/Spinner.css"/>
<script type="text/javascript" src="${contextPath}/resource/myux/datatimefield/Spinner.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/datatimefield/SpinnerField.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/datatimefield/DateTimeField.js"></script>
#end 

<!-- GridSummary扩展组件所需的资源 -->
#if(${uxType} == "gridsummary")
<link rel="stylesheet" type="text/css" href="${contextPath}/resource/myux/gridsummary/css/Ext.ux.grid.GridSummary.css"/>
<script type="text/javascript" src="${contextPath}/resource/myux/gridsummary/Ext.ux.grid.GridSummary.js"></script>
#end

<!-- SWFUpload扩展组件所需的资源 -->
#if(${uxType} == "swfupload")
<link rel="stylesheet" type="text/css" href="${contextPath}/resource/myux/uploadpanel/css/uploadPanel.css"/>
<script type="text/javascript" src="${contextPath}/resource/myux/uploadpanel/js/swfupload.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/uploadpanel/js/uploadPanel.js"></script>
#end

<!-- htmleditor扩展组件所需的资源 -->
#if(${uxType} == "htmleditor")
<link rel="stylesheet" type="text/css" href="${contextPath}/resource/myux/htmleditor/resources/css/htmleditorplugins.css"/>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.MidasCommand.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Divider.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.HR.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.RemoveFormat.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.IndentOutdent.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.SubSuperScript.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.FindAndReplace.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Table.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Word.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Link.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.SpecialCharacters.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Heading.js"></script>
<script type="text/javascript" src="${contextPath}/resource/myux/htmleditor/js/Ext.ux.form.HtmlEditor.Plugins.js"></script>
#end

<!-- 表头分组资源 -->
#if(${uxType} == "headgroup")
<script type="text/javascript" src="${contextPath}/resource/myux/headgroup/GroupHeaderPlugin.js"></script>
<style type="text/css">
.x-grid3 table {
	table-layout: auto;
}
.x-grid3-hd-inner {
   white-space: pre-line;
}
.x-grid3-cell-inner{
   white-space: pre-line;
}
</style>
#end

<!-- 提示窗 -->
#if(${uxType} == "tipwindow")
<script type="text/javascript" src="${contextPath}/resource/myux/tipwindow/tipWindow.js"></script>
#end

<!-- 年月输入组件 -->
#if(${uxType} == "monthpicker")
<script type="text/javascript" src="${contextPath}/resource/myux/monthpicker/MonthPickerPlugin.js"></script>
#end
