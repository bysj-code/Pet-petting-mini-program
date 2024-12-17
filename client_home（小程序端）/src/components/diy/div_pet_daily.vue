<template>
	<view class="diy_details diy_div_pet_daily">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','pet_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["pet_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','type_of_pet')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物类型:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["type_of_pet"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','pet_color')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物颜色:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["pet_color"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','pet_sex')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物性别:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["pet_sex"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','pet_age')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物年龄:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["pet_age"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','adoptive_user')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>领养用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_adoptive_user(obj['adoptive_user']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','user_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>用户姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["user_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','report_date')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>报告日期:</span>
						</view>
							<view class="diy_field diy_date">
							<text>
								{{ $toTime(obj["report_date"],"yyyy-MM-dd") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','pet_daily')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物日常:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["pet_daily"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','daily_video')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>日常视频:</span>
						</view>
							<view class="diy_field diy_video">
							<router-link :to="'/media/video?filename=' + obj['daily_video']" v-if="obj['daily_video']" >
								<text>
									查看视频
								</text>
							</router-link>
						</view>
						</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						pet_daily_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
										// 用户列表
				list_user_adoptive_user: [],
								}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/pet_daily/get_obj", {
					pet_daily_id:this.query.pet_daily_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
									/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_adoptive_user() {
				var json = await this.$get("~/api/user/get_list?user_group=普通用户");
				if(json.result && json.result.list){
					this.list_user_adoptive_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_adoptive_user(id){
				let obj = this.list_user_adoptive_user;
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
									this.get_list_user_adoptive_user();
							},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["pet_daily_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_pet_daily_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
