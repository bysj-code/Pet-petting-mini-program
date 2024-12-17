import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';

Vue.use(VueRouter)

const routes = [
	// 主页ss
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
	// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},
	// 音乐
	{
		path: '/media/music',
		name: 'media_music',
		component: () => import('../views/media/music.vue')
	},
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 文章路由
	{
		path: '/article/list',
		name: 'article_list',
		component: () => import('../views/article/list.vue')
	},
	{
		path: '/article/details',
		name: 'article_details',
		component: () => import('../views/article/details.vue')
	},
	// 浏览网站
	// 收藏路由
	{
		path: '/user/collect',
		name: 'collect_list',
		component: () => import('../views/user/collect.vue')
	},

	// 论坛路由
	{
		path: '/forum/list',
		name: 'forum_list',
		component: () => import('../views/forum/list.vue')
	},

	{
		path: '/forum/details',
		name: 'forum_details',
		component: () => import('../views/forum/details.vue')
	},

	{
		path: '/forum/view',
		name: 'forum_view',
		component: () => import('../views/forum/view.vue')
	},





	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},

	
	
		
	
		
		// 宠物信息列表路由
	{
		path: '/pet_information/list',
		name: '/pet_information_list',
		component: () => import('../views/pet_information/list.vue')
	},
	
		// 宠物信息详情路由
	{
		path: '/pet_information/details',
		name: '/pet_information_details',
		component: () => import('../views/pet_information/details.vue')
	},
			// 领养信息添加路由
	{
		path: '/adoption_information/edit',
		name: '/adoption_information_edit',
		component: () => import('../views/adoption_information/edit.vue')
	},
	
	
		
		// 救助基地列表路由
	{
		path: '/rescue_base/list',
		name: '/rescue_base_list',
		component: () => import('../views/rescue_base/list.vue')
	},
	
		// 救助基地详情路由
	{
		path: '/rescue_base/details',
		name: '/rescue_base_details',
		component: () => import('../views/rescue_base/details.vue')
	},
			// 捐助信息添加路由
	{
		path: '/donation_information/edit',
		name: '/donation_information_edit',
		component: () => import('../views/donation_information/edit.vue')
	},
	
	
			// 留言反馈添加路由
	{
		path: '/message_feedback/edit',
		name: '/message_feedback_edit',
		component: () => import('../views/message_feedback/edit.vue')
	},
	
	
		
	
		
	
	
	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "Petting pets(爱抚宠物)-home";
	document.title = title;
	document.logo = "Petting pets(爱抚宠物)"
})

export default router
