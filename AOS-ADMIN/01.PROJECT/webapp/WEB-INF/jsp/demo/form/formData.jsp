<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="表单数据交互">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel autoShow="true" center="true" width="600">
			<aos:formpanel id="_form1" width="600" layout="column" onrender="_form1_load" labelWidth="60" title="表单1：个人信息"
				bodyBorder="1 0 1 0">
				<aos:docked forceBoder="1 1 0 0">
					<aos:dockeditem icon="add2.png" onclick="_form1_load" text="数据加载(表单1)" />
					<aos:dockeditem icon="ok.png" onclick="_form1_submit" text="数据提交(表单1)" />
				</aos:docked>
				<aos:textfield id="_id_name" fieldLabel="姓名" name="name_" allowBlank="false" columnWidth="0.5" />
				<aos:textfield fieldLabel="卡号" name="cardno_" allowBlank="false" columnWidth="0.49" />
				<aos:textfield fieldLabel="年龄" name="age_" columnWidth="0.5" />
				<aos:combobox name="sex_" fieldLabel="性别" columnWidth="0.49">
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
				</aos:combobox>
			</aos:formpanel>
			<aos:formpanel id="_form2" width="600" layout="column" labelWidth="60" title="表单2：机构信息" bodyBorder="1 0 0 0">
				<aos:docked forceBoder="1 1 0 0">
					<aos:dockeditem icon="add2.png" onclick="_form2_load" text="数据加载(表单2)" />
					<aos:dockeditem icon="ok.png" onclick="_form2_submit" text="数据提交(表单2)" />
				</aos:docked>
				<aos:textfield fieldLabel="名称" name="name_" columnWidth="0.5" />
				<aos:datefield fieldLabel="成立日期" name="birthday_" editable="false" columnWidth="0.49" />
				<aos:textfield fieldLabel="注册地址" name="home_" columnWidth="0.99" />
			</aos:formpanel>
			<aos:docked dock="bottom">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem icon="ok.png" onclick="all_submit" text="数据提交(表单1+表单2)" />
				<aos:dockeditem icon="refresh.png" onclick="_form_reset" text="重置" />
			</aos:docked>
		</aos:panel>

	</aos:viewport>
	<script type="text/javascript">	
		//表单1重置
		function _form1_reset() {
			AOS.reset(_form1);
		}
		
		//数据加载(表单1)
		function _form1_load() {
            AOS.ajax({
                url: 'getForm1Info.jhtml',
                ok: function (data) {
                	_form1.form.setValues(data);
                }
            });
		}
		
		//数据提交(表单1)
		function _form1_submit() {
			AOS.ajax({
				//只提交一个表单
				forms : _form1,
				url : 'submitForm.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg);
				}
			});
		}
		
		//表单2重置
		function _form2_reset() {
			AOS.reset(_form2);
		}
		
		//数据加载(表单2)
		function _form2_load() {
			AOS.ajax({
                url: 'getForm2Info.jhtml',
                ok: function (data) {
                	_form2.form.setValues(data);
                }
            });
		}
		
		//数据提交(表单2)
		function _form2_submit() {
			var params = 
			AOS.ajax({
				//只提交一个表单
				forms : _form2,
				//表单以外的参数也可以这样传
				params:{
					key1 : "mw"
				},
				url : 'submitForm2.jhtml',
				ok : function(data) {
					AOS.tip(data.appmsg + "\n当前经办人：" + data.userName + "。");
				}
			});
		}
		
		//表单重置
		function _form_reset() {
			AOS.reset(_form1);
			AOS.reset(_form2);
		}
		
		//数据提交
		function all_submit() {
			AOS.ajax({
				//wait:false, 也可以禁用自带的等待对话框，自己写AOS.wait()和AOS.hide()来控制
				//params: params, 也可以传参数进去，后台会自动合并
				//wmsg : '也可以自定义等待提示信息',
				//可以同时传多个表单
				forms : [ _form1, _form2 ],
				url : 'submitForm.jhtml',
				ok : function(data) {
					//data参数为服务器返回的json参数，AOS.ajax已经将其转换为Json JS对象传出
					AOS.tip(data.appmsg);
				}
			});
		}
		
	</script>
</aos:onready>
</aos:html>