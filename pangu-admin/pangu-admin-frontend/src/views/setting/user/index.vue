<template>
	<el-container>
		<el-aside width="230px" v-loading="showGrouploading">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" v-model="groupFilterText" clearable></el-input>
				</el-header>
				<el-main class="nopadding">
					<el-tree :props="defaultTreeProps" ref="group" class="menu" node-key="id" :data="group"
						:highlight-current="true" :expand-on-click-node="false" :filter-node-method="groupFilterNode"
						@node-click="groupClick"></el-tree>
				</el-main>
			</el-container>
		</el-aside>
		<el-container>
			<el-header>
				<div class="left-panel">
					<el-button type="primary" icon="el-icon-plus" @click="add"></el-button>
					<el-button type="danger" plain icon="el-icon-delete" :disabled="selection.length == 0"
						@click="batch_del"></el-button>
					<el-button type="primary" @click="reset" plain :disabled="selection.length == 0">重置密码</el-button>
				</div>
				<div class="right-panel">
					<div class="right-panel-search">
						<el-input v-model="search.name" style="width: 170px;" placeholder="登录账号 / 姓名" clearable>
						</el-input>
						<el-button type="primary" icon="el-icon-search" @click="upsearch"></el-button>
					</div>
				</div>
			</el-header>
			<el-main class="nopadding">
				<scTable ref="table" :apiObj="apiObj" @selection-change="selectionChange" stripe>
					<el-table-column type="selection" width="50"></el-table-column>
					<!-- <el-table-column label="ID" prop="id" width="80" sortable></el-table-column> -->
					<el-table-column label="头像" width="80">
						<template #default="scope">
							<el-avatar :src="scope.row.avatar" size="small"></el-avatar>
						</template>
					</el-table-column>
					<el-table-column label="登录账号" prop="userName" width="120"></el-table-column>
					<el-table-column label="姓名" prop="name" width="100"></el-table-column>
					<el-table-column label="性别" prop="sex" width="80">
						<template #default="scope">
							<span v-if="scope.row.sex == 1">男</span>
							<span v-if="scope.row.sex == 2">女</span>
							<span v-else>未知</span>
						</template>
					</el-table-column>
					<el-table-column label="所属部门" prop="deptName" width="150" show-overflow-tooltip></el-table-column>
					<el-table-column label="用户状态" prop="status" width="100">
						<template #default="scope">
							<el-tag v-if="scope.row.status == 1" type="success">启用</el-tag>
							<el-tag v-if="scope.row.status == 9" type="danger">停用</el-tag>
						</template>
					</el-table-column>
					<el-table-column label="用户类型" prop="type" width="120">
						<template #default="scope">
							<el-tag v-if="scope.row.type == 1" type="info">缺省</el-tag>
						</template>
					</el-table-column>
					<el-table-column label="绑定手机" prop="mobileNumber" width="120"></el-table-column>
					<el-table-column label="绑定邮箱" prop="mail" width="120"></el-table-column>
					<el-table-column label="扩展码" prop="bizCode" width="120"></el-table-column>
					<el-table-column label="创建时间" prop="gmtCreated" width="180"></el-table-column>
					<el-table-column label="备注" prop="remark" width="200" show-overflow-tooltip />
					<el-table-column label="操作" fixed="right" align="right" width="160">
						<template #default="scope">
							<el-button-group>
								<el-button text type="warning" size="small"
									@click="table_show(scope.row, scope.$index)">查看
								</el-button>
								<el-button text type="primary" size="small"
									@click="table_edit(scope.row, scope.$index)">编辑</el-button>
								<el-popconfirm title="确定删除当前用户吗？" confirm-button-type="danger" confirm-button-text="确定"
									@confirm="table_del(scope.row, scope.$index)">
									<template #reference>
										<el-button text type="danger" size="small">删除</el-button>
									</template>
								</el-popconfirm>
							</el-button-group>
						</template>
					</el-table-column>

				</scTable>
			</el-main>
		</el-container>
	</el-container>

	<save-dialog v-if="dialog.save" ref="saveDialog" @success="handleSuccess" @closed="dialog.save = false">
	</save-dialog>

	<el-drawer v-model="dialog.info" :size="550" title="查看详情" custom-class="drawerBG" direction="rtl" destroy-on-close>
		<info-dialog ref="infoDialog"></info-dialog>
	</el-drawer>

	<reset-dialog v-if="dialog.reset" ref="resetDialog" @closed="dialog.reset = false">
	</reset-dialog>

