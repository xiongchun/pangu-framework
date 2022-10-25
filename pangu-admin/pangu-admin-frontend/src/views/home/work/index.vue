<template>
	<el-main>
		<el-row :gutter="15">
			<el-col :lg="24">
				<el-card shadow="never" header="我的常用">
					<myapp></myapp>
				</el-card>
			</el-col>
		</el-row>
	</el-main>
</template>

<script>
	import myapp from './components/myapp';

	export default {
		components: {
			myapp
		},
		data() {
			return {

			}
		},
		mounted(){
			this.$emit('on-mounted')
		},
		methods: {

		}
	}
</script>

<style scoped>

</style>
