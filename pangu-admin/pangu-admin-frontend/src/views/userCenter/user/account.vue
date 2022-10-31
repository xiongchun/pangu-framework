<template>
	<el-card shadow="never" header="个人信息">
		<el-form ref="form" :model="form" label-width="80px" label-position="right" style="margin-top:20px;">
			<el-form-item label="账号">
				<el-input v-model="form.userName" disabled></el-input>
				<div class="el-form-item-msg">账号信息用于登录，系统不允许修改</div>
			</el-form-item>
			<el-form-item label="姓名" prop="name">
				<el-input v-model="form.name" placeholder="请输入真实姓名" maxlength="10" show-word-limit clearable></el-input>
			</el-form-item>
			<el-form-item label="性别" prop="sex">
				<el-select v-model="form.sex" placeholder="请选择">
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
				<el-button type="primary">保存</el-button>
			</el-form-item>
		</el-form>
	</el-card>
</template>

<script>
export default {
	data() {
		return {
			isSaveing: false,
			//表单数据
			form: {
				id: "",
				userName: "",
				sex: "0",
				avatar: "",
				name: "",
				remark: ""
			}
		}
	}
}
</script>

<style>

</style>
