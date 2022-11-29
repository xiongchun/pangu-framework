<template>
	<el-container>
		<el-aside width="280px">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" v-model="tableFilterText" prefix-icon="el-icon-Search" clearable>
					</el-input>
				</el-header>
				<!-- <el-alert title="待选人员列表" type="success"/> -->
				<el-main class="nopadding" v-loading="showTableloading">
					<scTable ref="table" :data="data" @selection-change="selectionChange" paginationLayout="total"
						hideDo stripe>
						<el-table-column type="selection" width="50"></el-table-column>
						<!-- <el-table-column label="ID" prop="id" width="80" sortable /> -->
						<el-table-column label="待选角色列表" prop="name" show-overflow-tooltip />
					</scTable>
				</el-main>
			</el-container>
		</el-aside>
		<el-aside width="80px">
			<el-container>
				<el-header></el-header>
				<el-main class="__buttons">
					<el-space direction="vertical">
						<el-button type="primary" @click="submit" plain icon="el-icon-DArrowRight" :loading="isSaveing"
							:disabled="selection.length == 0"></el-button>
						<el-button type="danger" @click="cancel" plain icon="el-icon-DArrowLeft" :loading="isSaveing2"
							:disabled="selection2.length == 0"></el-button>
					</el-space>
				</el-main>
				<el-footer></el-footer>
			</el-container>
		</el-aside>
		<el-aside width="280px">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" v-model="table2FilterText" prefix-icon="el-icon-Search" clearable>
					</el-input>
				</el-header>
				<!-- <el-alert title="已选人员列表" type="warning"/> -->
				<el-main class="nopadding" v-loading="showTable2loading">
					<scTable ref="table2" :data="data2" @selection-change="selectionChange2" paginationLayout="total"
						hideDo stripe>
						<el-table-column type="selection" width="50" />
						<!-- <el-table-column label="ID" prop="id" width="80" sortable /> -->
						<el-table-column label="已选角色列表" prop="name" show-overflow-tooltip />
					</scTable>
				</el-main>
			</el-container>
		</el-aside>
	</el-container>
</template>

<script>

export default {
	data() {
		return {
			isSaveing: false,
			isSaveing2: false,
			showTableloading: false,
			showTable2loading: false,
			tableFilterText: '',
			table2FilterText: '',
			selection: [],
			selection2: [],
			params: {
				userId: null
			},
			data: [],
			data_copy: [],
			data2: [],
			data2_copy: [],
			//验证规则
			rules: {
			}
		}
	},
	created() {
	},
	watch: {
		table2FilterText(val) {
			let filtered = this.data2_copy.filter(item => {
				return item.name.indexOf(val) !== -1;
			});
			this.data2 = filtered
		},
		tableFilterText(val) {
			let filtered = this.data_copy.filter(item => {
				return item.name.indexOf(val) !== -1;
			});
			this.data = filtered
		}
	},
	methods: {
		//显示
		open(row) {
			this.params.userId = row.id
			this.loadTableData()
			this.loadTable2Data()
			return this
		},
		//表格选择后回调事件
		selectionChange(selection) {
			this.selection = selection;
		},
		//表格选择后回调事件
		selectionChange2(selection) {
			this.selection2 = selection;
		},
		//加载表格1数据
		async loadTableData() {
			this.showTableloading = true
			await this.$API.system.user.queryGrantRolesByUserId.get(this.params).then(res => {
				this.showTableloading = false
				if (res.code == 200) {
					this.data = res.data
					this.data_copy = res.data
				}
			})
		},
		//加载表格2数据
		async loadTable2Data() {
			this.showTable2loading = true
			await this.$API.system.user.queryRolesByUserId.get(this.params).then(res => {
				this.showTable2loading = false
				if (res.code == 200) {
					this.data2 = res.data
					this.data2_copy = res.data
				}
			})
		},
		//授权方法
		async submit() {
			this.isSaveing = true;
			let roleIds = this.selection.map(item => { return item.id })
			var reqData = new FormData()
			reqData.append('roleIds', roleIds)
			reqData.append('userId', this.params.userId)
			var res = await this.$API.system.user.grantSelectRole.post(reqData);
			this.isSaveing = false;
			if (res.code == 200) {
				this.loadTableData()
				this.loadTable2Data()
				this.$message.success("选择角色授权成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
		//取消授权方法
		async cancel() {
			this.isSaveing2 = true;
			let roleIds = this.selection2.map(item => { return item.id })
			var reqData = new FormData()
			reqData.append('roleIds', roleIds)
			reqData.append('userId', this.params.userId)
			var res = await this.$API.system.user.cancelRole.post(reqData);
			this.isSaveing2 = false;
			if (res.code == 200) {
				this.loadTableData()
				this.loadTable2Data()
				this.$message.success("撤销角色授权成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		}
	}
}
</script>

<style>
.__user {
	color: #337ecc;
}

.__buttons {
	display: flex;
	align-items: center;
	overflow: hidden;
}
</style>
