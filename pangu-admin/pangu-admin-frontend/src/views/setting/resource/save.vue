<template>
	<el-row :gutter="40">
		<el-col v-if="!form.id">
			<el-empty description="请先选择左侧资源树节点..." :image-size="100"></el-empty>
		</el-col>
		<template v-else>
			<el-col :lg="12">
				<h2>编辑资源</h2>
				<el-form :model="form" :rules="rules" ref="dialogForm" label-width="80px" label-position="right">
					<el-form-item label="资源名称" prop="title">
						<el-input v-model="form.title" placeholder="请输入资源名称" maxlength="20" show-word-limit clearable>
						</el-input>
					</el-form-item>
					<el-form-item label="资源类型" prop="type">
						<el-radio-group v-model="form.type">
							<el-radio-button label="menu">菜单</el-radio-button>
							<el-radio-button label="button">按钮</el-radio-button>
							<el-radio-button label="iframe">内链</el-radio-button>
							<el-radio-button label="link">外链</el-radio-button>
						</el-radio-group>
						<div class="el-form-item-msg">内链：在标签页内打开；外链：跳转到新页面打开</div>
					</el-form-item>
					<el-form-item label="资源别名" prop="resourceKey">
						<el-input v-model="form.resourceKey" placeholder="请输入资源别名" maxlength="20" show-word-limit
							clearable></el-input>
						<div class="el-form-item-msg">当资源类型为菜单时别名应和视图组件名一致（页面缓存）</div>
					</el-form-item>
					<el-form-item label="上级资源" prop="parentId">
						<el-cascader v-model="form.parentId" :options="menuOptions" :props="menuProps"
							:validate-event="false" :show-all-levels="false" placeholder="顶级资源节点" filterable clearable
							style="width: 100%;"></el-cascader>
					</el-form-item>
					<el-form-item label="路由地址" prop="path">
						<el-input v-model="form.path" placeholder="请输入路由地址" maxlength="50" show-word-limit clearable>
						</el-input>
					</el-form-item>
					<el-form-item label="视图组件" prop="component">
						<el-input v-model="form.component" placeholder="请输入视图组件" maxlength="50" show-word-limit clearable>
							<template #prepend>views/</template>
							<!-- <template #append>.vue</template> -->
						</el-input>
						<div class="el-form-item-msg">如没有对应的视图组件不需要填写</div>
					</el-form-item>
					<el-form-item label="排序号" prop="sortNo">
						<el-input-number v-model="form.sortNo" :min="1" :max="9999" style="width: 100%;">
						</el-input-number>
					</el-form-item>
					<el-form-item label="菜单图标" prop="icon">
						<sc-icon-select v-model="form.icon" clearable></sc-icon-select>
					</el-form-item>
					<el-form-item label="是否隐藏" prop="hidden">
						<el-checkbox v-model="form.hidden" true-label="1" false-label="0">隐藏菜单</el-checkbox>
						<div class="el-form-item-msg">不显示在导航中，但用户依然可以访问，例如详情页</div>
					</el-form-item>
					<el-form-item label="是否全屏" prop="fullpage">
						<el-checkbox v-model="form.fullpage" true-label="1" false-label="0">全屏路由</el-checkbox>
						<div class="el-form-item-msg">在最顶层以全屏模式打开</div>
					</el-form-item>
					<el-form-item label="是否固定" prop="affix">
						<el-checkbox v-model="form.affix" true-label="1" false-label="0">固定标签卡</el-checkbox>
						<div class="el-form-item-msg">标签卡打开后不能关闭</div>
					</el-form-item>
					<el-form-item>
						<el-button type="primary" @click="save" :loading="loading">保 存</el-button>
					</el-form-item>
				</el-form>
			</el-col>
			<el-col :lg="12" class="apilist">

				<el-badge value="选填" class="item" type="info">
					<h2>绑定 API 接口</h2>
				</el-badge>
				<sc-form-table v-model="form.apiList" :addTemplate="apiListAddTemplate" placeholder="暂无受控的 API 接口">
					<el-table-column prop="key" label="接口标识" width="150px">
						<template #default="scope">
							<el-input v-model="scope.row.key" placeholder="请输入接口标识"></el-input>
						</template>
					</el-table-column>
					<el-table-column prop="url" label="接口地址">
						<template #default="scope">
							<el-input v-model="scope.row.url" placeholder="请输入接口地址"></el-input>
						</template>
					</el-table-column>
				</sc-form-table>
				<el-alert class="alert" type="info"
					description="当需要对 API 接口进行细粒度的权限控制时可以将接口和菜单（或按钮）资源绑定，以供后端权限组件对其进行精细的权限控制。" :closable="false" />
			</el-col>
		</template>
	</el-row>
</template>

<script>
import scIconSelect from '@/components/scIconSelect'

export default {
	components: {
		scIconSelect
	},
	props: {
		//由index组件传值过来
		menuOptions: { type: Object, default: () => { } },
	},
	data() {
		return {
			form: {
				id: "",
				title: "",
				parentId: "",
				type: "menu",
				resourceKey: "",
				path: "",
				component: "",
				hidden: "0",
				fullpage: "0",
				affix: "0",
				icon: "",
				sortNo: 1,
				apiList: []
			},
			menuProps: {
				value: 'id',
				label: 'title',
				emitPath: false,
				checkStrictly: true
			},
			rules: {
				title: [
					{ required: true, message: '资源名称不能为空' }
				],
				resourceKey: [
					{ required: true, message: '资源别名不能为空' },
					{
						validator: (rule, value, callback) => {
							var params = { resourceKey: value , id: this.form.id}
							this.$API.system.resource.validateResourceKey.get(params).then(res => {
								if (res.data >= 1 ) {
								   return callback(new Error('资源别名 ' + value + ' 已存在, 请修改'))
								}
								callback()
							})
						},
						trigger: 'blur'
					}
				],
				type: [
					{ required: true, message: '资源类型不能为空' }
				]
			},
			apiListAddTemplate: {
				key: "",
				url: ""
			},
			loading: false
		}
	},
	mounted() {

	},
	methods: {
		//保存
		async save() {
			console.log(this.$refs.menu)
			this.$refs.dialogForm.validate(async (valid) => {
				if (!valid) {
					return false
				}
				this.loading = true
				var res = await this.$API.system.resource.update.post(this.form)
				this.loading = false;
				if (res.code == 200) {
					this.$emit('success', this.form, this.mode)
					this.$message.success("操作成功")
				} else {
					this.$alert(res.message, "提示", { type: 'error' })
				}
			})
		},
		//表单注入数据
		setData(data) {
			this.form = data
			this.form.apiList = data.apiList || []
		}
	}
}
</script>

<style scoped>
h2 {
	font-size: 17px;
	color: #3c4a54;
	padding: 0 0 30px 0;
}

.apilist {
	border-left: 1px solid #eee;
}

[data-theme="dark"] h2 {
	color: #fff;
}

[data-theme="dark"] .apilist {
	border-color: #434343;
}

.alert {
	margin-top: 15px;
}
</style>
