import config from "@/config"
import http from "@/utils/request"

export default {
	home: {
		login: {
			url: `${config.API_URL}/system/home/login`,
			name: "登录获取TOKEN",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		logout: {
			url: `${config.API_URL}/system/home/logout`,
			name: "登出",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		}
	},
	resource: {
		list: {
			url: `${config.API_URL}/system/resource/list`,
			name: "登录用户获取资源菜单和权限列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		listForManage: {
			url: `${config.API_URL}/system/resource/listForManage`,
			name: "获取资源菜单(管理模块)",
			get: async function () {
				return await http.get(this.url);
			}
		},
		listForGrant: {
			url: `${config.API_URL}/system/resource/listForGrant`,
			name: "获取资源菜单(角色授权模块)",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		add: {
			url: `${config.API_URL}/system/resource/add`,
			name: "新增资源",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		update: {
			url: `${config.API_URL}/system/resource/update`,
			name: "修改资源",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		validateResourceKey: {
			name: "校验资源别名唯一性",
			url: `${config.API_URL}/system/resource/validateResourceKey`,
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		batchDelete: {
			url: `${config.API_URL}/system/resource/batchDelete`,
			name: "批量删除资源",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
	},
	dic: {
		tree: {
			url: `${config.API_URL}/system/dic/tree`,
			name: "获取字典树",
			get: async function () {
				return await http.get(this.url);
			}
		},
		list: {
			url: `${config.API_URL}/system/dic/list`,
			name: "字典明细",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		get: {
			url: `${config.API_URL}/system/dic/get`,
			name: "获取字典数据",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		}
	},
	role: {
		list: {
			url: `${config.API_URL}/system/role/list`,
			name: "获取角色列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		add: {
			url: `${config.API_URL}/system/role/add`,
			name: "新增角色",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		update: {
			url: `${config.API_URL}/system/role/update`,
			name: "修改角色",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		delete: {
			url: `${config.API_URL}/system/role/delete`,
			name: "删除角色",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		batchDelete: {
			url: `${config.API_URL}/system/role/batchDelete`,
			name: "批量删除角色",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		validateRoleKey: {
			name: "校验角色标识唯一性",
			url: `${config.API_URL}/system/role/validateRoleKey`,
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		grant: {
			url: `${config.API_URL}/system/role/grant`,
			name: "角色授权",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		}
	},
	dept: {
		list: {
			url: `${config.API_URL}/system/dept/list`,
			name: "获取部门列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		add: {
			url: `${config.API_URL}/system/dept/add`,
			name: "新增部门",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		update: {
			url: `${config.API_URL}/system/dept/update`,
			name: "修改部门",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		delete: {
			url: `${config.API_URL}/system/dept/delete`,
			name: "删除部门",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		batchDelete: {
			url: `${config.API_URL}/system/dept/batchDelete`,
			name: "批量删除部门",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		}
	},
	user: {
		list: {
			url: `${config.API_URL}/system/user/list`,
			name: "获取用户列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		add: {
			url: `${config.API_URL}/system/user/add`,
			name: "新增用户",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		update: {
			url: `${config.API_URL}/system/user/update`,
			name: "修改用户",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		delete: {
			url: `${config.API_URL}/system/user/delete`,
			name: "删除用户",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		batchDelete: {
			url: `${config.API_URL}/system/user/batchDelete`,
			name: "批量删除用户",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		},
		validateUserName: {
			url: `${config.API_URL}/system/user/validateUserName`,
			name: "校验登录账号",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		queryRolesByUserId: {
			url: `${config.API_URL}/system/user/queryRolesByUserId`,
			name: "查询用户已分配角色",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		queryUserDetailInfoById: {
			url: `${config.API_URL}/system/user/queryUserDetailInfoById`,
			name: "查询用户详细信息",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		resetPassword: {
			url: `${config.API_URL}/system/user/resetPassword`,
			name: "重置用户密码",
			post: async function (params) {
				return await http.post(this.url, params);
			}
		}
	},
	app: {
		list: {
			url: `${config.API_URL}/system/app/list`,
			name: "应用列表",
			get: async function () {
				return await http.get(this.url);
			}
		}
	},
	log: {
		list: {
			url: `${config.API_URL}/system/log/list`,
			name: "日志列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		}
	},
	table: {
		list: {
			url: `${config.API_URL}/system/table/list`,
			name: "表格列管理列表",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		},
		info: {
			url: `${config.API_URL}/system/table/info`,
			name: "表格列管理详情",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		}
	},
	tasks: {
		list: {
			url: `${config.API_URL}/system/tasks/list`,
			name: "系统任务管理",
			get: async function (params) {
				return await http.get(this.url, params);
			}
		}
	}
}
