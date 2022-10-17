<template>
	<el-container>
		<el-header>
			<div class="left-panel">
				<el-button type="primary" icon="el-icon-plus" @click="add"></el-button>
				<el-button type="danger" plain icon="el-icon-delete" :disabled="selection.length == 0" @click="batch_del">
				</el-button>
				<!-- <el-button type="primary" plain :disabled="selection.length != 1" @click="permission">权限设置</el-button> -->
			</div>
			<div class="right-panel">
				<div class="right-panel-search">
					<el-input v-model="search.name" style="width: 170px;" placeholder="角色名称" clearable></el-input>
					<el-button type="primary" icon="el-icon-search" @click="upsearch"></el-button>
				</div>
			</div>
		</el-header>
		<el-main class="nopadding">
			<scTable ref="table" :apiObj="apiObj" row-key="id" @selection-change="selectionChange" stripe>
				<el-table-column type="selection" width="50"></el-table-column>
				<!-- <el-table-column label="#" type="index" width="50"></el-table-column> -->
				<el-table-column label="角色名称" prop="name" width="150"></el-table-column>
				<el-table-column label="角色标识" prop="roleKey" width="150"></el-table-column>
				<el-table-column label="角色状态" prop="status" width="150">
					<template #default="scope">
						<el-tag v-if="scope.row.status == 1" type="success">启用</el-tag>
						<el-tag v-if="scope.row.status == 9" type="danger">停用</el-tag>
					</template>
				</el-table-column>
				<el-table-column label="角色类型" prop="type" width="150">
					<template #default="scope">
						<el-tag v-if="scope.row.type == 1" type="info">缺省</el-tag>
					</template>
				</el-table-column>
				<el-table-column label="扩展码" prop="bizCode" width="120"></el-table-column>
				<el-table-column label="创建时间" prop="gmtCreated" width="180"></el-table-column>
				<el-table-column label="备注" prop="remark" width="200"></el-table-column>
				<el-table-column label="操作" fixed="right" align="right" width="160">
					<template #default="scope">
						<el-button-group>
							<el-button text type="warning" size="small" @click="permission(scope.row, scope.$index)">授权
							</el-button>
							<el-button text type="primary" size="small" @click="table_edit(scope.row, scope.$index)">编辑
							</el-button>
							<el-popconfirm title="确定删除当前记录吗？" confirm-button-type="danger" confirm-button-text="删除"
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

	<save-dialog v-if="dialog.save" ref="saveDialog" @success="handleSaveSuccess" @closed="dialog.save = false">
	</save-dialog>

	<el-drawer v-model="dialog.permission" :size="450" title="角色权限设置" direction="rtl" destroy-on-close>
		<permission-dialog ref="permissionDialog" @closeDrawer="dialog.permission = false"></permission-dialog>
	</el-drawer>

</template>

<script>
import saveDialog from './save'
import permissionDialog from './permission'

export default {
	name: 'role',
	components: {
		saveDialog,
		permissionDialog
	},
	data() {
		return {
			dialog: {
				save: false,
				permission: false
			},
			apiObj: this.$API.system.role.list,
			selection: [],
			search: {
				name: null
			}
		}
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
		//权限设置
		permission(row) {
			this.dialog.permission = true
			this.$nextTick(() => {
				this.$refs.permissionDialog.open(row)
			})
		},
		//删除
		async table_del(row) {
			var reqData = new FormData()
			reqData.append('id', row.id)
			var res = await this.$API.system.role.delete.post(reqData);
			if (res.code == 200) {
				this.$refs.table.refresh()
				this.$message.success("删除成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
		//批量删除
		async batch_del() {
			this.$confirm(`确定删除选中的 ${this.selection.length} 项吗？`, '提示', {
				type: 'warning',
				confirmButtonText: '删除',
				confirmButtonClass: 'el-button--danger'
			}).then(async () => {
				const loading = this.$loading()
				var ids = []
				this.selection.forEach(function (item) {
					ids.push(item.id)
				})
				var reqData = new FormData()
				reqData.append('ids', ids)
				var res = await this.$API.system.role.batchDelete.post(reqData)
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
		//搜索
		upsearch() {
			this.$refs.table.reload(this.search)
		},
		//本地更新数据
		handleSaveSuccess(data, mode) {
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
