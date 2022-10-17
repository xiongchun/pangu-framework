<template>
	<el-empty v-if="!form.id" description="请先选择左侧资源树节点..." :image-size="100"></el-empty>
	<template v-else>
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
				<div class="el-form-item-msg">按钮：可以是按钮或非按钮的请求资源；内链：在标签页内打开页面；外链：跳转到新页面打开页面</div>
			</el-form-item>
			<el-form-item label="资源别名" prop="resourceKey">
				<el-input v-model="form.resourceKey" placeholder="请输入资源别名" maxlength="20" show-word-limit clearable>
				</el-input>
				<div class="el-form-item-msg">当资源类型为菜单时别名应和视图组件名一致（页面缓存）；资源别名用于和前端或后端配合做权限控制</div>
			</el-form-item>
			<el-form-item label="上级资源" prop="parentId">
				<el-cascader v-model="form.parentId" :options="menuOptions" :props="menuProps" :validate-event="false"
					:show-all-levels="false" placeholder="顶级资源节点" filterable clearable style="width: 100%;">
				</el-cascader>
			</el-form-item>
			<el-form-item label="路由地址" prop="path" v-if="this.form.type !== 'button'">
				<el-input v-model="form.path" placeholder="请输入路由地址" maxlength="50" show-word-limit clearable>
				</el-input>
			</el-form-item>
			<el-form-item label="视图组件" prop="component" v-if="this.form.type == 'menu'">
				<el-input v-model="form.component" placeholder="请输入视图组件" maxlength="50" show-word-limit clearable>
					<template #prepend>views/</template>
					<template #append>.vue</template>
				</el-input>
				<div class="el-form-item-msg">如没有对应的视图组件不需要填写</div>
			</el-form-item>
			<el-form-item label="排序号" prop="sortNo" v-if="this.form.type !== 'button'">
				<el-input-number v-model="form.sortNo" :min="1" :max="9999" style="width: 100%;">
				</el-input-number>
			</el-form-item>
			<el-form-item label="资源图标" prop="icon" v-if="this.form.type !== 'button'">
				<sc-icon-select v-model="form.icon" clearable></sc-icon-select>
			</el-form-item>
			<el-form-item label="是否隐藏" prop="hidden" v-if="this.form.type !== 'button'">
				<el-checkbox v-model="form.hidden" true-label="1" false-label="0">隐藏菜单</el-checkbox>
				<div class="el-form-item-msg">不显示在导航中，但用户依然可以访问，例如详情页</div>
			</el-form-item>
			<el-form-item label="是否全屏" prop="fullpage" v-if="this.form.type !== 'button'">
				<el-checkbox v-model="form.fullpage" true-label="1" false-label="0">全屏路由</el-checkbox>
				<div class="el-form-item-msg">在最顶层以全屏模式打开</div>
			</el-form-item>
			<el-form-item label="是否固定" prop="affix" v-if="this.form.type !== 'button'">
				<el-checkbox v-model="form.affix" true-label="1" false-label="0">固定标签卡</el-checkbox>
				<div class="el-form-item-msg">标签卡打开后不能关闭</div>
			</el-form-item>
			<el-form-item label="背景颜色" prop="color" v-if="this.form.type !== 'button'">
				<el-color-picker v-model="form.color" :predefine="predefineColors"></el-color-picker>
				<div class="el-form-item-msg">快捷菜单入口对应方格的背景色</div>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" @click="save" :loading="loading">保 存</el-button>
			</el-form-item>
		</el-form>
	</template>
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
				color: "",
				apiList: []
			},
			menuProps: {
				value: 'id',
				label: 'title',
				emitPath: false,
				checkStrictly: true
			},
			predefineColors: [
				'#ff4500',
				'#ff8c00',
				'#ffd700',
				'#67C23A',
				'#00ced1',
				'#409EFF',
				'#c71585'
			],
			rules: {
				title: [
					{ required: true, message: '资源名称不能为空' }
				],
				resourceKey: [
					{ required: true, message: '资源别名不能为空' },
					{
						validator: (rule, value, callback) => {
							var params = { resourceKey: value, id: this.form.id }
							this.$API.system.resource.validateResourceKey.get(params).then(res => {
								if (res.data >= 1) {
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
