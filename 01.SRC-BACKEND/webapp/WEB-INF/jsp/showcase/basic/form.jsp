<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="表单组件" base="http" lib="ext">
<aos:body>
	<div id="div_vercode" class="x-hidden" align="center">
		<aos:vercode id="id_vercode" uuid="${vercode_uuid}" fontSize="28" length="5" width="120" />
	</div>
	<div id="div_photo" class="x-hidden" align="center">
		<img id="img_photo" class="app_cursor_pointer" src="${cxt}/static/image/empty_head_photo.png" width="200" height="200">
	</div>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="id_tabs" region="center" tabPosition="bottom" bodyBorder="0 0 0 0" margin="0 0 2 0">

			<aos:tab title="基本表单元素">
				<aos:formpanel id="f_info" autoShow="true" width="650" layout="column" labelWidth="70" msgTarget="qtip">
					<%-- 隐藏变量 --%>
					<aos:hiddenfield name="id" value="001" />
					<aos:fieldset title="文本输入" labelWidth="70" columnWidth="1" border="true">
						<aos:textfield name="card_id" fieldLabel="卡号" maxLength="10" allowBlank="false" columnWidth="0.25" />
						<aos:textfield name="name" fieldLabel="姓名" maxLength="20" columnWidth="0.25" />
						<aos:textfield name="card_id" fieldLabel="验证码" maxLength="10" allowBlank="false" columnWidth="0.25" />
						<aos:panel contentEl="div_vercode" columnWidth="0.1" border="false" />
						<aos:textareafield name="desc" fieldLabel="摘要信息" grow="true" height="40" emptyText="文本块输入" columnWidth="0.99" />
					</aos:fieldset>

					<aos:fieldset title="数字输入" labelWidth="70" columnWidth="1" border="true">
						<aos:numberfield name="credit_line" fieldLabel="信用额度" minValue="0" maxValue="100000" value="100000" allowBlank="false" columnWidth="0.5" />
						<aos:numberfield name="balance" fieldLabel="可用余额" minValue="0" maxValue="100000" value="50000" columnWidth="0.49" />
					</aos:fieldset>

					<aos:fieldset title="日期时间输入" labelWidth="70" columnWidth="1" border="true">
						<aos:datefield name="birthday" fieldLabel="出生日期" format="Y年m月d日" value="2015-03-10" editable="true" columnWidth="0.33" />
						<aos:datefield name="start_time" fieldLabel="起始日期" value="2015-03-10" format="Y-m-d 00:00:00" editable="false" columnWidth="0.33" />
						<aos:datefield name="end_time" fieldLabel="截止日期" format="Y-m-d 23:59:59" editable="false" maxValue="${maxValue}" disabledDaysText="测试" minValue="${minValue}"
							columnWidth="0.33" />
						<aos:datefield name="disable_date" fieldLabel="审批日期" disabledDays="0,6" disabledDaysText="不能选择周末做为审批日期" editable="false" columnWidth="0.33" />
						<aos:timefield name="reg_time" fieldLabel="签到时间" editable="false" value="09点00分" increment="15" maxValue="18点00分" columnWidth="0.33" />
						<aos:datetimefield name="datetime" fieldLabel="经办时间" editable="false" columnWidth="0.33" />
					</aos:fieldset>

					<aos:fieldset title="单选、复选输入" labelWidth="70" columnWidth="1" border="true">
						<aos:checkboxgroup fieldLabel="性格特点" columns="[120,80,100,120]" columnWidth="0.5">
							<aos:checkbox name="c1" boxLabel="活波开朗" inputValue="1" />
							<aos:checkbox name="c1" boxLabel="闷骚" checked="true" inputValue="2" />
							<aos:checkbox name="c1" boxLabel="抑郁寡欢" inputValue="3" />
							<aos:checkbox name="c1" boxLabel="傻逼250一个" checked="true" inputValue="4" />
						</aos:checkboxgroup>
						<aos:radioboxgroup fieldLabel="婚姻状态" columns="[120,80,100,100,100]" columnWidth="0.5">
							<aos:radiobox name="r1" boxLabel="单身狗" inputValue="1" />
							<aos:radiobox name="r1" boxLabel="已离" inputValue="2" />
							<aos:radiobox name="r1" boxLabel="脑残" checked="true" inputValue="3" />
							<aos:radiobox name="r1" boxLabel="热恋中" inputValue="4" />
							<aos:radiobox name="r1" boxLabel="基情中" inputValue="5" />
						</aos:radioboxgroup>
					</aos:fieldset>

					<aos:fieldset title="常规下拉选择框" labelWidth="100" columnWidth="1" border="true">
						<aos:combobox fieldLabel="客户端数据源" name="bank" value="1" columnWidth="0.33">
							<aos:option value="1" display="中国嘉靖银行" />
							<aos:option value="2" display="中国招商银行" />
							<aos:option value="3" display="中国农业银行" />
							<aos:option value="4" display="中国建设银行" />
							<aos:option value="5" display="中国工商银行" />
						</aos:combobox>
						<aos:combobox fieldLabel="字典数据源" name="card_type" dicField="card_type" columnWidth="0.33" />
						<aos:combobox fieldLabel="自定义数据源" name="name2" editable="false" columnWidth="0.33" url="demoService.listComboBoxData" />
						<aos:combobox fieldLabel="可输入" name="card_type_2" dicField="card_type" editable="true" columnWidth="0.33" />
						<aos:combobox fieldLabel="下拉项多选" multiSelect="true" name="name3" columnWidth="0.66" url="demoService.listComboBoxData" />
					</aos:fieldset>

					<aos:fieldset title="多级联动下拉选择框" labelWidth="70" columnWidth="1" border="true">
						<aos:combobox onselect="module1Onselect" fieldLabel="一级模块" name="module1" emptyText="请选择一级模块" columnWidth="0.5" url="demoService.listComboBoxCascadeData&length=9" />
						<aos:combobox id="id_module2" fieldLabel="二级模块" queryMode="local" name="module2" readOnly="true" emptyText="请选择二级模块" columnWidth="0.49"
							url="demoService.listComboBoxCascadeSubData" />
					</aos:fieldset>

					<aos:fieldset title="弹出窗口选择框" labelWidth="100" columnWidth="1" border="true">
						<%-- 隐藏域用来存储弹出树选中节点ID --%>
						<aos:hiddenfield name="parent_id" />
						<aos:triggerfield fieldLabel="弹出选择树" name="parent_id_desc" editable="false" trigger1Cls="x-form-search-trigger" onTrigger1Click="w_org_find_show" columnWidth="0.25" />
						<%-- 隐藏域用来存储弹出表格选中的ID --%>
						<aos:hiddenfield name="card_id2" />
						<aos:triggerfield fieldLabel="弹出选择表格" name="name_desc" editable="false" trigger1Cls="x-form-search-trigger" onTrigger1Click="w_account_find_show" columnWidth="0.25" />
					</aos:fieldset>

					<aos:fieldset title="简单富文本编辑器" labelWidth="70" columnWidth="1" border="true">
						<aos:htmleditor margin="5" columnWidth="1" />
					</aos:fieldset>

				</aos:formpanel>
			</aos:tab>

			<aos:tab title="常用表单API" layout="anchor" autoScroll="true">
				<aos:formpanel id="form1" layout="column" labelWidth="60" title="表单1：个人信息" border="true" anchor="100%" margin="5">
					<aos:docked>
						<aos:dockeditem icon="bullet_blue.png" onclick="fn1" text="只读" />
						<aos:dockeditem icon="bullet_blue.png" onclick="fn2" text="取消只读" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem icon="bullet_blue.png" onclick="fn3" text="禁用" />
						<aos:dockeditem icon="bullet_blue.png" onclick="fn4" text="取消禁用" />
					</aos:docked>
					<aos:textfield fieldLabel="姓名" name="name" value="凤姐" allowBlank="false" columnWidth="0.5" />
					<aos:textfield fieldLabel="卡号" name="cardno" value="53001292519821117" allowBlank="false" columnWidth="0.49" />
					<aos:textfield fieldLabel="年龄" name="age" value="年芳18、貌美如花。" columnWidth="0.5" />
					<aos:combobox name="sex" fieldLabel="性别" value="2" columnWidth="0.49">
						<aos:option value="1" display="男" />
						<aos:option value="2" display="女" />
					</aos:combobox>
				</aos:formpanel>

				<aos:formpanel id="form2" layout="column" labelWidth="60" title="表单2：机构信息" border="true" anchor="100%" margin="5">
					<aos:docked>
						<aos:dockeditem icon="bullet_green.png" onclick="fn7" text="批量只读" />
						<aos:dockeditem icon="bullet_green.png" onclick="fn8" text="批量取消只读" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem icon="bullet_green.png" onclick="fn9" text="批量隐藏" />
						<aos:dockeditem icon="bullet_green.png" onclick="fn10" text="批量显示" />
					</aos:docked>
					<aos:textfield fieldLabel="名称" name="name" columnWidth="0.5" />
					<aos:datefield fieldLabel="成立日期" name="birthday" editable="false" columnWidth="0.49" />
					<aos:textfield fieldLabel="注册地址" name="home" columnWidth="0.99" />
				</aos:formpanel>

				<aos:formpanel id="form3" layout="column" labelWidth="110" title="表单3：事件绑定" border="true" anchor="100%" margin="5">
					<aos:textfield fieldLabel="绑定获取焦点事件" onfocus="fn_onfocus" emptyText="获取焦点后触发事件" name="event1" columnWidth="0.25" />
					<aos:textfield fieldLabel="绑定任意事件" emptyText="使用aos:on标签绑定任意事件" name="event0" columnWidth="0.25">
						<%-- 这种方式可以对其父标签绑定任何Ext支持的事件 --%>
						<aos:on fn="fn_onfocus" event="focus" />
					</aos:textfield>
					<aos:textfield fieldLabel="绑定回车键事件" onenterkey="fn_onenterkey" emptyText="输入后敲回车触发事件" name="event2" columnWidth="0.25" />
					<aos:textfield fieldLabel="绑定值变化事件" onchange="fn_onchange" emptyText="输入内容后触发事件" name="event3" columnWidth="0.25" />
					<aos:textfield fieldLabel="绑定KeyDown事件" onkeydown="fn_onkeydown" emptyText="KeyDown事件" name="event5" columnWidth="0.25" />
					<aos:textfield fieldLabel="绑定KeyUP事件" onkeyup="fn_onkeyup" emptyText="KeyUP事件" name="event6" columnWidth="0.25" />
					<aos:combobox fieldLabel="绑定下拉选择事件" onselect="fn_onselect" dicField="card_type" emptyText="选择下拉项后触发事件" name="event4" columnWidth="0.25" />
					<aos:radioboxgroup fieldLabel="单选框选择事件" columns="[120,80,100,100,100]" columnWidth="0.5" onchange="radioGroupChange">
						<aos:radiobox name="marriage_status" boxLabel="单身狗" inputValue="1" />
						<aos:radiobox name="marriage_status" boxLabel="已离" inputValue="2" />
						<aos:radiobox name="marriage_status" boxLabel="脑残" checked="true" inputValue="3" />
						<aos:radiobox name="marriage_status" boxLabel="热恋中" inputValue="4" />
						<aos:radiobox name="marriage_status" boxLabel="基情中" inputValue="5" />
					</aos:radioboxgroup>
					<aos:checkboxgroup fieldLabel="复选框选择事件" columns="[120,80,120,120]" columnWidth="0.5" onchange="checkGroupChange">
						<aos:checkbox name="feature" boxLabel="活波开朗" inputValue="1" />
						<aos:checkbox name="feature" boxLabel="闷骚" inputValue="2" />
						<aos:checkbox name="feature" boxLabel="傻*250一个" inputValue="3" />
						<aos:checkbox name="feature" boxLabel="负无穷" inputValue="4" />
					</aos:checkboxgroup>
				</aos:formpanel>

				<aos:formpanel id="form4" layout="column" labelWidth="80" title="表单4：表单校验" border="true" anchor="100%" margin="5">
					<aos:docked>
						<aos:dockeditem icon="bullet_blue.png" onclick="fn6" text="姓名可以为空" />
						<aos:dockeditem icon="bullet_blue.png" onclick="fn5" text="姓名非空" />
					</aos:docked>
					<aos:textfield fieldLabel="身份证1" name="cardno" allowBlank="false" emptyText="只能输入合法的身份证号" onblur="fn_id" columnWidth="0.5" />
					<aos:textfield fieldLabel="身份证2" name="cardno2" allowBlank="false" emptyText="只能输入合法的身份证号" onblur="AOS.idcheck" columnWidth="0.49" />
					<aos:textfield id="id_name2" fieldLabel="姓名" name="name" allowBlank="false" columnWidth="0.5" />
					<aos:numberfield fieldLabel="年龄" name="age" maxValue="100" minValue="1" emptyText="只能输入1-100的数字" columnWidth="0.49" />
					<aos:combobox name="card_type" dicField="card_type" fieldLabel="卡类型" columnWidth="0.5" />
					<aos:textfield fieldLabel="电子邮件" name="emai" vtype="email" allowBlank="false" emptyText="只能输入合法的电子邮件" columnWidth="0.49" />
					<aos:textfield fieldLabel="只输入字母" name="alpha" vtype="alpha" emptyText="只能输入字母" columnWidth="0.5" />
					<aos:textfield fieldLabel="字母+数字" name="number" vtype="alphanum" emptyText="只能输入英文字母和数字" columnWidth="0.49" />
					<aos:textfield fieldLabel="URL校验" name="url" vtype="url" emptyText="只能输入URL地址" vtypeText="URL格式不合法。自定义校验不通过时的提示信息。" columnWidth="0.5" />
					<aos:textfield fieldLabel="正则表达式" name="reg" regex="/[\u4e00-\u9fa5]/" emptyText="只能输入中文字符" regexText="只能输入中文字符。正则表达式验证不通过的提示信息。" columnWidth="0.49" />
					<aos:docked dock="bottom" ui="footer" padding="0 0 5 0">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem xtype="button" text="校验" onclick="fn_validate" icon="ok.png" />
						<aos:dockeditem xtype="button" text="重置" onclick="#form4.form.reset()" icon="refresh.png" />
						<aos:dockeditem xtype="tbfill" />
					</aos:docked>
				</aos:formpanel>
			</aos:tab>

			<aos:tab title="表单数据交互" layout="anchor" autoScroll="true">
				<aos:formpanel id="idform_data1" layout="column" labelWidth="70" title="表单1：前端数据交互" anchor="100%" border="true" margin="5">
					<aos:docked>
						<aos:dockeditem icon="bullet_green.png" onclick="setValue" text="赋值" />
						<aos:dockeditem icon="bullet_green.png" onclick="getValue" text="取值" />
						<aos:dockeditem icon="bullet_green.png" onclick="setValues" text="批量赋值" />
						<aos:dockeditem icon="bullet_green.png" onclick="getValues" text="批量取值" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem xtype="button" text="重置" onclick="#AOS.reset(idform_data1)" icon="refresh.png" />
					</aos:docked>
					<aos:textfield fieldLabel="姓名" name="name" allowBlank="false" columnWidth="0.25" />
					<aos:textfield fieldLabel="年龄" name="age" columnWidth="0.25" />
					<aos:combobox name="sex" fieldLabel="性别" dicField="sex" columnWidth="0.25" />
					<aos:datefield name="birthday" fieldLabel="出生日期" columnWidth="0.25" />
					<aos:checkboxgroup fieldLabel="性格特点" columns="[120,80,120,120]" columnWidth="0.5">
						<aos:checkbox name="c1" boxLabel="活波开朗" inputValue="1" />
						<aos:checkbox name="c1" boxLabel="闷骚" inputValue="2" />
						<aos:checkbox name="c1" boxLabel="傻*250一个" inputValue="3" />
						<aos:checkbox name="c1" boxLabel="负无穷" inputValue="4" />
					</aos:checkboxgroup>
					<aos:radioboxgroup fieldLabel="婚姻状态" columns="[100,80,100,100]" columnWidth="0.5">
						<aos:radiobox name="r1" boxLabel="单身狗" inputValue="1" />
						<aos:radiobox name="r1" boxLabel="离婚" inputValue="2" />
						<aos:radiobox name="r1" boxLabel="脑残" inputValue="3" />
						<aos:radiobox name="r1" boxLabel="基情中" inputValue="4" />
					</aos:radioboxgroup>
					<aos:textfield fieldLabel="家庭住址" name="home" columnWidth="0.75" />
					<aos:datetimefield name="operateTime" editable="false" fieldLabel="经办时间" columnWidth="0.25" />
				</aos:formpanel>

				<aos:formpanel id="idform_data2" layout="column" labelWidth="70" title="表单2：后端数据交互" anchor="100%" border="true" margin="5" collapsible="true">
					<aos:docked>
						<aos:dockeditem icon="bullet_green.png" onclick="loadData" text="数据加载" />
						<aos:dockeditem icon="bullet_green.png" onclick="submitSync" text="数据提交(异步Ajax1)" />
						<aos:dockeditem icon="bullet_green.png" onclick="submitSync2" text="数据提交(异步Ajax2)" />
						<aos:dockeditem xtype="tbseparator" />
						<aos:dockeditem xtype="button" text="重置" onclick="#AOS.reset(idform_data2)" icon="refresh.png" />
					</aos:docked>
					<aos:textfield fieldLabel="姓名" name="name" allowBlank="false" columnWidth="0.25" />
					<aos:textfield fieldLabel="年龄" name="age" columnWidth="0.25" />
					<aos:combobox name="sex" fieldLabel="性别" dicField="sex" columnWidth="0.25" />
					<aos:datefield name="birthday" fieldLabel="出生日期" format="Y-m-d" columnWidth="0.25" />
					<aos:checkboxgroup fieldLabel="性格特点" columns="[120,80,120,120]" columnWidth="0.5">
						<aos:checkbox name="c1" boxLabel="活波开朗" inputValue="1" />
						<aos:checkbox name="c1" boxLabel="闷骚" inputValue="2" />
						<aos:checkbox name="c1" boxLabel="傻*250一个" inputValue="3" />
						<aos:checkbox name="c1" boxLabel="负无穷" inputValue="4" />
					</aos:checkboxgroup>
					<aos:radioboxgroup fieldLabel="婚姻状态" columns="[100,80,100,100]" columnWidth="0.5">
						<aos:radiobox name="r1" boxLabel="单身狗" inputValue="1" />
						<aos:radiobox name="r1" boxLabel="离婚" inputValue="2" />
						<aos:radiobox name="r1" boxLabel="脑残" inputValue="3" />
						<aos:radiobox name="r1" boxLabel="基情中" inputValue="4" />
					</aos:radioboxgroup>
					<aos:textfield fieldLabel="家庭住址" name="home" columnWidth="0.75" />
					<aos:datetimefield name="operateTime" editable="false" fieldLabel="经办时间" columnWidth="0.25" />
				</aos:formpanel>

				<aos:formpanel id="idform_data3" layout="column" labelWidth="70" title="表单2：后端数据交互(表单同步提交)" standardSubmit="true" anchor="100%" border="true" margin="5">
					<aos:docked>
						<aos:dockeditem icon="bullet_green.png" onclick="submitAsync" text="数据提交(同步提交)" />
					</aos:docked>
					<aos:textfield fieldLabel="姓名" name="name" allowBlank="false" value="凤姐" columnWidth="0.25" />
					<aos:textfield fieldLabel="年龄" name="age" value="18" columnWidth="0.25" />
					<aos:combobox name="sex" fieldLabel="性别" value="2" dicField="sex" columnWidth="0.25" />
					<aos:datefield name="birthday" fieldLabel="出生日期" value="1982-11-17" format="Y-m-d" columnWidth="0.25" />
				</aos:formpanel>

			</aos:tab>

			<aos:tab title="常用表单布局" layout="anchor" autoScroll="true">
				<aos:formpanel title="常用布局1" layout="column" labelWidth="70" margin="5" anchor="100%" border="true">
					<aos:docked>
						<aos:dockeditem text="新增" icon="add.png" />
						<aos:dockeditem text="修改" icon="edit.png" />
						<aos:dockeditem text="删除" icon="del.png" />
					</aos:docked>
					<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.25" allowBlank="false" />
					<aos:numberfield fieldLabel="年龄" name="age" minWidth="1" maxValue="120" columnWidth="0.25" />
					<aos:textfield fieldLabel="身份证号" name="id_no" columnWidth="0.25" />
					<aos:textfield fieldLabel="所属银行" name="org_id" columnWidth="0.25" />
					<aos:numberfield fieldLabel="可用余额" name="balance" columnWidth="0.5" />
					<aos:numberfield fieldLabel="信用额度" name="credit_line" columnWidth="0.5" value="100000" readOnly="true" />
					<aos:textareafield fieldLabel="兴趣爱好" name="interests" columnWidth="1" />
					<aos:docked dock="bottom">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem text="保存数据" icon="ok.png" />
						<aos:dockeditem text="刷新" icon="refresh.png" />
						<aos:dockeditem xtype="tbfill" />
					</aos:docked>
				</aos:formpanel>

				<aos:formpanel title="常用布局2" layout="column" labelWidth="70" margin="5" anchor="100%" border="true">
					<aos:fieldset title="请查询" checkboxToggle="true" columnWidth="1">
						<aos:textfield fieldLabel="卡号" name="card" allowBlank="false" columnWidth="0.25" />
						<aos:button text="查询" margin="0 0 0 10" icon="query.png" />
					</aos:fieldset>
					<aos:fieldset title="发卡行信息(强制换行)" columnWidth="1">
						<aos:rowset>
							<aos:numberfield fieldLabel="上班时间" name="satrt1" value="8" columnWidth="0.2" />
							<aos:displayfield value="点" padding="0 0 0 5" columnWidth="0.02" />
							<aos:numberfield name="name1" value="30" columnWidth="0.1" />
							<aos:displayfield value="分 " padding="0 0 0 5" columnWidth="0.3" />
						</aos:rowset>
						<aos:rowset>
							<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.25" allowBlank="false" />
							<aos:numberfield fieldLabel="年龄" name="age" minWidth="1" maxValue="120" columnWidth="0.25" />
							<aos:textfield fieldLabel="身份证号" name="id_no" columnWidth="0.25" />
						</aos:rowset>
						<aos:textfield fieldLabel="邮编" name="bankName" columnWidth="0.5" />
						<aos:textfield fieldLabel="地址" name="bankName" columnWidth="0.49" />
						<aos:textfield fieldLabel="支行名称" name="bankName" columnWidth="0.99" />
					</aos:fieldset>
				</aos:formpanel>

				<aos:formpanel title="常用布局3" layout="column" labelWidth="70" margin="5" anchor="100%" border="true">
					<aos:fieldset title="请查询" columnWidth="1" labelWidth="70">
						<aos:textfield fieldLabel="卡号" allowBlank="false" name="card" columnWidth="0.25" />
						<aos:button text="查询" margin="0 0 0 10" icon="query.png" />
					</aos:fieldset>
					<aos:fieldset title="基本信息" labelWidth="70" columnWidth="0.65" margin="0 10 0 0" height="200">
						<aos:textfield name="name" fieldLabel="姓名" maxLength="50" columnWidth="0.99" />
						<aos:combobox name="sex" fieldLabel="性别" dicField="sex" emptyText="请选择..." columnWidth="0.99" />
						<aos:textfield name="account" fieldLabel="登录帐号" readOnly="true" maxLength="50" columnWidth="0.99" />
						<aos:textfield name="biz_code" fieldLabel="业务对照码" readOnly="true" maxLength="50" columnWidth="0.99" />
						<aos:combobox name="type" fieldLabel="用户类型" readOnly="true" dicField="user_type" columnWidth="0.99" />
						<aos:combobox name="status" fieldLabel="用户状态" readOnly="true" dicField="user_status" columnWidth="0.99" />
						<aos:textfield name="org_name" fieldLabel="所属组织" readOnly="true" columnWidth="0.99" />
					</aos:fieldset>
					<aos:fieldset title="用户头像" labelWidth="70" columnWidth="0.35" contentEl="div_photo" height="200" />
					<aos:fieldset title="辅助信息" labelWidth="70" columnWidth="1" border="true">
						<aos:textfield name="idno" fieldLabel="身份证号" maxLength="50" columnWidth="0.25" />
						<aos:datefield name="birthday" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.25" />
						<aos:textfield name="fixed_phone" fieldLabel="固定电话" maxLength="50" columnWidth="0.25" />
						<aos:textfield name="mobile_phone" fieldLabel="移动电话" maxLength="50" columnWidth="0.24" />
						<aos:textfield name="email" fieldLabel="电子邮件" vtype="email" columnWidth="0.25" />
						<aos:textfield name="qq" fieldLabel="QQ" maxLength="50" columnWidth="0.25" />
						<aos:textfield name="zip" fieldLabel="邮编" maxLength="20" columnWidth="0.25" />
						<aos:textfield name="address" fieldLabel="联系地址" maxLength="200" columnWidth="0.24" />
						<aos:textareafield name="remark" fieldLabel="备注" maxLength="4000" columnWidth="0.99" />
					</aos:fieldset>
					<aos:fieldset title="扩展信息" labelWidth="70" border="true">
						<aos:textfield name="filed1" fieldLabel="扩展属性1" readOnly="true" maxLength="200" columnWidth="0.5" />
						<aos:textfield name="filed2" fieldLabel="扩展属性2" readOnly="true" maxLength="200" columnWidth="0.49" />
						<aos:textfield name="dynamic_field" fieldLabel="动态属性" readOnly="true" maxLength="4000" columnWidth="0.99" />
					</aos:fieldset>
				</aos:formpanel>

			</aos:tab>

		</aos:tabpanel>

		<aos:window id="w_org_find" title="上级模块[双击选择]" height="-60" layout="fit" autoScroll="true" onshow="t_org_find_refresh">
			<aos:treepanel id="t_org_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="demoService.getTreeData" rootVisible="false" onitemdblclick="t_org_find_select" />
		</aos:window>

		<aos:window id="w_account_find" title="信用卡号[双击选择]" height="-200" width="800" layout="fit" onshow="g_account_query">
			<aos:gridpanel id="g_account" url="demoService.listAccounts" onrender="g_account_query" onitemdblclick="g_account_dbclick">
				<aos:docked forceBoder="0 0 1 0">
					<aos:triggerfield emptyText="姓名" id="id_name" onenterkey="g_account_query" trigger1Cls="x-form-search-trigger" onTrigger1Click="g_account_query" width="250" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="信用卡号" dataIndex="card_id" width="90" />
				<aos:column header="卡类型" dataIndex="card_type" rendererField="card_type" width="60" />
				<aos:column header="持卡人" dataIndex="name" width="80" />
				<aos:column header="身份证号" dataIndex="id_no" width="140" />
				<aos:column header="信用额度" dataIndex="credit_line" type="number" />
				<aos:column header="可用余额" dataIndex="balance" type="number" />
			</aos:gridpanel>
		</aos:window>

	</aos:viewport>

	<script type="text/javascript">
	
	  //单选框分组事件
	  function radioGroupChange(me,newValue){
		  //元素值为单选框的inputValue值
		 AOS.tip('单选框组选择事件监听：' + newValue.marriage_status);
	  }
	  
	 //复选框分组事件
	 function checkGroupChange(me,newValue){
		  //元素值为单选框的inputValue值
		 AOS.tip('复选框组选择事件监听：' + newValue.feature);
	  }
	
		//数据加载
		function loadData() {
	        AOS.ajax({
	            url: 'demoService.loadFormInfo',
	            ok: function (data) {
	            	AOS.setValues(idform_data2,data);
	            }
	        });
		}
		
		//表单数据提交(异步Aiax)
		function submitSync() {
			AOS.ajax({
				//只提交一个表单  这种会自动对表单进行验证
				forms : idform_data2,
				//一起提交多个表单值
				//forms : [ form1, form2 ],
				//表单以外的参数也可以这样追加上去
				params:{
					key1 : "mowen"
				},
				url : 'demoService.submitSync',
				ok : function(data) {
					//data参数为服务器返回的json参数，AOS.ajax已经将其转换为Json JS对象传出。使用data.xxx就能取值
					AOS.tip(data.appmsg);
				}
			});
		}
		
		//表单数据提交(异步Aiax)   另外一种灵活的写法，应对一些特殊需求
		function submitSync2() {
			//获取表单值
			//var myParams = idform_data2.getValues();
			// 这种方式不会对表单进行验证，可以自己验证
			if(!idform_data2.isValid()) return;
			var myParams = {};
			//这样可以增加参数
			myParams.name = 'mowen';
			myParams.sex = '2';
			AOS.ajax({
				params: myParams,
				url : 'demoService.submitSync',
				ok : function(data) {
					//data参数为服务器返回的json参数，AOS.ajax已经将其转换为Json JS对象传出。使用data.xxx就能取值
					AOS.tip(data.appmsg);
				}
			});
		}
		
		//数据提交(同步提交)
		function submitAsync() {
			if(!idform_data3.isValid()) return;
			idform_data3.getForm().submit({
				//非Ajax提交，juid参数不会自动去组装，需要在这里手工的拼接。
				url:'do.jhtml?router=demoService.submitAsync&juid=${juid}'
			})	
		}
	
	   //赋值
	   function setValue(){
		   AOS.reset(idform_data1);
		   AOS.setValue('idform_data1.name', '王菲'); //文本框
		   AOS.setValue('idform_data1.birthday', '1982-11-17'); //日期时间
		   AOS.setValue('idform_data1.sex', '1'); //下拉项
		   AOS.setValue('idform_data1.c1', ['1','2']); //复选框
		   AOS.setValue('idform_data1.r1', '2'); //单选框
	   }
	   
	   //取值
	   function getValue(){
		   var values = {};
		   values.name= AOS.getValue('idform_data1.name');
		   values.sex= AOS.getValue('idform_data1.sex');
		   AOS.info(JSON.stringify(values));//将JSON对象转换为JSON字符串
		   //AOS.info(Ext.encode(values)); //中文会被转换为unicode
	   }
	   
	   //批量赋值
	   function setValues(){
		   AOS.reset(idform_data1);
		   var values = {
				   name:'周迅',
				   sex:'2',
				   birthday:'1983-12-22',
				   c1:['1','2','3','4'],
				   r1:'1'
		   };
		   AOS.setValues(idform_data1, values); 
	   }
	   
	  //批量取值
	   function getValues(){
		  var values = idform_data1.getValues();
		  AOS.info(JSON.stringify(values));
	  }
	
		//弹出选择卡号窗口
		function w_account_find_show() {
			w_account_find.show();
		}
		//加载表格数据
		function g_account_query() {
			var params = {
				name : id_name.getValue()
			};
			//这个Store的命名规则为：表格ID+"store"。
			g_account_store.getProxy().extraParams = params;
			g_account_store.load();
		}
		
		//账户表格双击事件
		function g_account_dbclick(obj, record) {
			AOS.setValue('f_info.card_id2',record.raw.card_id);
			AOS.setValue('f_info.name_desc',record.raw.name);
			w_account_find.hide();
		}
	
		//弹出选择上级模块窗口
		function w_org_find_show() {
			w_org_find.show();
		}
	
		//刷新上级模块树
		function t_org_find_refresh() {
			var refreshnode = t_org_find.getRootNode();
			t_org_find_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
		//上级模块树节点双击事件
		function t_org_find_select() {
			var record = AOS.selectone(t_org_find);
			AOS.setValue('f_info.parent_id',record.raw.id);
			AOS.setValue('f_info.parent_id_desc',record.raw.text);
			w_org_find.hide();
		}
	
		//定时自动切换
		AOS.task(function() {
			//id_vercode_refresh();
		}, 2000);

		//只读
		function fn1() {
			AOS.reads(form1, 'cardno,name');
		}

		//取消只读
		function fn2() {
			AOS.edits(form1, 'cardno,name');
		}

		//禁用
		function fn3() {
			AOS.disables(form1, 'cardno,age,sex,name');
		}

		//取消禁用
		function fn4() {
			AOS.enables(form1, 'cardno,age,sex,name');
		}

		//批量只读
		function fn7() {
			AOS.reads(form2, 'name,birthday,home');
		}

		//批量取消只读
		function fn8() {
			AOS.edits(form2, 'name,birthday,home');
		}

		//批量隐藏
		function fn9() {
			AOS.hides(form2, 'name,birthday');
		}

		//批量显示
		function fn10() {
			AOS.shows(form2, 'name,birthday');
		}

		//绑定change事件
		function fn_onchange(obj) {
			AOS.tip(obj.getValue());
		}
		
		//绑定focus事件
		function fn_onfocus(obj){
			AOS.tip(obj.fieldLabel);
		}
		//绑定回车键事件
		function fn_onenterkey(obj) {
			AOS.tip(obj.getValue());
		}
		
		//绑定KeDown事件
		function fn_onkeydown(obj){
			AOS.tip(obj.fieldLabel);
		}

		//绑定KeUp事件
		function fn_onkeyup(obj) {
			AOS.tip(obj.fieldLabel);
		}

		//绑定选择事件
		function fn_onselect(obj) {
			AOS.tip(obj.getValue());
		}
		
	   //身份证校验
	   function fn_id(obj){
		   if(AOS.empty(obj.getValue())) return;
		   var idinfo = AOS.idinfo(obj.getValue());
		   if(idinfo.isTrue){
			   AOS.tip(JSON.stringify(idinfo));
			   //还可以从idinfo对象中获取出生年月和性别信息
		   }else{
			   obj.markInvalid('身份证校验失败，请核对。');
		   }
	   }
	
		//姓名非空
		function fn5() {
			AOS.star(_id_name2);
		}

		//姓名可以为空
		function fn6() {
			AOS.unstar(_id_name2);
		}
		
		function fn_validate(){
			form4.isValid();
		}
		
		//一级节点选择事件监听函数
		function module1Onselect(me, records) {
			var parent_id = me.getValue();
			id_module2_store.getProxy().extraParams = {
				parent_id : parent_id
			};
			id_module2_store.load({
				callback : function(records, operation, success) {
					//这个回调里还可以根据是否查询到二级模块再去做一些事情
					if (records.length > 0) {
						AOS.edit(id_module2);
					}else{
						AOS.read(id_module2);
					}
				}
			});
		}
	</script>
</aos:onready>