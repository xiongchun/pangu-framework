<template>
	<el-form ref="form" label-width="90px">
		<el-form-item label="黑夜模式">
			<el-switch v-model="config.dark" inline-prompt active-icon="el-icon-moon" inactive-icon="el-icon-sunny">
			</el-switch>
			<div class="el-form-item-msg">黑夜模式打开适合光线较弱的环境</div>
		</el-form-item>
		<el-form-item label="主题颜色">
			<el-color-picker v-model="config.colorPrimary" :predefine="colorList">></el-color-picker>
			<div class="el-form-item-msg">使用主题色重新渲染界面元素的色彩视觉效果</div>
		</el-form-item>
		<el-form-item label="标签栏">
			<el-switch v-model="config.layoutTags" inline-prompt></el-switch>
			<div class="el-form-item-msg">支持同时打开多个卡片，关闭标签栏则为单页模式</div>
		</el-form-item>
		<el-form-item label="框架布局">
			<el-select v-model="config.layout" placeholder="请选择">
				<el-option label="现代风格" value="default"></el-option>
				<el-option label="经典风格" value="header"></el-option>
				<el-option label="传统风格" value="menu"></el-option>
				<el-option label="怀旧风格" value="dock"></el-option>
			</el-select>
			<div class="el-form-item-msg">推荐使用缺省布局，此选项仅做布局功能展示</div>
		</el-form-item>
	</el-form>
</template>

<script>
import colorTool from '@/utils/color'

export default {
	data() {
		return {
			colorList: ['#409EFF', '#009688', '#536dfe', '#ff5c93', '#c62f2f', '#fd726d'],
			config: {
				dark: this.$TOOL.data.get('APP_DARK') || false,
				colorPrimary: this.$TOOL.data.get('APP_COLOR') || this.$CONFIG.COLOR || '#409EFF',
				layoutTags: this.$store.state.global.layoutTags,
				layout: this.$store.state.global.layout
			}
		}
	},
	created() {

	},
	watch: {
		'config.dark'(val) {
			if (val) {
				document.documentElement.classList.add("dark")
				this.$TOOL.data.set("APP_DARK", val)
			} else {
				document.documentElement.classList.remove("dark")
				this.$TOOL.data.remove("APP_DARK")
			}
		},
		'config.layout'(val) {
			this.$store.commit("SET_layout", val)
		},
		'config.layoutTags'() {
			this.$store.commit("TOGGLE_layoutTags")
		},
		'config.colorPrimary'(val) {
			document.documentElement.style.setProperty('--el-color-primary', val);
			for (let i = 1; i <= 9; i++) {
				document.documentElement.style.setProperty(`--el-color-primary-light-${i}`, colorTool.lighten(val, i / 10));
			}
			for (let i = 1; i <= 9; i++) {
				document.documentElement.style.setProperty(`--el-color-primary-dark-${i}`, colorTool.darken(val, i / 10));
			}
			this.$TOOL.data.set("APP_COLOR", val);
		}
	}
}
</script>

<style>

</style>
