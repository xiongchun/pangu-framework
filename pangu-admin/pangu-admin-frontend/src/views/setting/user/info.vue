<template>
	<el-container>
		<el-aside width="370px">
			<el-card class="__card">
				<el-descriptions :column="1" title="" v-loading="loading" border>
					<el-descriptions-item width="40px">
						<el-avatar :src="data.avatar" size="large"></el-avatar>
					</el-descriptions-item>
					<el-descriptions-item label="编号">{{ data.id }}
					</el-descriptions-item>
					<el-descriptions-item label="部门">{{ data.deptName }}
					</el-descriptions-item>
					<el-descriptions-item label="登录账号">{{ data.userName }}
					</el-descriptions-item>
					<el-descriptions-item label="姓名">{{ data.name }}
					</el-descriptions-item>
					<el-descriptions-item>
						<template #label>
							<div class="cell-item">
								<el-badge :value="roleSize">分配角色</el-badge>
							</div>
						</template>
						<ul v-for="(name, index) in data.roleNames" :key="index" style="list-style: none;">
							<li>{{ name }}</li>
						</ul>
					</el-descriptions-item>
					<el-descriptions-item label="性别">{{ data.sexDesc }}
					</el-descriptions-item>
					<el-descriptions-item label="用户状态">{{ data.statusDesc }}
					</el-descriptions-item>
					<el-descriptions-item label="用户类型">{{ data.typeDesc }}
					</el-descriptions-item>
					<el-descriptions-item label="绑定手机">{{ data.mobileNumber }}
					</el-descriptions-item>
					<el-descriptions-item label="绑定邮箱">{{ data.mail }}
					</el-descriptions-item>
					<el-descriptions-item label="扩展码">{{ data.bizCode }}
					</el-descriptions-item>
					<el-descriptions-item label="创建时间">{{ data.gmtCreated }}
					</el-descriptions-item>
					<el-descriptions-item label="备注">{{ data.remark }}
					</el-descriptions-item>
				</el-descriptions>
			</el-card>
		</el-aside>
		<el-aside width="330px">
			<el-card v-loading="loadingTree" class="__card">
				<template #header>
					<div class="el-descriptions__title">
						<span>已授予资源权限</span>
					</div>
				</template>
				<el-tree ref="menu" node-key="id" :data="menu.list" :props="menu.props" class="menu" default-expand-all>
				</el-tree>
			</el-card>
		</el-aside>
	</el-container>
</template>

<script>
export default {
	data() {
		return {
			roleSize: 0,
			data: {},
			loading: false,
			loadingTree: false,
			params: {
				userId: null,
			},
			menu: {
				list: [],
				props: {
					label: 'title'
				}
			}
		}
	},
	mounted() {
		setTimeout(() => {
			this.getUserInfo()
			this.getResource()
		}, 200)
	},
	methods: {
		open(row) {
			this.params.userId = row.id
		},
		async getUserInfo() {
			this.loading = true
			await this.$API.system.user.queryUserDetailInfoById.get(this.params).then(res => {
				if (res.code == 200) {
					this.data = res.data
					this.roleSize = res.data.roleNames.length
				}
				this.loading = false
			})
		},
		async getResource() {
			this.loadingTree = true
			await this.$API.system.resource.listAllResourcesByUserId.get(this.params).then(res => {
				if (res.code == 200) {
					this.menu.list = res.data
				}
				this.loadingTree = false
			})
		}
	}
}
</script>

<style>
.__card {
	margin-left: 15px;
	margin-right: 15px
}
</style>
