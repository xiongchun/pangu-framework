<template>
	<el-row :gutter="40">
		<el-col v-if="!form.id">
			<el-empty description="请选择左侧资源后操作" :image-size="100"></el-empty>
		</el-col>
		<template v-else>
			<el-col :lg="12">
				<h2>{{ form.title || "新增菜单" }}</h2>
				<el-form :model="form" :rules="rules" ref="dialogForm" label-width="80px" label-position="right">
					<el-form-item label="资源名称" prop="title">
						<el-input v-model="form.title" clearable placeholder="请输入资源名称"></el-input>
					</el-form-item>
					<el-form-item label="上级资源" prop="parentId">
						<el-cascader v-model="form.parentId" :options="menuOptions" :props="menuProps"
							:show-all-levels="false" placeholder="顶级菜单" disabled></el-cascader>
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
						<el-input v-model="form.resourceKey" clearable placeholder="请输入资源别名"></el-input>
						<div class="el-form-item-msg">当资源类型为菜单时别名应和视图组件名一致（页面缓存）</div>
					</el-form-item>
					<el-form-item label="路由地址" prop="path">
						<el-input v-model="form.path" clearable placeholder="请输入路由地址"></el-input>
					</el-form-item>
					<el-form-item label="视图组件" prop="component">
						<el-input v-model="form.component" clearable placeholder="请输入视图组件">
							<template #prepend>views/</template>
							<template #append>.vue</template>
						</el-input>
						<div class="el-form-item-msg">如没有对应的视图组件不需要填写</div>
					</el-form-item>
					<el-form-item label="菜单图标" prop="icon">
						<sc-icon-select v-model="form.icon" clearable></sc-icon-select>
					</el-form-item>
					<el-form-item label="是否隐藏" prop="hidden">
						<el-checkbox v-model="form.hidden">隐藏菜单</el-checkbox>
						<div class="el-form-item-msg">不显示在导航中，但用户依然可以访问，例如详情页</div>
					</el-form-item>
					<el-form-item label="是否全屏" prop="fullpage">
						<el-checkbox v-model="form.fullpage">全屏路由</el-checkbox>
						<div class="el-form-item-msg">在最顶层以全屏模式打开</div>
					</el-form-item>
					<el-form-item label="是否固定" prop="affix">
						<el-checkbox v-model="form.affix">固定标签卡</el-checkbox>
						<div class="el-form-item-msg">标签卡打开后不能关闭</div>
					</el-form-item>
					<el-form-item>
						<el-button type="primary" @click="save" :loading="loading">保 存</el-button>
					</el-form-item>
				</el-form>

			</el-col>
			<el-col :lg="12" class="apilist">

				<el-badge value="选填" class="item" type="info">
					<h2>API 接口</h2>
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
				hidden: 0,
				fullpage: 0,
				affix: 0,
				icon: "",
				apiList: []
			},
			menuProps: {
				value: 'id',
				label: 'title',
				checkStrictly: true
			},
			rules: {
				title: [
					{ required: true, message: '资源名称不能为空' }
				],
				resourceKey: [
					{ required: true, message: '资源别名不能为空' }
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
			this.$refs.dialogForm.validate(async (valid) => {
				if (!valid) {
					return false
				}
				this.loading = true
				var res;
				if (this.form.id > 0) {
					res = await this.$API.system.resource.add.post(this.form)
				} else{
					res = await this.$API.system.resource.update.post(this.form)
				}
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
