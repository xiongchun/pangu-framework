<template>
	<el-main>
		<el-row :gutter="15">
			<el-col :lg="24">
				<el-card shadow="never" header="我的常用">
					<myapp></myapp>
				</el-card>
			</el-col>
		</el-row>
		<el-row :gutter="15">
			<el-col :lg="8">
				<el-card>
					<iframe src="//player.bilibili.com/player.html?aid=923342303&bvid=BV1CT4y1H7f4&cid=1393296852&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
				</el-card>
			</el-col>
			<el-col :lg="8">
				<el-card>
					<iframe src="//player.bilibili.com/player.html?aid=1250142618&bvid=BV1CJ4m1b7nc&cid=1424796961&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
				</el-card>
			</el-col>
			<el-col :lg="8">
				<el-card>
					<iframe src="//player.bilibili.com/player.html?aid=966650840&bvid=BV1yW4y1F7u8&cid=1415936500&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
				</el-card>
			</el-col>
		</el-row>
		<el-row :gutter="15">
			<el-col :lg="8">
				<el-card>
					<iframe src="//player.bilibili.com/player.html?aid=1050235218&bvid=BV1RH4y1a7nN&cid=1429016598&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
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
