<template>

	<el-container>
		<el-main class="fixMain">
			<div class="treeMain" v-loading="menuloading">
				<el-tree ref="menu" node-key="id" :data="menu.list" :props="menu.props" default-expand-all
					show-checkbox></el-tree>
			</div>
		</el-main>
		<el-footer>
			<el-button @click="$emit('closeDrawer')">取消</el-button>

			<el-popconfirm title="确定保存勾选的授权信息吗？" confirm-button-type="danger" confirm-button-text="确定"
				@confirm="submit">
				<template #reference>
					<el-button type="primary">保存</el-button>
				</template>
			</el-popconfirm>
		</el-footer>
	</el-container>

</template>

<script>
export default {
	emits: ['closeDrawer'],
	data() {
		return {
			isSaveing: false,
			menuloading: false,
			roleId: null,
			menu: {
				list: [],
				checked: [],
				props: {
					label: 'title'
				}
			}
		}
	},
	mounted() {
	},
	methods: {
		open(row) {
			this.roleId = row.id
			this.getMenu(row.id)
		},
		async submit() {
			this.isSaveing = true;
			var checkedKeys = this.$refs.menu.getCheckedKeys().concat(this.$refs.menu.getHalfCheckedKeys())
			var reqData = new FormData()
			reqData.append('ids', checkedKeys)
			reqData.append('roleId', this.roleId)
			var res = await this.$API.system.role.grant.post(reqData);
			this.isSaveing = false;
			if (res.code == 200) {
				this.$emit('closeDrawer')
				this.$message.success("角色资源授权成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
		async getMenu(roleId) {
			var reqData = {
				roleId: roleId
			}
			this.menuloading = true
			await this.$API.system.resource.listForGrant.get(reqData).then(res => {
				if (res.code == 200) {
					this.menu.list = res.data.menuList
					setTimeout(() => {
						res.data.checkedList.forEach(id => {
							this.$refs.menu.setChecked(id, true, false)
						});
					}, 100)
				}
				this.menuloading = false
			})
		}
	}
}
</script>

<style scoped>
.treeMain {
	overflow: hidden;
	border: 1px solid #dcdfe6;
	margin-bottom: 12px;
}
.fixMain{
	padding-top: 0px;
}
</style>
