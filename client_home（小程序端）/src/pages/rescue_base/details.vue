<template>
	<view class="page_rescue_base diy_detail diy_detail--new" id="rescue_base_details">
		<view class="warp">
			<view class="container-fluid">
				<view class="row">
					<view v-if="$check_field('get','rescue_title')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>救助标题</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["rescue_title"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','title_no')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>标题编号</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["title_no"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','release_date')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>发布日期</span>
							</view>
								<view class="diy_field diy_date">
								<span>
									{{ $toTime(obj["release_date"],"yyyy-MM-dd") }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','cover_photo')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>封面图片</span>
							</view>
								<view class="diy_field diy_img">
								<img :src="$fullUrl(obj['cover_photo'])" />
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','application_user')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>申请用户</span>
							</view>
								<view class="diy_field diy_uid">
								{{ get_user_application_user(obj['application_user']) }}
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','user_name')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>用户姓名</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["user_name"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','animal_information')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>动物信息</span>
							</view>
								<view class="diy_field diy_desc">
								<span>
									{{ obj["animal_information"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','assistance_needs')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>救助需求</span>
							</view>
								<view class="diy_field diy_desc">
								<span>
									{{ obj["assistance_needs"] }}
								</span>
							</view>
							</view>
					</view>
				</view>
			</view>
			<view class="row">
	
	
					<view class="col-12 col-md-4 view">
					<span>点击数{{ obj["hits"] }}</span>
				</view>
				</view>
		</view>



		<!-- 评论区标题 -->
		<view class="bar_title comment_title">
			<view class="title">
				<navigator :url="bar_url">
					<text>
						{{ bar_title }}
					</text>
				</navigator>
			</view>
		</view>

		<!-- 评论区列表 -->
		<list_comment :list="list_comment"></list_comment>

		<view class="warp">
			<view class="container-fluid container-fluid-comment--new">
				<view class="row">
					<view class="col">
									<button type="button" class="btn btn-primary" v-if="$check_action('/donation_information/edit','add')" @click="to_form('/pages/donation_information/edit')">
							<span>捐助</span>
						</button>
			
<!--						<button type="button" class="btn btn-primary" @click="cancel()">返回</button>-->



						<navigator class="btn link"
							:url="'/pages/comment/edit?source_table=rescue_base&source_field=rescue_base_id&source_id=' + obj['rescue_base_id']">
							评论
						</navigator>


					</view>
				</view>
			</view>
		</view>


	</view>
</template>

<script>
	import list_comment from "@/components/diy/list_comment.vue";
	import bar_title from "@/components/diy/bar_title.vue";
	import form_editor from "@/components/diy/form_editor.vue";

	import mixin from "@/libs/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {
			list_comment,
			bar_title,
			form_editor
		},
		data() {
			return {
				url_get_obj: "~/api/rescue_base/get_obj?",
				field: "rescue_base_id",
				query: {
					"rescue_base_id": 0
				},
				// 商品详情初始化
				obj: {
						"rescue_title": "",
							"title_no": "",
							"release_date": "",
							"cover_photo": "",
							"application_user": 0,
							"user_name": "",
							"animal_information": "",
							"assistance_needs": "",
						"hits": 0,
					"rescue_base_id": 0,

				},
				// 点赞
				praise: 0,
				// 点赞状态
				state_praise: false,
				// 收藏
				collect: 0,
				// 收藏状态
				state_collect: false,
				// 评论列表初始化
				list_comment: [],
				// 评论bar标题
				bar_title: "评论区",
				// 评论bar的链接
				bar_url: "",
									// 用户列表
				list_user_application_user: [],
							}
		},
		methods: {
			openUrl(url) {
				console.log(1111)
				uni.navigateTo({
					url:`/pages/webview/webview?url=${url}`
				})
			},


			/**
			 * 获取评论
			 * @param {Object} obj
			 */
			get_comment(obj) {
				this.$get("~/api/comment/get_list?", {
					source_table: "rescue_base",
					source_field: "rescue_base_id",
					source_id: obj["rescue_base_id"]
				}, (res) => {
					if (res.result && res.result.list) {
						var list = res.result.list;
						this.list_comment = list;
						console.log("评论请求结果：" ,list);
					}
					else if (res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 添加访问量
			 */
			add_hits(obj) {
				obj["hits"] = obj["hits"] + 1;
				var hits = obj["hits"];
				this.$post('~/api/rescue_base/set?rescue_base_id=' + obj["rescue_base_id"], {
					hits
				}, (res) => {
					if(res.result){
						console.log("添加访问量状态：" ,res.result);
						var body = {
							source_table: "rescue_base",
							source_field: "rescue_base_id",
							source_id: this.obj.rescue_base_id,
							user_id: this.$store.state.user.user_id,
						};
						this.$post("~/api/hits/add?", body, (res) => {
							console.log(res);
						});
					}
					else if(res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 获取对象之后
			 * @param {Object} json 结果对象
			 */
			get_obj_after(json) {
				// 判断是否获取到数据
				if (this.obj) {
					var obj = this.obj;
					// 获取评论
					this.get_comment(obj);
					// 增加点击数
					this.add_hits(obj);
				}
			},

								/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_application_user() {
				var json = await this.$get("~/api/user/get_list?user_group=普通用户");
				if(json.result && json.result.list){
					this.list_user_application_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_application_user(id){
				let obj = this.list_user_application_user;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
						},
		created() {
								this.get_list_user_application_user();
						},
		mounted() {
		},
	}

</script>

<style>
	.page_goods {
		padding-bottom: 3rem;
	}

	.link {
		text-align: center;
		padding: 0.5rem 0;
		border: 1px solid #DBDBDB;
		border-radius: 0.5rem;
	}

	.buy_wrap {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
	}

	.dialog {
		width: 100%;
		height: 100vh;
		background: rgba(0, 0, 0, 0.5);
		z-index: 999;
		position: fixed;
		left: 0;
		top: 0;
		padding: 20vh 0;
	}

	.dialog-content {
		width: 500upx;
		height: 60vh;
		margin: 0 auto;
		background: #FFF;
		border-radius: 10upx;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
		padding:  5vh;
		text-align: center;

	}
	.dialog-content span{
		margin-top:  3vh;
		}

	.dialog-close {
		width: 40upx;
		height: 40upx;
		border-radius: 20upx;
		position: absolute;
		right: 10upx;
		top: 10upx;
		font-size: 26upx;
		line-height: 40upx;
		text-align: center;
	}

	.dialog-list {
		padding: 40upx 20upx;
	}

	scroll-view {
		width: 100%;
		height: 100%;
	}

	.show-dialog {
		animation: 100ms showDialog linear forwards;
	}

	.hide-dialog {
		animation: 100ms hideDialog linear forwards;
	}

	@keyframes hideDialog {
		0% {
			opacity: 1;
		}


		100% {
			opacity: 0;
		}
	}

	@keyframes showDialog {
		0% {
			opacity: 0;
		}


		100% {
			opacity: 1;
		}
	}

	/* new style start */
	.diy_detail--new{
		padding: 5px;
	}
	.diy_detail--new .view {
		border-bottom: 1px solid #ccc;
		padding: 8px 0 ;
	}
	.diy_detail--new .view uni-view{
		display: inline-block;
	}
	.diy_detail--new .view .diy_title{
		color: var(--color_primary);
		margin-right: 5px;
		vertical-align: top;
	}
	.diy_detail--new .view .diy_img img{
		width: 100%;
	}
	.diy_detail--new .view .diy_music{
		vertical-align: text-top;
	}
	.diy_detail--new .bar_title{
		position: relative;
		background-color: #fff;
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 2px;
		background: var(--color_primary);
		border-radius: 10px;
		height: 46px;
	}
	.diy_detail--new .bar_title .title{
		margin: 0 auto;
		color: var(--color_white);
		font-weight: 600;
	}
	.diy_detail--new .container-fluid-comment--new{
		margin: 10px 0.6rem;
	}
	.diy_detail--new .container-fluid-comment--new .col{
		display: flex;
		flex: auto;
		flex-wrap: wrap;
		flex-direction: row;
		margin-left: -10px;
	}
	.diy_detail--new .container-fluid-comment--new .btn{
		display: inline-block;
		border: none;
		background: var(--color_primary);
		color: #fff;
		font-size: 16px !important;
		padding: 2px 12px !important;
		border-radius: 20px;
		line-height: inherit;
		margin-bottom: 5px;
		margin-left: 10px;
		margin-right: 0;
	}
	.diy_detail--new .container-fluid-comment--new .btn:after{
		display: none;
	}
	.diy_detail--new .container-fluid-comment--new .btn .uni-icons{
		color: #fff !important;
	}
	.diy_detail--new .comment_title{
		margin-top: 10px;
	}
	/* new style end */

</style>
