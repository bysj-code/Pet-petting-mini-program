import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},


	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },


	// 论坛路由
	{
		path: '/forum/table',
		name: 'forum_table',
		component: () => import('../views/forum/table.vue'),
		meta: {
			index: 0,
			title: '论坛列表'
		}
	},
	{
		path: '/forum/view',
		name: 'forum_view',
		component: () => import('../views/forum/view.vue'),
		meta: {
			index: 0,
			title: '论坛详情'
		}
	},

	// 论坛分类路由
	{
		path: '/forum_type/table',
		name: 'forum_type_table',
		component: () => import('../views/forum_type/table.vue'),
		meta: {
			index: 0,
			title: '论坛分类列表'
		}
	},
	{
		path: '/forum_type/view',
		name: 'forum_type_view',
		component: () => import('../views/forum_type/view.vue'),
		meta: {
			index: 0,
			title: '论坛分类详情'
		}
	},

	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '通知公告列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '通知公告详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 普通用户路由
	{
		path: '/ordinary_users/table',
		name: 'ordinary_users_table',
		component: () => import('../views/ordinary_users/table.vue'),
		meta: {
			index: 0,
			title: '普通用户列表'
		}
	},
	{
		path: '/ordinary_users/view',
		name: 'ordinary_users_view',
		component: () => import('../views/ordinary_users/view.vue'),
		meta: {
			index: 0,
			title: '普通用户详情'
		}
	},
	// 宠物类型路由
	{
		path: '/type_of_pet/table',
		name: 'type_of_pet_table',
		component: () => import('../views/type_of_pet/table.vue'),
		meta: {
			index: 0,
			title: '宠物类型列表'
		}
	},
	{
		path: '/type_of_pet/view',
		name: 'type_of_pet_view',
		component: () => import('../views/type_of_pet/view.vue'),
		meta: {
			index: 0,
			title: '宠物类型详情'
		}
	},
	// 宠物信息路由
	{
		path: '/pet_information/table',
		name: 'pet_information_table',
		component: () => import('../views/pet_information/table.vue'),
		meta: {
			index: 0,
			title: '宠物信息列表'
		}
	},
	{
		path: '/pet_information/view',
		name: 'pet_information_view',
		component: () => import('../views/pet_information/view.vue'),
		meta: {
			index: 0,
			title: '宠物信息详情'
		}
	},
	// 领养信息路由
	{
		path: '/adoption_information/table',
		name: 'adoption_information_table',
		component: () => import('../views/adoption_information/table.vue'),
		meta: {
			index: 0,
			title: '领养信息列表'
		}
	},
	{
		path: '/adoption_information/view',
		name: 'adoption_information_view',
		component: () => import('../views/adoption_information/view.vue'),
		meta: {
			index: 0,
			title: '领养信息详情'
		}
	},
	// 救助基地路由
	{
		path: '/rescue_base/table',
		name: 'rescue_base_table',
		component: () => import('../views/rescue_base/table.vue'),
		meta: {
			index: 0,
			title: '救助基地列表'
		}
	},
	{
		path: '/rescue_base/view',
		name: 'rescue_base_view',
		component: () => import('../views/rescue_base/view.vue'),
		meta: {
			index: 0,
			title: '救助基地详情'
		}
	},
	// 捐助信息路由
	{
		path: '/donation_information/table',
		name: 'donation_information_table',
		component: () => import('../views/donation_information/table.vue'),
		meta: {
			index: 0,
			title: '捐助信息列表'
		}
	},
	{
		path: '/donation_information/view',
		name: 'donation_information_view',
		component: () => import('../views/donation_information/view.vue'),
		meta: {
			index: 0,
			title: '捐助信息详情'
		}
	},
	// 留言反馈路由
	{
		path: '/message_feedback/table',
		name: 'message_feedback_table',
		component: () => import('../views/message_feedback/table.vue'),
		meta: {
			index: 0,
			title: '留言反馈列表'
		}
	},
	{
		path: '/message_feedback/view',
		name: 'message_feedback_view',
		component: () => import('../views/message_feedback/view.vue'),
		meta: {
			index: 0,
			title: '留言反馈详情'
		}
	},
	// 消息通知路由
	{
		path: '/message_notification/table',
		name: 'message_notification_table',
		component: () => import('../views/message_notification/table.vue'),
		meta: {
			index: 0,
			title: '消息通知列表'
		}
	},
	{
		path: '/message_notification/view',
		name: 'message_notification_view',
		component: () => import('../views/message_notification/view.vue'),
		meta: {
			index: 0,
			title: '消息通知详情'
		}
	},
	// 宠物日常路由
	{
		path: '/pet_daily/table',
		name: 'pet_daily_table',
		component: () => import('../views/pet_daily/table.vue'),
		meta: {
			index: 0,
			title: '宠物日常列表'
		}
	},
	{
		path: '/pet_daily/view',
		name: 'pet_daily_view',
		component: () => import('../views/pet_daily/view.vue'),
		meta: {
			index: 0,
			title: '宠物日常详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "Petting pets(爱抚宠物)-admin";
	document.title = title;
})

export default router
