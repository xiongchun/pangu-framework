<template>
	<el-dialog :title="titleMap[mode]" v-model="visible" :width="500" destroy-on-close @closed="$emit('closed')">
		<el-form :model="form" :rules="rules" :disabled="mode == 'show'" ref="dialogForm" label-width="80px">
			<el-form-item label="上级部门" prop="parentId">
				<el-cascader v-model="form.parentId" :options="deptGroups" :props="deptGroupsProps" :show-all-levels="true"
					placeholder="顶级部门" clearable filterable style="width: 100%;"></el-cascader>
			</el-form-item>
			<el-form-item label="部门名称" prop="name">
				<el-input v-model="form.name" placeholder="请输入部门名称" clearable></el-input>
			</el-form-item>
			<el-form-item label="部门类型" prop="type">
				<el-select v-model="form.type" class="m-2" placeholder="请选择部门类型" style="width: 100%;">
					<el-option v-for="item in typeItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="部门状态" prop="status">
				<el-select v-model="form.status" class="m-2" placeholder="请选择部门状态" style="width: 100%;">
					<el-option v-for="item in statusItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="排序号" prop="sortNo">
				<el-input-number v-model="form.sortNo" :min="1" :max="9999" style="width: 100%;">
				</el-input-number>
			</el-form-item>
			<el-form-item label="扩展码" prop="bizCode">
				<el-input v-model="form.bizCode" placeholder="请输入业务扩展码" clearable></el-input>
			</el-form-item>
			<el-form-item label="备注" prop="remark">
				<el-input v-model="form.remark" placeholder="请输入备注" clearable type="textarea"></el-input>
			</el-form-item>
		</el-form>
		<template #footer>
			<el-button @click="visible = false">取 消</el-button>
			<el-button v-if="mode != 'show'" type="primary" :loading="isSaveing" @click="submit()">保 存</el-button>
		</template>
	</el-dialog>
</template>

<script>
export default {
	emits: ['success', 'closed'],
	data() {
		return {
			mode: "add",
			titleMap: {
				add: '新增部门',
				edit: '编辑部门',
				show: '查看部门信息'
			},
			visible: false,
			isSaveing: false,
			//表单数据
			form: {
				id: null,
				parentId: null,
				name: "",
				sortNo: 1,
				type: "1",
				status:"1",
				bizCode: "",
				remark: ""
			},
			//验证规则
			rules: {
				status: [
					{ required: true, message: '部门状态不能为空' }
				],
				type: [
					{ required: true, message: '部门类型不能为空' }
				],
				sortNo: [
					{ required: true, message: '排序号不能为空', trigger: 'change' }
				],
				name: [
					{ required: true, message: '部门名称不能为空' }
				]
			},
			//所需数据选项
			typeItems: [{
				value: '1',
				label: '缺省',
			}],
			statusItems: [{
				value: '1',
				label: '启用',
			},{
				value: '9',
				label: '停用',
			}],
			deptGroups: [],
			deptGroupsProps: {
				value: "id",
				label: "name",
				emitPath: false,
				checkStrictly: true
			}
		}
	},
	mounted() {
		this.getGroup()
	},
	methods: {
		//显示
		open(mode = 'add') {
			this.mode = mode;
			this.visible = true;
			return this
		},
		//加载树数据
		async getGroup() {
			var res = await this.$API.system.dept.list.get();
			this.deptGroups = res.data;
		},
		//表单提交方法
		submit() {
			this.$refs.dialogForm.validate(async (valid) => {
				if (valid) {
					this.isSaveing = true;
					var res;
					if(this.mode == 'add'){
						res = await this.$API.system.dept.add.post(this.form);
					}else if(this.mode == 'edit'){
						res = await this.$API.system.dept.update.post(this.form);
					}
					this.isSaveing = false;
					if (res.code == 200) {
						this.$emit('success', this.form, this.mode)
						this.visible = false;
						this.$message.success("操作成功")
					} else {
						this.$alert(res.message, "提示", { type: 'error' })
					}
				}
			})
		},
		//表单注入数据
		setData(data) {
			Object.assign(this.form, data)
		}
	}
}
</script>

<style>
</style>