</template>

<script>
import saveDialog from './save'
import infoDialog from './info'
import resetDialog from './reset'

export default {
	name: 'user',
	components: {
		saveDialog,
		infoDialog,
		resetDialog
	},
	data() {
		return {
			dialog: {
				save: false,
				info: false,
				reset: false
			},
			showGrouploading: false,
			groupFilterText: '',
			group: [],
			apiObj: this.$API.system.user.list,
			selection: [],
			search: {
				name: null
			},
			defaultTreeProps: {
				label: 'name'
			}
		}
	},
	watch: {
		groupFilterText(val) {
			this.$refs.group.filter(val);
		}
	},
	mounted() {
		this.getGroup()
	},
	methods: {
		//添加
		add() {
			this.dialog.save = true
			this.$nextTick(() => {
				this.$refs.saveDialog.open()
			})
		},
		//编辑
		table_edit(row) {
			this.dialog.save = true
			this.$nextTick(() => {
				this.$refs.saveDialog.open('edit').setData(row)
			})
		},
		//查看
		table_show(row) {
			this.dialog.info = true
			this.$nextTick(() => {
				this.$refs.infoDialog.setData(row)
			})
		},
		//重置密码
		reset() {
			this.dialog.reset = true
			this.$nextTick(() => {
				var userIds = []
				this.selection.forEach(function (item) {
					userIds.push(item.id)
				})
				this.$refs.resetDialog.open('reset').setData(userIds)
			})
		},
		//删除
		async table_del(row) {
			var reqData = new FormData()
			reqData.append('id', row.id)
			var res = await this.$API.system.user.delete.post(reqData);
			if (res.code == 200) {
				//this.$refs.table.tableData.splice(index, 1);
				this.$refs.table.refresh()
				this.$message.success("删除成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
		//批量删除
		async batch_del() {
			this.$confirm(`确定删除选中的 ${this.selection.length} 个用户吗？`, '提示', {
				type: 'warning',
				confirmButtonText: '确定',
				confirmButtonClass: 'el-button--danger'
			}).then(async () => {
				const loading = this.$loading()
				this.showTableLoading = true
				var ids = []
				this.selection.forEach(function (item) {
					ids.push(item.id)
				})
				var reqData = new FormData()
				reqData.append('ids', ids)
				var res = await this.$API.system.user.batchDelete.post(reqData)
				if (res.code == 200) {
					this.$refs.table.refresh()
					this.$message.success("删除成功")
				} else {
					this.$alert(res.message, "提示", { type: 'error' })
				}
				loading.close()
			}).catch(() => {

			})
		},
		//表格选择后回调事件
		selectionChange(selection) {
			this.selection = selection;
		},
		//加载树数据
		async getGroup() {
			this.showGrouploading = true;
			var res = await this.$API.system.dept.list.get();
			this.showGrouploading = false;
			var allNode = { id: '', name: '所有部门' }
			res.data.unshift(allNode);
			this.group = res.data;
		},
		//树过滤
		groupFilterNode(value, data) {
			if (!value) return true;
			return data.name.indexOf(value) !== -1;
		},
		//树点击事件
		groupClick(data) {
			var params = {
				deptId: data.id
			}
			this.$refs.table.reload(params)
		},
		//搜索
		upsearch() {
			this.$refs.table.upData(this.search)
		},
		//本地更新数据
		handleSuccess(data, mode) {
			if (mode == 'add') {
				this.$refs.table.refresh()
			} else if (mode == 'edit') {
				this.$refs.table.refresh()
			}
		}
	}
}
</script>

<style>
</style>
