<template>
	<el-container>
		<el-aside width="250px">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" prefix-icon="el-icon-Search" v-model="groupFilterText" clearable>
					</el-input>
				</el-header>
				<el-main class="nopadding" v-loading="showGrouploading">
					<el-tree :props="defaultTreeProps" ref="group" class="menu" node-key="id" :data="group"
						:highlight-current="true" :expand-on-click-node="false" :filter-node-method="groupFilterNode"
						@node-click="groupClick"></el-tree>
				</el-main>
				<!-- <el-footer>Left Footer</el-footer> -->
			</el-container>
		</el-aside>
		<el-aside width="335px">
			<el-container>
				<el-header>
					<div class="right-panel-search">
						<el-input v-model="search.name" style="width: 250px;" placeholder="输入姓名查询" clearable>
						</el-input>
						<el-button type="primary" icon="el-icon-search" @click="upsearch"></el-button>
					</div>
				</el-header>
				<!-- <el-alert title="待选人员列表" type="success"/> -->
				<el-main class="nopadding">
					<scTable ref="table" :apiObj="apiObj" :params="params" @selection-change="selectionChange"
						paginationLayout="total, prev, pager, next" stripe>
						<el-table-column type="selection" width="50"></el-table-column>
						<el-table-column label="头像" width="60">
							<template #default="scope">
								<el-tooltip class="box-item" effect="light" :content="scope.row.userName"
									placement="top-start">
									<el-avatar :src="scope.row.avatar" size="small"></el-avatar>
								</el-tooltip>
							</template>
						</el-table-column>
						<el-table-column label="姓名@部门" prop="name" show-overflow-tooltip>
							<template #default="scope">
								<span class="__user">{{ scope.row.name }}</span><span>@{{ scope.row.deptName }}</span>
							</template>
						</el-table-column>
					</scTable>
				</el-main>
			</el-container>
		</el-aside>
		<el-aside width="80px">
			<el-container>
				<el-header></el-header>
				<el-main class="__buttons">
					<el-space direction="vertical">
						<!-- <el-popconfirm title="确定保存选中人员的授权信息？" confirm-button-type="danger" placement="top"
							confirm-button-text="确定" @confirm="submit">
							<template #reference>
								<el-button type="primary" icon="el-icon-DArrowRight" :loading="isSaveing" :disabled="selection.length == 0"></el-button>
							</template>
						</el-popconfirm> -->
						<el-button type="primary" @click="submit" plain icon="el-icon-DArrowRight" :loading="isSaveing" :disabled="selection.length == 0"></el-button>
						<!-- <el-popconfirm title="确定撤销选中人员的授权信息？" confirm-button-type="danger" confirm-button-text="确定"
							@confirm="cancel">
							<template #reference>
								<el-button type="danger" plain icon="el-icon-DArrowLeft" :loading="isSaveing2" :disabled="selection2.length == 0"></el-button>
							</template>
						</el-popconfirm> -->
						<el-button type="danger" @click="cancel" plain icon="el-icon-DArrowLeft" :loading="isSaveing2" :disabled="selection2.length == 0"></el-button>
					</el-space>
				</el-main>
				<el-footer></el-footer>
			</el-container>
		</el-aside>
		<el-aside width="335px">
			<el-container>
				<el-header>
					<el-input placeholder="输入关键字进行过滤" v-model="table2FilterText" prefix-icon="el-icon-Search" clearable>
					</el-input>
				</el-header>
				<!-- <el-alert title="已选人员列表" type="warning"/> -->
				<el-main class="nopadding" v-loading="showTable2loading">
					<scTable ref="table2" :data="data2" @selection-change="selectionChange2" paginationLayout="total"
						hideDo stripe>
						<el-table-column type="selection" width="50"></el-table-column>
						<el-table-column label="头像" width="60">
							<template #default="scope">
								<el-tooltip class="box-item" effect="light" :content="scope.row.userName"
									placement="top-start">
									<el-avatar :src="scope.row.avatar" size="small"></el-avatar>
								</el-tooltip>
							</template>
						</el-table-column>
						<el-table-column label="姓名@部门" prop="name" show-overflow-tooltip>
							<template #default="scope">
								<span class="__user">{{ scope.row.name }}</span><span>@{{ scope.row.deptName }}</span>
							</template>
						</el-table-column>
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
			showGrouploading: false,
			showTable2loading: false,
			groupFilterText: '',
			table2FilterText:'',
			group: [],
			selection: [],
			selection2: [],
			defaultTreeProps: {
				label: 'name'
			},
			search: {
				name: ""
			},
			params: {
				// -1 特殊值解决 apiobj 动态传参的bug open()函数赋值滞后
				roleId: this.$TOOL.session.get("TEMP_ROLE_ID")
			},
			apiObj: this.$API.system.role.listUnGrantedUsersByRoleId,
			data2: [],
			data2_copy: [],
			//验证规则
			rules: {
			}
		}
	},
	created() {
		this.getGroup()
	},
	watch: {
		groupFilterText(val) {
			this.$refs.group.filter(val);
		},
		table2FilterText(val){
			let filtered = this.data2_copy.filter(item=>{
				return item.name.indexOf(val) !== -1;
			});
			this.data2 = filtered
		}
	},
	methods: {
		//显示
		open() {
			this.loadTable2Data()
			return this
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
			this.$refs.table.upData(params)
		},
		//搜索
		upsearch() {
			this.$refs.table.upData(this.search)
		},
		//表格选择后回调事件
		selectionChange(selection) {
			this.selection = selection;
		},
		//表格选择后回调事件
		selectionChange2(selection) {
			this.selection2 = selection;
		},
		//加载表格2数据
		async loadTable2Data() {
			this.showTable2loading = true
			await this.$API.system.role.listGrantedUsersByRoleId.get(this.params).then(res => {
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
			var ids = []
			this.selection.forEach(function (item) {
				ids.push(item.id)
			})
			var reqData = new FormData()
			reqData.append('ids', ids)
			reqData.append('roleId', this.params.roleId)
			var res = await this.$API.system.role.grantUser.post(reqData);
			this.isSaveing = false;
			if (res.code == 200) {
				this.loadTable2Data()
				this.$refs.table.refresh()
				this.$message.success("人员授权成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
		//取消授权方法
		async cancel() {
			this.isSaveing2 = true;
			let ids = this.selection2.map(item => {return item.id})
			console.log(ids)
			var reqData = new FormData()
			reqData.append('ids', ids)
			reqData.append('roleId', this.params.roleId)
			var res = await this.$API.system.role.cancelUser.post(reqData);
			this.isSaveing2 = false;
			if (res.code == 200) {
				this.loadTable2Data()
				this.$refs.table.refresh()
				this.$message.success("撤销人员授权成功")
			} else {
				this.$alert(res.message, "提示", { type: 'error' })
			}
		},
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
