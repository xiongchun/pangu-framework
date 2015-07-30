<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
    <aos:head title="流程模型设计器">
    	<script type="text/javascript">
			var cxt = '${cxt}';
		</script>
        <aos:include js="${cxt}/static/modeler/libs/prototype-1.5.1.js"/>
        <aos:include js="${cxt}/static/modeler/libs/path_parser.js"/>
        <aos:include js="${cxt}/static/modeler/libs/ext/ext-base.js"/>
        <aos:include js="${cxt}/static/modeler/libs/ext/ext-all.js"/>
        <aos:include js="${cxt}/static/modeler/libs/ext/color-field.js"/>
        <aos:include js="${cxt}/static/modeler/editor/i18n/translation_cn.js"/>
        <aos:include js="${cxt}/static/modeler/editor/i18n/translation_signavio_cn.js"/>
        <aos:include js="${cxt}/static/modeler/libs/utils.js"/>
        <aos:include js="${cxt}/static/modeler/editor/modeler.js"/>
        <aos:include css="${cxt}/static/css/aos-all.css"/>
        <aos:include css="${cxt}/static/modeler/libs/ext/resources/css/ext-all.css"/>
        <aos:include css="${cxt}/static/modeler/libs/ext/resources/css/xtheme-galdaka.css"/>
        <aos:include css="${cxt}/static/modeler/editor/css/theme_norm.css"/>
        <style type="text/css">
            body {
                overflow: hidden;
            }

            .ORYX_Editor {
                background-image: url(${cxt}/static/image/background/main/blue.png) !important;
                background-color: #FFFFFF !important;
                background-attachment: fixed !important;
                background-position: bottom center !important;
                background-repeat: repeat-x !important;
                border-right: 1px solid #99BBE8;
                border-top: 1px solid #99BBE8;
                position: absolute;
                top: 26px;
            }

            .x-layout-split-east {
                border-left: 1px solid #99BBE8;
                border-right: 1px solid #99BBE8;
            }

            .x-tree-node-icon {
                width: 16px !important;
                height: 16px !important;
            }

            .tbar_restyle {
                position: absolute;
                left: 0px;
                top: 2px;
                width: 350px !important;
            }

            .x-panel-header {
                background-color: #DFE8F6 !important;
            }

            #_id_west {
                border-right: 1px solid #99BBE8 !important;
            }

            #_id_tb {
                border-right: 1px solid #99BBE8 !important;
            }

            .oryx_repository_edit_model {
                font-size: 13px;
            }

            input.text, select, textarea {
                border: 1px solid #6699CC;
            }

            input.text:hover, select:hover, textarea:hover, input.text.activated, select.activated, textarea.activated {
                border-color: #6699CC;
            }

            .icon-close {
                background-image: url(${cxt}/static/icon/close.png) !important;
            }

            .icon-ok {
                background-image: url(${cxt}/static/icon/ok.png) !important;
            }
        </style>
        
    </aos:head>
    <aos:body>
    </aos:body>
</aos:html>