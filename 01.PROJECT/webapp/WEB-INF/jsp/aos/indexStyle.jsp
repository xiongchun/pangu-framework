<%@ page contentType="text/html; charset=utf-8"%>
<style type="text/css">
.north_el {
	height: 60px;
	background-image:
		url('${cxt}/static/image/background/index/${north_back_img_}');
}
.main_text {
	color: ${main_text_color_}
}
.nav_text {
	color: ${nav_text_color_}
}
#loading-mask {
	z-index: 20000;
	left: 0px;
	top: 0px;
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: ${opacity};filter:alpha(opacity=${alpha});
	background-color:${south_back_color_};
}
#_div_center {
	width: 100%;
	height: 100%;
}
#_div_center iframe {
	width: 100%;
	height: 100%;
	border: 0;
}
</style>