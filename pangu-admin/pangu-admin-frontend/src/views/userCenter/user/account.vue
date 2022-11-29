<template>
	<el-card shadow="never" header="个人信息">
		<el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="right" v-loading="loading">
			<el-form-item label="登录账号" prop="userName">
				<el-input v-model="form.userName" disabled></el-input>
			</el-form-item>
			<el-form-item label="所属部门">
				<el-input v-model="form.deptName" disabled></el-input>
			</el-form-item>
			<el-form-item label="所属角色">
				<el-input v-model="form.roleNames" disabled></el-input>
			</el-form-item>
			<el-form-item label="姓名" prop="name">
				<el-input v-model="form.name" placeholder="请输入真实姓名" maxlength="10" show-word-limit clearable></el-input>
			</el-form-item>
			<el-form-item label="性别" prop="sex">
				<el-select v-model="form.sex" placeholder="请选择" style="width: 100%;">
					<el-option label="保密" value="0"></el-option>
					<el-option label="男" value="1"></el-option>
					<el-option label="女" value="2"></el-option>
				</el-select>
			</el-form-item>
			<el-form-item label="备注/签名">
				<el-input v-model="form.remark" placeholder="请输入备注/签名" maxlength="250" show-word-limit clearable
					type="textarea"></el-input>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" :loading="isSaveing" @click="saveUserInfo">保存</el-button>
			</el-form-item>
		</el-form>
	</el-card>
</template>

<script>

export default {
	emits: ['emitUserInfo'],
	data() {
		return {
			isSaveing: false,
			loading: false,
			//表单数据
			form: {
				id: null
			},
			userInfo: this.$TOOL.data.get("USER_INFO"),
			//验证规则
			rules: {
				name: [
					{ required: true, message: '真实姓名不能为空' }
				]
			}
		}
	},
	mounted() {
		this.findUserInfo()
	},
	methods: {
		async findUserInfo() {
			this.loading = true
			var params = { userId: this.userInfo.id }
			await this.$API.system.user.queryUserDetailInfoById.get(params).then(res => {
				if (res.code == 200) {
					this.form = res.data
				}
				this.loading = false
			})
		},
		async saveUserInfo() {
			this.isSaveing = true
			var res = await this.$API.system.user.update.post(this.form)
			this.isSaveing = false;
			if (res.code == 200) {
				this.visible = false;
				this.$message.success("操作成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		}
	}
}
</script>

<style>

</style>
