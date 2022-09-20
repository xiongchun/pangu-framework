<template>
	<el-main style="padding:0 20px;">
		<el-card shadow="hover">
			<el-descriptions :column="1" title="用户基础信息" v-loading="loading">
				<el-descriptions-item>
					<el-avatar :src="data.avatar" size="large"></el-avatar>
				</el-descriptions-item>
				<el-descriptions-item label="编号" label-class-name="bold">{{ data.id }}
				</el-descriptions-item>
				<el-descriptions-item label="登录账号" label-class-name="bold">{{ data.userName }}
				</el-descriptions-item>
				<el-descriptions-item label="姓名" label-class-name="bold">{{ data.name }}
				</el-descriptions-item>
				<el-descriptions-item label="性别" label-class-name="bold">{{ data.sexDesc }}
				</el-descriptions-item>
				<el-descriptions-item label="所属部门" label-class-name="bold">{{ data.deptName }}
				</el-descriptions-item>
				<el-descriptions-item label="用户状态" label-class-name="bold">{{ data.statusDesc }}
				</el-descriptions-item>
				<el-descriptions-item label="用户类型" label-class-name="bold">{{ data.typeDesc }}
				</el-descriptions-item>
				<el-descriptions-item label="绑定手机" label-class-name="bold">{{ data.mobileNumber }}
				</el-descriptions-item>
				<el-descriptions-item label="绑定邮箱" label-class-name="bold">{{ data.mail }}
				</el-descriptions-item>
				<el-descriptions-item label="扩展码" label-class-name="bold">{{ data.bizCode }}
				</el-descriptions-item>
				<el-descriptions-item label="创建时间" label-class-name="bold">{{ data.gmtCreated }}
				</el-descriptions-item>
				<el-descriptions-item label="备注" label-class-name="bold">{{ data.remark }}
				</el-descriptions-item>
			</el-descriptions>
		</el-card>

		<el-card shadow="hover" style="margin-top:20px; margin-bottom:20px" v-loading="loading2">
			<template #header>
				<div class="el-descriptions__title">
					<span>已分配角色</span>
				</div>
			</template>
			<span class="card_body">{{ data2.roleNames }}</span>
		</el-card>

		<el-card shadow="hover" style="margin-top:20px; margin-bottom:30px" v-loading="loading3">
			<template #header>
				<div class="el-descriptions__title">
					<span>已授予权限</span>
				</div>
			</template>
			<span class="card_body">TODO</span>
		</el-card>

	</el-main>
</template>

<script>
export default {
	data() {
		return {
			data: {},
			data2: {},
			loading: false,
			loading2: false,
			loading3: false
		}
	},
	mounted() {

	},
	methods: {
		//注入数据
		setData(row) {
			this.loading = true
			var params = { userId: row.id }
			this.$API.system.user.queryUserDetailInfoById.get(params).then(res => {
				if (res.code == 200) {
					this.data = res.data
				}
				this.loading = false
			})
			this.loading2 = true
			this.$API.system.user.queryRolesByUserId.get(params).then(res => {
				if (res.code == 200) {
					var roleNames = "";
					for (const role of res.data) {
						roleNames = roleNames + role.name + " | "
					}
					this.data2.roleNames = roleNames.substring(0, roleNames.length - 2)
				}
				this.loading2 = false
			})
		}
	}
}
</script>

<style>
.bold {
	font-weight: bold;
}
.card_body {
	font-size: 14px !important;
	color:#606266
	
}
</style>
