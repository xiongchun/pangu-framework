<template>
	<el-form ref="loginForm" :model="form" :rules="rules" label-width="0" size="large">
		<el-form-item prop="userName">
			<el-input v-model="form.userName" prefix-icon="el-icon-user" clearable :placeholder="$t('login.userPlaceholder')">
			</el-input>
		</el-form-item>
		<el-form-item prop="password">
			<el-input v-model="form.password" prefix-icon="el-icon-lock" clearable show-password :placeholder="$t('login.PWPlaceholder')"></el-input>
		</el-form-item>
		<el-form-item style="margin-bottom: 10px;">
				<el-col :span="12">
					<el-checkbox :label="$t('login.rememberMe')" v-model="form.autologin"></el-checkbox>
				</el-col>
				<el-col :span="12" class="login-forgot">
					<router-link to="/reset_password">{{ $t('login.forgetPassword') }}？</router-link>
				</el-col>
		</el-form-item>
		<el-form-item>
			<el-button type="primary" style="width: 100%;" :loading="isSaving" round @click="login">{{ $t('login.signIn') }}</el-button>
		</el-form-item>
		<div class="login-reg">
			{{$t('login.noAccount')}} <router-link to="/user_register">{{$t('login.createAccount')}}</router-link>
		</div>
	</el-form>
</template>

<script>
	export default {
		data() {
			return {
				form: {
					userName: "admin",
					password: "123456",
					autologin: true
				},
				rules: {
					userName: [
						{required: true, message: this.$t('login.userError'), trigger: 'blur'}
					],
					password: [
						{required: true, message: this.$t('login.PWError'), trigger: 'blur'}
					]
				},
				isSaving: false,
				name: ""
			}
		},
		mounted() {

		},
		methods: {
			async login(){
				
				var validate = await this.$refs.loginForm.validate().catch(()=>{})
				if(!validate){ return false }

				this.isSaving = true
				var data = {
					userName: this.form.userName,
					password: this.$TOOL.crypto.MD5(this.form.password)
				}
				//获取token
				var res = await this.$API.system.home.login.post(data)
				if(res.code == 200){
					this.$TOOL.cookie.set("TOKEN", res.data.token, {
						// 单位：小时，0：长期有效
						expires: this.form.autologin ? 8*60*60 : 0
					})
					this.$TOOL.data.set("USER_INFO", res.data.userInfo)
					this.name = res.data.userInfo.name
				}else{
					this.isSaving = false
					this.$message.error(res.message)
					return false
				}
				//获取菜单
				var reqData = {
					userId: res.data.userInfo.id
				}
				var menu = menu = await this.$API.system.resource.list.get(reqData)
				if(menu.code == 200){
					if(menu.data.menu.length==0){
						this.isSaving = false
						this.$alert("当前用户无任何菜单权限，请联系管理员", "无权限访问", {
							type: 'error',
							center: true
						})
						return false
					}
					this.$TOOL.data.set("MENU", menu.data.menu)
					this.$TOOL.data.set("PERMISSIONS", menu.data.permissions)
				}else{
					this.isSaving = false
					this.$message.warning(menu.message)
					return false
				}

				this.$router.replace({
					path: '/'
				})
				this.$message.success("用户 " + this.name +  " 登录成功")
				this.isSaving = false
				
			},
		}
	}
</script>

<style>
</style>
