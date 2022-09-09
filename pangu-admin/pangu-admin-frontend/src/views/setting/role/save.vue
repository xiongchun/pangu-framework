<template>
	<el-dialog :title="titleMap[mode]" v-model="visible" :width="500" destroy-on-close @closed="$emit('closed')">
		<el-form :model="form" :rules="rules" :disabled="mode == 'show'" ref="dialogForm" label-width="100px"
			label-position="left">
			<el-form-item label="角色名称" prop="name">
				<el-input v-model="form.name" clearable></el-input>
			</el-form-item>
			<el-form-item label="角色标识" prop="key">
				<el-input v-model="form.key" clearable></el-input>
			</el-form-item>
			<el-form-item label="角色类型" prop="type">
				<el-select v-model="form.type" class="m-2" placeholder="Select" style="width: 100%;">
					<el-option v-for="item in typeItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="角色状态" prop="status">
				<el-select v-model="form.status" class="m-2" placeholder="Select" style="width: 100%;">
					<el-option v-for="item in statusItems" :key="item.value" :label="item.label" :value="item.value" />
				</el-select>
			</el-form-item>
			<el-form-item label="扩展码" prop="bizCode">
				<el-input v-model="form.bizCode" placeholder="请输入业务扩展码" clearable></el-input>
			</el-form-item>
			<el-form-item label="备注" prop="remark">
				<el-input v-model="form.remark" clearable type="textarea"></el-input>
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
				add: '新增角色',
				edit: '编辑角色',
				show: '查看角色'
			},
			visible: false,
			isSaveing: false,
			//表单数据
			form: {
				id: "",
				name: "",
				key: "",
				status: '1',
				type: '1',
				bizCode: "",
				remark: ""
			},
			//验证规则
			rules: {
				status: [
					{ required: true, message: '角色状态不能为空' }
				],
				type: [
					{ required: true, message: '角色类型不能为空' }
				],
				name: [
					{ required: true, message: '角色名称不能为空' }
				],
				key: [
					{ required: true, message: '角色标识不能为空' }
				]
			},
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
		}
	},
	mounted() {

	},
	methods: {
		//显示
		open(mode = 'add') {
			this.mode = mode;
			this.visible = true;
			return this
		},
		//表单提交方法
		submit() {
			this.$refs.dialogForm.validate(async (valid) => {
				if (valid) {
					this.isSaveing = true;
					var res = await this.$API.demo.post.post(this.form);
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
			this.form.id = data.id
			this.form.label = data.label
			this.form.alias = data.alias
			this.form.sort = data.sort
			this.form.status = data.status
			this.form.remark = data.remark

			//可以和上面一样单个注入，也可以像下面一样直接合并进去
			//Object.assign(this.form, data)
		}
	}
}
</script>

<style>
</style>
