<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="通知提示框">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:container margin="100" autoShow="true" layout="hbox">
		<aos:button text="滑动通知(标准)" onclick="fnnoti1" margin="10" />
		<aos:button text="滑动通知(标准)" onclick="fnnoti2" margin="10" />
		<aos:button text="滑动通知(标准)" onclick="fnnoti6" margin="10" />
		<aos:button text="滑动通知(美化)" onclick="fnnoti3" margin="10" />
		<aos:button text="滑动通知(美化)" onclick="fnnoti4" margin="10" />
		<aos:button text="系统提示(封装)" onclick="fnnoti5" margin="10" />
	</aos:container>

	<script type="text/javascript">
		function fnnoti1() {
			Ext
					.create(
							'widget.uxNotification',
							{
								position : 'br',
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								closable : false,
								autoCloseDelay : 2000,
								slideInDuration : 200,
								useXAxis : false, //从X坐标滑出
								width : 400,
								html : '马克思主义本身是空想，被野心家歪曲并加以利用了。它的阶级斗争、专政等都有暴力倾向，是反人类文明的。他的公有制或共产主义更是虚构，只能通向奴役之路。垄断一切生产生活资料再剥夺个人私产，公权就可为所欲为，人们无法反抗。前苏联正是典型，集举国之力与文明对抗，他们注定失败。-默克尔'
							}).show();
		}

		function fnnoti6() {
			Ext
					.create(
							'widget.uxNotification',
							{
								position : 'bl',
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								closable : false,
								autoCloseDelay : 2000,
								slideInDuration : 200,
								useXAxis : true, //从X坐标滑出
								width : 400,
								html : '马克思主义本身是空想，被野心家歪曲并加以利用了。它的阶级斗争、专政等都有暴力倾向，是反人类文明的。他的公有制或共产主义更是虚构，只能通向奴役之路。垄断一切生产生活资料再剥夺个人私产，公权就可为所欲为，人们无法反抗。前苏联正是典型，集举国之力与文明对抗，他们注定失败。-默克尔'
							}).show();
		}

		function fnnoti2() {
			Ext
					.create(
							'widget.uxNotification',
							{
								position : 'tl',
								title : '<span class="app-container-title-normal"><i class="fa fa-volume-up"></i> 通知</span>',
								closable : true,
								autoCloseDelay : 1000,
								slideInDuration : 1500,
								slideInAnimation : 'elasticIn',
								html : '爱国主义就是总是支持你的国家，而只在政府值得支持的时候支持政府。'
							}).show();
		}

		function fnnoti3() {
			Ext
					.create(
							'widget.uxNotification',
							{
								position : 't',
								cls : 'ux-notification-light',
								closable : true,
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								slideInDuration : 200,
								slideBackDuration : 1000,
								autoCloseDelay : 2000,
								slideInAnimation : 'ease',
								html : 'AOS应用基础平台'
							}).show();
		}

		function fnnoti4() {
			Ext
					.create(
							'widget.uxNotification',
							{
								position : 'tr',
								cls : 'ux-notification-light',
								closable : true,
								title : '<span class="app-container-title-normal"><i class="fa fa-bell-o"></i> 通知</span>',
								slideInDuration : 200,
								autoCloseDelay : 1000,
								width : 320,
								html : "It's AOS, enjoy it!"
							}).show();
		}

		function fnnoti5() {
			AOS.tip('AOS应用基础平台');
		}
	</script>
</aos:onready>
</aos:html>