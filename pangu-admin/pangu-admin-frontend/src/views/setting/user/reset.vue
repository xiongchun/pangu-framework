<template>
	<el-dialog :title="titleMap[mode]" v-model="visible" :width="450" destroy-on-close @closed="$emit('closed')">
		<el-form :model="form" :rules="rules" :disabled="mode == 'show'" ref="dialogForm" label-width="80px"
			label-position="right">
			<el-form-item label="登录密码" prop="password">
				<el-input type="password" v-model="form.password" placeholder="请输入密码" maxlength="20" minlength="8"
					clearable show-password></el-input>
			</el-form-item>
			<el-form-item label="确认密码" prop="password2">
				<el-input type="password" v-model="form.password2" placeholder="请再次输入密码" maxlength="20" minlength="8"
					clearable show-password></el-input>
			</el-form-item>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取 消</el-button>
			<el-button type="primary" :loading="isSaveing" @click="submit()">保 存</el-button>
		</template>
	</el-dialog>
</template>

<script>
export default {
	emits: ['closed'],
	data() {
		return {
			mode: "",
			titleMap: {
				reset: '重置密码'
			},
			visible: false,
			isSaveing: false,
			userIds: [],
			//表单数据
			form: {
				password: ""
			},
			//验证规则
			rules: {
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
				]
			}
		}
	},
	mounted() {

	},
	methods: {
		open(mode = 'reset') {
			this.mode = mode;
			this.visible = true;
			return this
		},
		//表单提交方法
		submit() {

			this.$refs.dialogForm.validate(async (valid) => {
				if (valid) {
					this.$confirm(`确定重置选中 ${this.userIds.length} 个用户的密码吗？`, '提示', {
						type: 'warning',
						confirmButtonText: '确定'
					}).then(async () => {
						this.isSaveing = true
						var reqData = new FormData()
						reqData.append('userIds', this.userIds)
						reqData.append('password', this.$TOOL.crypto.MD5(this.form.password))
						var res = await this.$API.system.user.resetPassword.post(reqData)
						if (res.code == 200) {
							this.$message.success("操作成功")
						} else {
							this.$alert(res.message, "提示", { type: 'error' })
						}
						this.visible = false;
					}).catch(() => {

					})
				} else {
					return false;
				}
			})
		},
		//表单注入数据
		setData(userIds) {
			this.userIds = userIds
		}
	}
}
</script>

<style>
</style>
