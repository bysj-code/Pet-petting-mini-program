<template>
	<view class="diy_details diy_div_pet_information">
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
					<view v-if="$check_field('get','pet_pictures')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物图片:</span>
						</view>
							<view class="diy_field diy_img">
							<image style="width:100%;height:auto;" :src="$fullUrl(obj['pet_pictures'])" mode="widthFix"></image>
						</view>
						</view>
					<view v-if="$check_field('get','adoption_status')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>领养状态:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["adoption_status"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','adoption_address')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>领养地址:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["adoption_address"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','disease_or_not')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>是否疾病:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["disease_or_not"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','introduction_to_pets')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>宠物简介:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["introduction_to_pets"] }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/adoption_information/edit')" v-if="$check_action('/adoption_information/edit','add') || $check_action('/adoption_information/edit','set')" >领养</button>
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
						pet_information_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
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
				var res = await this.$get("~/api/pet_information/get_obj", {
					pet_information_id:this.query.pet_information_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
												},
		created() {
												},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["pet_information_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_pet_information_details {}

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
