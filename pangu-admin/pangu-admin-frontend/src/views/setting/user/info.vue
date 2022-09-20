<template>
	<el-main style="padding:0 20px;">
		<el-card shadow="hover">
			<el-descriptions :column="1" title="用户基础信息">
				<el-descriptions-item>
					<el-avatar :src="data.avatar" size="large"></el-avatar>
				</el-descriptions-item>
				<el-descriptions-item label="编号" label-class-name="bold">{{ data.id }}
				</el-descriptions-item>
				<el-descriptions-item label="登录账号" label-class-name="bold">{{ data.userName }}
				</el-descriptions-item>
				<el-descriptions-item label="姓名" label-class-name="bold">{{ data.name }}
				</el-descriptions-item>
				<el-descriptions-item label="性别" label-class-name="bold">男
				</el-descriptions-item>
				<el-descriptions-item label="所属部门" label-class-name="bold">{{ data.deptName }}
				</el-descriptions-item>
				<el-descriptions-item label="用户状态" label-class-name="bold">{{ data.status }}
				</el-descriptions-item>
				<el-descriptions-item label="用户类型" label-class-name="bold">{{ data.type }}
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

		<el-card shadow="hover" style="margin-top:20px; margin-bottom:30px">
			<el-descriptions :column="1" title="已授予用户权限">
				<el-descriptions-item label="已分配角色" label-class-name="bold danger">测试角色 | 开发角色
				</el-descriptions-item>
				<el-descriptions-item label="已授权限集" label-class-name="bold">{{ data.userName }}
				</el-descriptions-item>
			</el-descriptions>
		</el-card>

	</el-main>
</template>

<script>
export default {
	data() {
		return {
			data: {}
		}
	},
	mounted() {

	},
	methods: {
		//注入数据
		setData(data) {
			this.data = data
		}
	}
}
</script>

<style>
.bold {
	font-weight: bold;
}

.danger {
	color: #F56C6C !important;
}
</style>
