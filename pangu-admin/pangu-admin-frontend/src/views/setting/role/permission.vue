<template>

	<el-container>
		<el-main>
			<el-card v-loading="menuloading" class="__card1">
				<el-tree ref="menu" node-key="id" :data="menu.list" :props="menu.props" class="menu" default-expand-all
					show-checkbox></el-tree>
			</el-card>
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
			var res = await this.$API.system.role.grantResource.post(reqData);
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

.__card {
	margin-left: 15px;
	margin-right: 15px
}
</style>
