<template>
	<el-container class="page-user">
		<el-aside style="width: 220px;">
			<el-container>
				<el-header style="height: auto;display: block;">
					<div class="user-info-top" style="margin-top: 10px;">
						<el-avatar :size="70" :src="user.avatar">{{ user.userNameF }}</el-avatar>
						<h2 style="margin-top: 10px;">{{ user.userName }}</h2>
					</div>
				</el-header>
				<el-main class="nopadding">
					<el-menu class="menu" :default-active="page">
						<el-menu-item-group v-for="group in menu" :key="group.groupName" :title="group.groupName">
							<el-menu-item v-for="item in group.list" :key="item.component" :index="item.component"
								@click="openPage">
								<el-icon v-if="item.icon">
									<component :is="item.icon" />
								</el-icon>
								<template #title>
									<span>{{ item.title }}</span>
								</template>
							</el-menu-item>
						</el-menu-item-group>
					</el-menu>
				</el-main>
			</el-container>
		</el-aside>
		<el-main>
			<Suspense>
				<template #default>
					<component :is="page" />
				</template>
				<template #fallback>
					<el-skeleton :rows="3" />
				</template>
			</Suspense>
		</el-main>
	</el-container>
</template>

<script>
import { defineAsyncComponent } from 'vue'

export default {
	name: 'userCenter',
	components: {
		account: defineAsyncComponent(() => import('./user/account')),
		seting: defineAsyncComponent(() => import('./user/seting')),
		password: defineAsyncComponent(() => import('./user/password'))
	},
	data() {
		return {
			menu: [
				{
					//groupName: "基本设置",
					groupName: "",
					list: [
						{
							icon: "el-icon-postcard",
							title: "个人信息",
							component: "account"
						},
						{
							icon: "el-icon-lock",
							title: "修改密码",
							component: "password"
						},
						{
							icon: "el-icon-operation",
							title: "偏好设置",
							component: "seting"
						}
					]
				}
			],
			user: {
				userName: "",
				userNameF: "",
				role: "",
				avatar: "",
			},
			page: "account"
		}
	},
	//路由跳转进来 判断from是否有特殊标识做特殊处理
	beforeRouteEnter(to, from, next) {
		next((vm) => {
			if (from.is) {
				//删除特殊标识，防止标签刷新重复执行
				delete from.is
				//执行特殊方法
				vm.$alert('路由跳转过来后含有特殊标识，做特殊处理', '提示', {
					type: 'success',
					center: true
				}).then(() => { }).catch(() => { })
			}
		})
	},
	created() {
		var userInfo = this.$TOOL.data.get("USER_INFO");
		this.user.userName = userInfo.name;
		this.user.userNameF = this.user.userName.substring(0, 1);
		this.user.avatar = userInfo.avatar
	},
	methods: {
		openPage(item) {
			this.page = item.index
		}
	}
}
</script>
