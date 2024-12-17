<template>
	<div class="diy_home diy_list diy_adoption_information" id="diy_adoption_information_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/adoption_information/details?adoption_information_id=' + o['adoption_information_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/adoption_information/details') && +item.is_img_list">
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
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/adoption_information/details') && +item.is_img_list">
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
							<th class="diy_title" v-if="$check_field('get','adoption_address')">
						领养地址
					</th>
							<th class="diy_title" v-if="$check_field('get','adoption_mode')">
						领养方式
					</th>
							<th class="diy_title" v-if="$check_field('get','date_of_adoption')">
						领养日期
					</th>
							<th class="diy_title" v-if="$check_field('get','adoptive_user')">
						领养用户
					</th>
							<th class="diy_title" v-if="$check_field('get','user_name')">
						用户姓名
					</th>
							<th class="diy_title" v-if="$check_field('get','id_number')">
						身份证号
					</th>
							<th class="diy_title" v-if="$check_field('get','contact_number')">
						联系电话
					</th>
							<th class="diy_title" v-if="$check_field('get','user_address')">
						用户住址
					</th>
							<th class="diy_title" v-if="$check_field('get','adoption_information')">
						领养信息
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
							<td class="diy_field diy_text" v-if="$check_field('get','adoption_address')">
						<span>
							{{ o["adoption_address"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','adoption_mode')">
						<span>
							{{ o["adoption_mode"] }}
						</span>
					</td>
							<td class="diy_field diy_date" v-if="$check_field('get','date_of_adoption')">
						<span>
							{{ $toTime(o["date_of_adoption"] ,"yyyy-MM-dd") }}
						</span>
					</td>
							<td class="diy_field diy_uid" v-if="$check_field('get','adoptive_user')">
						<span>
							{{ get_user_name('adoptive_user',o['adoptive_user']) }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','user_name')">
						<span>
							{{ o["user_name"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','id_number')">
						<span>
							{{ o["id_number"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','contact_number')">
						<span>
							{{ o["contact_number"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','user_address')">
						<span>
							{{ o["user_address"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','adoption_information')">
						<span>
							{{ o["adoption_information"] }}
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
									type: "文本",
									is_img_list: "0"
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
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "宠物年龄",
									name: "pet_age",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "领养地址",
									name: "adoption_address",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "领养方式",
									name: "adoption_mode",
									type: "下拉",
									is_img_list: "1"
								},
								{
									title: "领养日期",
									name: "date_of_adoption",
									type: "日期",
									is_img_list: "1"
								},
								{
									title: "领养用户",
									name: "adoptive_user",
									type: "UID",
									is_img_list: "0"
								},
								{
									title: "用户姓名",
									name: "user_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "身份证号",
									name: "id_number",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "联系电话",
									name: "contact_number",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "用户住址",
									name: "user_address",
									type: "文本",
									is_img_list: "0"
								},
						],
						richList: [
								{
									title: "领养信息",
									name: "adoption_information",
									type: "多文本"
								},
						],
													// 用户列表
				list_user_adoptive_user: [],
									};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
													if (name == 'adoptive_user'){
					obj = this.list_user_adoptive_user.getObj({"user_id":id});
				}
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
								},
		created() {
												this.get_list_user_adoptive_user();
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

