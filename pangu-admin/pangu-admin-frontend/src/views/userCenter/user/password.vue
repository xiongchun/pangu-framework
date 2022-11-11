<template>
	<el-card shadow="never" header="修改密码">
		<el-alert title="密码更新成功后，你将被重定向到登录页面使用新密码重新登录。" type="info" show-icon style="margin-bottom: 20px;" />
		<el-form ref="form" :model="form" :rules="rules" label-width="80px">
			<el-form-item label="当前密码" prop="password">
				<el-input v-model="form.password" type="password" placeholder="请输入当前密码" maxlength="20" clearable
					show-password></el-input>
				<div class="el-form-item-msg">必须提供当前登录用户密码才能进行更改</div>
			</el-form-item>
			<el-form-item label="新密码" prop="newPassword">
				<el-input v-model="form.newPassword" type="password" placeholder="请输入新密码" maxlength="20" clearable
					show-password></el-input>
				<sc-password-strength v-model="form.newPassword"></sc-password-strength>
				<div class="el-form-item-msg">建议输入至少8位包含字母、数字、特殊字符的组合字符串（密码强度检测为绿色是最优）</div>
			</el-form-item>
			<el-form-item label="确认密码" prop="confirmNewPassword">
				<el-input v-model="form.confirmNewPassword" type="password" placeholder="请再次输入新密码" maxlength="20"
					clearable show-password></el-input>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" :loading="isSaveing" @click="submit">修改密码</el-button>
			</el-form-item>
		</el-form>
	</el-card>
</template>

<script>
import scPasswordStrength from '@/components/scPasswordStrength'

export default {
	components: {
		scPasswordStrength
	},
	data() {
		return {
			userInfo: this.$TOOL.data.get("USER_INFO"),
			isSaveing: false,
			form: {
				password: "",
				newPassword: "",
				confirmNewPassword: ""
			},
			rules: {
				password: [
					{ required: true, message: '请输入当前密码' },
				],
				newPassword: [
					{ required: true, message: '请输入新密码' },
					{
						validator: (rule, value, callback) => {
							if (value.length < 6) {
								return callback(new Error('密码长度不能小于6位'))
							}
							callback();
						}
					}
				],
				confirmNewPassword: [
					{ required: true, message: '请再次输入新密码' },
					{
						validator: (rule, value, callback) => {
							if (value !== this.form.newPassword) {
								callback(new Error('两次输入密码不一致'));
							} else {
								callback();
							}
						}
					}
				]
			}
		}
	},
	methods: {
		submit() {
			this.$refs.form.validate(async (valid) => {
				if (valid) {
					this.$confirm(`确定修改密码吗？`, '提示', {
						type: 'warning',
						confirmButtonText: '确定'
					}).then(async () => {
						this.isSaveing = true
						var reqData = new FormData()
						reqData.append('userId', this.userInfo.id)
						reqData.append('password', this.$TOOL.crypto.MD5(this.form.password))
						reqData.append('newPassword', this.$TOOL.crypto.MD5(this.form.newPassword))
						var res = await this.$API.system.user.updatePassword.post(reqData)
						this.isSaveing = false
						if (res.code == 200) {
							this.$alert("密码修改成功，是否跳转至登录页使用新密码登录?", "修改成功", {
								type: 'success',
								center: true
							}).then(() => {
								this.$router.replace({
									path: '/login'
								})
							}).catch(() => { })
						} else {
							this.$alert(res.message, "提示", { type: 'error' })
						}
					}).catch(() => {

					})
				} else {
					return false;
				}
			})
		},
		async test() {
			var reqData = new FormData()
			reqData.append('userId', 1)
			reqData.append('password', "124")
			reqData.append('newPassword', "124")
			var res = await this.$API.system.user.updatePassword.post(reqData)
			this.isSaveing = false
			if (res.code == 200) {
				this.$alert('操作成功', "提示", { type: 'success' })
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		}
	}
}
</script>

<style>

</style>
