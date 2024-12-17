<template>
	<div class="diy_home diy_list diy_pet_information" id="diy_pet_information_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/pet_information/details?pet_information_id=' + o['pet_information_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/pet_information/details') && +item.is_img_list">
						<div class="diy_title diy_list_img_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="diy_field diy_img">
							<img :src="$fullUrl(o[item.name])" style="width:100%;height:100%" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="diy_list_item_box">
					<div class="diy_list_item_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/pet_information/details') && +item.is_img_list">
							<div class="diy_title">
								<span>{{item.title}}:</span>
							</div>
							<div class="diy_field diy_text">
								<span v-if="item.type == 'UID'" v-text="get_user_name(item.name,o[item.name])"></span>
								<span v-else-if="item.type == '日期'" v-text="$toTime(o[item.name],'yyyy-MM-dd')"></span>
								<span v-else-if="item.type == '时间'" v-text="$toTime(o[item.name],'hh:mm:ss')"></span>
								<span v-else-if="item.type == '日长'" v-text="$toTime(o[item.name],'yyyy-MM-dd hh:mm:ss')"></span>
								<span v-else v-text="o[item.name]"></span>
							</div>
						</div>
					</div>
				</div>
			</router-link>
		</div>
		<!-- 表格 -->
		<div class="diy_view_table" v-else>
			<table class="diy_table">
				<tr class="diy_row">
						<th class="diy_title" v-if="$check_field('get','pet_name')">
						宠物名称
					</th>
							<th class="diy_title" v-if="$check_field('get','type_of_pet')">
						宠物类型
					</th>
							<th class="diy_title" v-if="$check_field('get','pet_color')">
						宠物颜色
					</th>
							<th class="diy_title" v-if="$check_field('get','pet_sex')">
						宠物性别
					</th>
							<th class="diy_title" v-if="$check_field('get','pet_age')">
						宠物年龄
					</th>
							<th class="diy_title" v-if="$check_field('get','pet_pictures')">
						宠物图片
					</th>
							<th class="diy_title" v-if="$check_field('get','adoption_status')">
						领养状态
					</th>
							<th class="diy_title" v-if="$check_field('get','adoption_address')">
						领养地址
					</th>
							<th class="diy_title" v-if="$check_field('get','disease_or_not')">
						是否疾病
					</th>
							<th class="diy_title" v-if="$check_field('get','introduction_to_pets')">
						宠物简介
					</th>
					</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
						<td class="diy_field diy_text" v-if="$check_field('get','pet_name')">
						<span>
							{{ o["pet_name"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','type_of_pet')">
						<span>
							{{ o["type_of_pet"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','pet_color')">
						<span>
							{{ o["pet_color"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','pet_sex')">
						<span>
							{{ o["pet_sex"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','pet_age')">
						<span>
							{{ o["pet_age"] }}
						</span>
					</td>
							<td class="diy_field" v-if="$check_field('get','pet_pictures')">
						<img class="diy_img" :src="o['pet_pictures']" />
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','adoption_status')">
						<span>
							{{ o["adoption_status"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','adoption_address')">
						<span>
							{{ o["adoption_address"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','disease_or_not')">
						<span>
							{{ o["disease_or_not"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','introduction_to_pets')">
						<span>
							{{ o["introduction_to_pets"] }}
						</span>
					</td>
					</tr>
			</table>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				},
			},
			show: {
				type: Boolean,
				default: function(){
					return true;
				}
			}
		},
		data() {
			return {
						imgList: [
						{
							title: "宠物图片",
							name: "pet_pictures",
							type: "图片",
							is_img_list: "1"
						},
						],
						itemList: [
								{
									title: "宠物名称",
									name: "pet_name",
									type: "文本",
									is_img_list: "1"
								},
								{
									title: "宠物类型",
									name: "type_of_pet",
									type: "下寻",
									is_img_list: "1"
								},
								{
									title: "宠物颜色",
									name: "pet_color",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "宠物性别",
									name: "pet_sex",
									type: "下拉",
									is_img_list: "0"
								},
								{
									title: "宠物年龄",
									name: "pet_age",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "领养状态",
									name: "adoption_status",
									type: "下拉",
									is_img_list: "0"
								},
								{
									title: "领养地址",
									name: "adoption_address",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "是否疾病",
									name: "disease_or_not",
									type: "下拉",
									is_img_list: "0"
								},
						],
						richList: [
								{
									title: "宠物简介",
									name: "introduction_to_pets",
									type: "多文本"
								},
						],
													};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
														var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
												},
		created() {
												},
		computed:{
			showItemList(){
				let arr = [];
				let _type = ["视频","音频","文件"];
				this.itemList.forEach(item => {
					if(_type.indexOf(item.type) === -1 && !!+item.is_img_list){
						arr.push(item)
					}
				})
				return arr.slice(0,4);
			}
		}
	};
</script>

<style scoped>
	.media {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		flex-basis: 75%;
		min-height: 10rem;
	}

	.goods {
		display: flex;
		width: calc(25% - 1rem);
		margin: 0.5rem;
		padding: 0.5rem;
		flex-direction: column;
		justify-content: space-between;
		background-color: white;
		border-radius: 0.5rem;
	}

	.goods:hover {
		border: 0.2rem solid #909399;
		box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.15);
	}

	.goods:hover img {
		filter: blur(1px);
	}

	.price {
		font-size: 1rem;
		margin-right: 3px;
	}

	.price_ago {
		text-decoration: line-through;
		font-size: 0.5rem;
		color: #999;

	}

	.title {
		word-break: break-all;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-weight: 700;
		padding: .25rem;
	}

	.icon_cart {
		color: #FF5722;
		float: right;
	}

	@media (max-width: 992px) {

		.goods {
			width: calc(33% - 1rem);
			;
		}

	}

	@media (max-width: 768px) {

		.goods {
			width: calc(50% - 1rem);
			;
		}

	}
</style>

