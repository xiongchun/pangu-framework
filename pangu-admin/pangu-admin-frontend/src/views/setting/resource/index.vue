<template>
	<el-container>
		<el-aside width="260px" v-loading="menuloading">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" v-model="menuFilterText" clearable></el-input>
				</el-header>
				<el-main class="nopadding">
					<el-tree ref="menu" class="menu" node-key="id" :data="menuList" :props="menuProps"
						@check="menuCheck" :filter-node-method="menuFilterNode" @node-click="menuClick"
						@node-drop="nodeDrop" :expand-on-click-node="false" draggable highlight-current check-strictly
						show-checkbox>
						<template #default="{ node, data }">
							<span class="custom-tree-node el-tree-node__label">
								<span class="label">
									{{ node.label }}
								</span>
								<span class="do">
									<el-tooltip content="创建下级资源节点" placement="top">
										<el-icon @click.stop="add(node, data)">
											<el-icon-plus />
										</el-icon>
									</el-tooltip>
								</span>
							</span>
						</template>

					</el-tree>
				</el-main>
				<el-footer>
					<el-tooltip content="创建一级资源节点" placement="top">
						<el-button type="primary" icon="el-icon-plus" @click="add()"></el-button>
					</el-tooltip>
					<el-button type="primary" icon="el-icon-refresh" @click="this.getMenu" plain>
					</el-button>
					<el-button type="danger" icon="el-icon-delete" @click="delMenu" :disabled="checkedKeys.length == 0"
						plain>
					</el-button>
				</el-footer>
			</el-container>
		</el-aside>
		<el-container>
			<el-main class="nopadding" style="padding:20px;" ref="main">
				<save ref="save" :menuOptions="menuList"></save>
			</el-main>
		</el-container>
	</el-container>
</template>

<script>
import save from './save'

export default {
	name: "settingMenu",
	components: {
		save
	},
	data() {
		return {
			menuloading: false,
			menuList: [],
			menuProps: {
				label: 'title'
			},
			menuFilterText: "",
			checkedKeys: []
		}
	},
	watch: {
		menuFilterText(val) {
			this.$refs.menu.filter(val);
		}
	},
	mounted() {
		this.getMenu();
	},
	methods: {
		//加载树数据
		async getMenu() {
			this.menuloading = true
			var res = await this.$API.system.resource.listForManage.get();
			this.menuloading = false
			this.menuList = res.data;
		},
		//树点击
		menuClick(data) {
			//var pid = node.level == 1 ? undefined : node.parent.data.id;
			this.$refs.save.setData(data)
			this.$refs.main.$el.scrollTop = 0
		},
		//树过滤
		menuFilterNode(value, data) {
			if (!value) return true;
			var targetText = data.title;
			return targetText.indexOf(value) !== -1;
		},
		//树拖拽
		async nodeDrop(draggingNode, dropNode, dropType) {
			this.$refs.save.setData({})
			this.$message(`拖拽对象：${draggingNode.data.title}, 释放对象：${dropNode.data.title}, 释放对象的位置：${dropType}`)
			var reqData = {
				id: draggingNode.data.id
			}
			if (dropType == 'inner') {
				reqData.parentId = dropNode.data.id
				reqData.sortNo = 99
			} else if (dropType == 'before') {
				reqData.parentId = dropNode.data.parentId
				
			} else if (dropType == 'after') {
				reqData.parentId = dropNode.data.parentId
			}
			//var res = await this.$API.system.resource.update.post(reqData)
		},
		//树选择
		menuCheck(node, checked) {
			this.checkedKeys = checked.checkedKeys
		},

		//增加
		async add(node, data) {
			var time = this.$TOOL.dateFormat(new Date(), 'ssS')
			var tempName = "未命名_" + time;
			var newMenuData = {
				parentId: data ? data.id : "",
				title: tempName,
				resourceKey: tempName,
				type: "menu",
				sortNo: 99
			}

			this.menuloading = true
			var res = await this.$API.system.resource.add.post(newMenuData)
			this.menuloading = false
			if (res.code == 200) {
				newMenuData.id = res.data
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
			this.$refs.menu.append(newMenuData, node)
			this.$refs.menu.setCurrentKey(newMenuData.id)
			this.$refs.save.setData(newMenuData)
		},
		//删除菜单
		async delMenu() {
			var confirm = await this.$confirm(`确定删除选中的 ${this.checkedKeys.length} 项资源及其子节点吗？`, '提示', {
				type: 'warning',
				confirmButtonText: '删除',
				confirmButtonClass: 'el-button--danger'
			}).catch(() => { })
			if (confirm != 'confirm') {
				return false
			}
			this.menuloading = true
			var reqData = new FormData()
			reqData.append('ids', this.checkedKeys)
			var res = await this.$API.system.resource.batchDelete.post(reqData)
			this.menuloading = false
			if (res.code == 200) {
				this.checkedKeys.forEach(item => {
					this.$refs.menu.remove(item)
				})
				this.$refs.save.setData({})
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		}
	}
}
</script>

<style scoped>
.custom-tree-node {
	display: flex;
	flex: 1;
	align-items: center;
	justify-content: space-between;
	font-size: 14px;
	padding-right: 24px;
	height: 100%;
}

.custom-tree-node .label {
	display: flex;
	align-items: center;
	;
	height: 100%;
}

.custom-tree-node .label .el-tag {
	margin-left: 5px;
}

.custom-tree-node .do {
	display: none;
}

.custom-tree-node .do i {
	margin-left: 5px;
	color: #999;
}

.custom-tree-node .do i:hover {
	color: #333;
}

.custom-tree-node:hover .do {
	display: inline-block;
}
</style>
