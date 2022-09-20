<template>
	<el-dialog :title="titleMap[mode]" v-model="visible" :width="500" top="30px" destroy-on-close
		@closed="$emit('closed')">
		<el-form :model="form" :rules="rules" :disabled="mode == 'show'" ref="dialogForm" label-width="80px"
			label-position="right">
			<el-form-item label="登录账号" prop="userName">
				<el-input v-model="form.userName" placeholder="请输入登录账号" maxlength="20" onkeyup="value=value.replace(/[^\x00-\xff]/g, '')" show-word-limit clearable>
				</el-input>
			</el-form-item>
			<template v-if="mode == 'add'">
				<el-form-item label="登录密码" prop="password">
					<el-input type="password" v-model="form.password" placeholder="请输入密码" maxlength="20" minlength="8"
						clearable show-password></el-input>
				</el-form-item>
				<el-form-item label="确认密码" prop="password2">
					<el-input type="password" v-model="form.password2" placeholder="请再次输入密码" maxlength="20"
						minlength="8" clearable show-password></el-input>
				</el-form-item>
			</template>
			<el-form-item label="姓名" prop="name">
				<el-input v-model="form.name" placeholder="请输入真实姓名" maxlength="10" show-word-limit clearable></el-input>
			</el-form-item>
			<el-form-item label="所属部门" prop="deptIds">
				<el-cascader v-model="form.deptIds" :options="depts" :props="deptsProps" placeholder="请选择所属部门" clearable
					style="width: 100%;">
				</el-cascader>
			</el-form-item>
			<el-form-item label="用户类型" prop="type">
				<el-select v-model="form.type" class="m-2" placeholder="请选择用户类型" style="width: 100%;">
					<el-option v-for="item in typeItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="用户状态" prop="status">
				<el-select v-model="form.status" class="m-2" placeholder="请选择用户状态" style="width: 100%;">
					<el-option v-for="item in statusItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="所属角色" prop="roleIds">
				<el-select v-model="form.roleIds" placeholder="请选择所属角色" multiple filterable style="width: 100%">
					<el-option v-for="item in roles" :key="item.id" :label="item.name" :value="item.id" />
				</el-select>
			</el-form-item>
			<el-form-item label="扩展码" prop="bizCode">
				<el-input v-model="form.bizCode" placeholder="请输入业务扩展码" maxlength="50" show-word-limit clearable>
				</el-input>
			</el-form-item>
			<el-form-item label="备注" prop="remark">
				<el-input v-model="form.remark" placeholder="请输入备注" maxlength="250" show-word-limit clearable
					type="textarea"></el-input>
			</el-form-item>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取 消</el-button>
			<el-button v-if="mode != 'show'" type="primary" :loading="isSaveing" @click="submit()">保 存</el-button>
		</template>
	</el-dialog>
</template>

<script>
export default {
	emits: ['success', 'closed'],
	data() {
		return {
			mode: "add",
			titleMap: {
				add: '新增用户',
				edit: '编辑用户',
				show: '查看'
			},
			visible: false,
			isSaveing: false,
			//表单数据
			form: {
				id: "",
				userName: "",
				avatar: "",
				name: "",
				deptIds: [],
				roleIds: [],
				bizCode: "",
				status: '1',
				type: '1',
				remark: ""
			},
			//验证规则
			rules: {
				status: [
					{ required: true, message: '用户状态不能为空' }
				],
				type: [
					{ required: true, message: '用户类型不能为空' }
				],
				userName: [
					{ required: true, message: '登录账号不能为空' },
					{
						required: true,
						validator: (rule, value, callback) => {
							var params = { userName: value, id: this.form.id }
							this.$API.system.user.validateUserName.get(params).then(res => {
								if (res.data >= 1) {
									return callback(new Error('此账号 ' + value + ' 已存在, 请修改'))
								}
								callback()
							})
						},
						trigger: 'blur'
					}
				],
				name: [
					{ required: true, message: '真实姓名不能为空' }
				],
				password: [
					{ required: true, message: '登录密码不能为空' },
					{
						validator: (rule, value, callback) => {
							if (value.length < 6) {
								return callback(new Error('密码长度不能小于6位'))
							}
							callback();
						}
					}
				],
				password2: [
					{ required: true, message: '请再次输入密码' },
					{
						validator: (rule, value, callback) => {
							if (value !== this.form.password) {
								callback(new Error('两次输入密码不一致'));
							} else {
								callback();
							}
						}
					},
					{
						validator: (rule, value, callback) => {
							if (value.length < 6) {
								return callback(new Error('密码长度不能小于6位'))
							}
							callback();
						}
					}
				],
				deptIds: [
					{ required: true, message: '所属部门不能为空' }
				]
			},
			//所需数据选项
			roles: [],
			rolesProps: {
				value: "id",
				multiple: true
			},
			depts: [],
			deptsProps: {
				value: "id",
				label: "name",
				checkStrictly: true
			},
			typeItems: [{
				value: '1',
				label: '缺省',
			}],
			statusItems: [{
				value: '1',
				label: '启用',
			}, {
				value: '9',
				label: '停用',
			}],
		}
	},
	mounted() {
		this.getRoles()
		this.getDepts()
	},
	methods: {
		//显示
		open(mode = 'add') {
			this.mode = mode;
			this.visible = true;
			return this
		},
		//加载角色数据
		async getRoles() {
			var reqData = { page: 1, pageSize: 9999 }
			var res = await this.$API.system.role.list.get(reqData);
			this.roles = res.data.rows;
		},
		async getDepts() {
			var res = await this.$API.system.dept.list.get();
			this.depts = res.data;
		},
		//表单提交方法
		submit() {
			this.$refs.dialogForm.validate(async (valid) => {
				if (valid) {
					this.isSaveing = true;
					var res;
					if (this.mode == 'add') {
						this.form.deptId = this.form.deptIds[this.form.deptIds.length - 1]
						res = await this.$API.system.user.add.post(this.form)
					} else if (this.mode == 'edit') {
						res = await this.$API.system.user.update.post(this.form)
					}
					this.isSaveing = false;
					if (res.code == 200) {
						this.visible = false;
						this.$emit('success', this.form, this.mode)
						this.$message.success("操作成功")
					} else {
						this.$alert(res.message, "提示", { type: 'error' })
					}
				} else {
					return false;
				}
			})
		},
		//表单注入数据
		setData(data) {
			var params = { userId: data.id}
			this.$API.system.user.queryUserInfoById.get(params).then(res => {
				if (res.code == 200) {
					Object.assign(this.form, res.data)
					this.form.deptIds = res.data.deptId
				}
			})
		}
	}
}
</script>

<style>
</style>
