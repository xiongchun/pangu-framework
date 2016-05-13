<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="表单元素常用API">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel autoShow="true" center="true" width="600">
			<aos:formpanel id="_form1" width="600" layout="column" labelWidth="60" title="表单1：个人信息" bodyBorder="1 0 1 0">
				<aos:docked forceBoder="1 1 0 0">
					<aos:dockeditem icon="bullet_blue.png" onclick="fn1" text="只读" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn2" text="取消只读" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn3" text="禁用" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn4" text="取消禁用" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn6" text="隐藏小红星" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn5" text="显示小红星" />
				</aos:docked>
				<aos:textfield id="_id_name" fieldLabel="姓名"  name="name_" value="凤姐" allowBlank="false" columnWidth="0.5" />
				<aos:textfield fieldLabel="卡号" name="cardno_" value="53001292519821117" allowBlank="false" columnWidth="0.49" />
				<aos:textfield fieldLabel="年龄" name="age_" value="年芳18、貌美如花。" columnWidth="0.5" />
				<aos:combobox name="sex_" fieldLabel="性别" value="2" columnWidth="0.49">
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
				</aos:combobox>
			</aos:formpanel>
			<aos:formpanel id="_form2" width="600" layout="column" labelWidth="60" title="表单2：机构信息" bodyBorder="1 0 1 0">
				<aos:docked forceBoder="1 1 0 0">
					<aos:dockeditem icon="bullet_green.png" onclick="fn7" text="批量只读" />
					<aos:dockeditem icon="bullet_green.png" onclick="fn8" text="批量取消只读" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem icon="bullet_green.png" onclick="fn9" text="批量隐藏" />
					<aos:dockeditem icon="bullet_green.png" onclick="fn10" text="批量显示" />
				</aos:docked>
				<aos:textfield fieldLabel="名称" name="name_" columnWidth="0.5" />
				<aos:datefield fieldLabel="成立日期" name="birthday_" editable="false" columnWidth="0.49" />
				<aos:textfield fieldLabel="注册地址" name="home_" columnWidth="0.99" />
			</aos:formpanel>
			<aos:formpanel id="_form3" width="600" layout="column" labelWidth="110" title="表单3：事件绑定">
				<aos:textfield fieldLabel="绑定获取焦点事件" onfocus="fn_onfocus" emptyText="获取焦点后触发事件" name="event1_" columnWidth="0.99" />
				<aos:textfield fieldLabel="绑定任意事件" emptyText="使用aos:on标签绑定任意事件" name="event0_" columnWidth="0.99">
					<%-- 这种方式可以对其父标签绑定任何Ext支持的事件 --%>
					<aos:on fn="fn_onfocus" event="focus" />
				</aos:textfield>
				<aos:textfield fieldLabel="绑定回车键事件" onenterkey="fn_onenterkey" emptyText="输入后敲回车触发事件" name="event2_"
					columnWidth="0.99" />
				<aos:textfield fieldLabel="绑定值变化事件" onchang="fn_onchange" emptyText="输入内容后触发事件" name="event3_" columnWidth="0.99" />
				<aos:combobox fieldLabel="绑定下拉选择事件" onselect="fn_onselect" emptyText="选择下拉项后触发事件" name="event4_" columnWidth="0.99">
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
				</aos:combobox>
			</aos:formpanel>
		</aos:panel>

	</aos:viewport>
	<script type="text/javascript">
		//只读
		function fn1() {
			AOS.read(_id_name);
			AOS.reads(_form1, 'cardno_');
		}

		//取消只读
		function fn2() {
			AOS.edit(_id_name);
			AOS.edits(_form1, 'cardno_');
		}

		//禁用
		function fn3() {
			AOS.disable(_id_name);
			AOS.disables(_form1, 'cardno_,age_,sex_');
		}

		//取消禁用
		function fn4() {
			AOS.enable(_id_name);
			AOS.enables(_form1, 'cardno_,age_,sex_');
		}

		//显示小红星
		function fn5() {
			AOS.star(_id_name);
		}

		//隐藏小红星
		function fn6() {
			AOS.unstar(_id_name);
		}

		//批量只读
		function fn7() {
			AOS.reads(_form2, 'name_,birthday_,home_');
		}

		//批量取消只读
		function fn8() {
			AOS.edits(_form2, 'name_,birthday_,home_');
		}

		//批量隐藏
		function fn9() {
			AOS.hides(_form2, 'name_,birthday_');
		}

		//批量显示
		function fn10() {
			AOS.shows(_form2, 'name_,birthday_');
		}

		//绑定change事件
		function fn_onchange(obj) {
			AOS.tip(obj.getValue());
		}

		//绑定回车键事件
		function fn_onenterkey(obj) {
			AOS.tip(obj.getValue());
		}

		//绑定focus事件
		function fn_onfocus(obj) {
			AOS.tip(obj.fieldLabel);
		}

		//绑定选择事件
		function fn_onselect(obj) {
			AOS.tip(obj.getValue());
		}
	</script>
</aos:onready>
</aos:html>