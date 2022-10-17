<template>

	<el-container>
		<el-main>
			<div class="treeMain" v-loading="menuloading">
				<el-tree ref="menu" node-key="name" :data="menu.list" :props="menu.props" default-expand-all show-checkbox></el-tree>
			</div>
		</el-main>
		<el-footer>
			<el-button @click="$emit('closeDrawer')">取消</el-button>
			<el-button type="primary" @click="submit">保存</el-button>
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
		this.getMenu()
	},
	methods: {
		open(row) {
			console.log(row)
		},
		cancelClick() {
			console.log(111)
		},
		submit() {
			this.isSaveing = true;

			//选中的和半选的合并后传值接口
			var checkedKeys = this.$refs.menu.getCheckedKeys().concat(this.$refs.menu.getHalfCheckedKeys())
			console.log(checkedKeys)

			var checkedKeys_dept = this.$refs.dept.getCheckedKeys().concat(this.$refs.dept.getHalfCheckedKeys())
			console.log(checkedKeys_dept)

			setTimeout(() => {
				this.isSaveing = false;
				this.visible = false;
				this.$message.success("操作成功")
				this.$emit('success')
			}, 1000)
		},
		async getMenu() {
			this.menuloading = true
			var res = await this.$API.system.resource.listForManage.get();
			this.menuloading = false
			this.menu.list = res.data

			// this.menu.checked = ["system", "user", "user.add", "user.edit", "user.del", "directive.edit", "other", "directive"]
			// this.$nextTick(() => {
			// 	let filterKeys = this.menu.checked.filter(key => this.$refs.menu.getNode(key).isLeaf)
			// 	this.$refs.menu.setCheckedKeys(filterKeys, true)
			// })
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
</style>
