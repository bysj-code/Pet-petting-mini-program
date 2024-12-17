<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','pet_name') || $check_field('add','pet_name') || $check_field('set','pet_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物名称" prop="pet_name">
												<el-input id="pet_name" v-model="form['pet_name']" placeholder="请输入宠物名称"
							  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_name')) || (!form['pet_information_id'] && $check_field('add','pet_name'))" :disabled="disabledObj['pet_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_name')">{{form['pet_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','type_of_pet') || $check_field('add','type_of_pet') || $check_field('set','type_of_pet')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物类型" prop="type_of_pet">
								<el-select id="type_of_pet" v-model="form['type_of_pet']"
						v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','type_of_pet')) || (!form['pet_information_id'] && $check_field('add','type_of_pet'))">
						<el-option v-for="o in list_type_of_pet" :key="o['type_of_pet']" :label="o['type_of_pet']"
							:value="o['type_of_pet']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','type_of_pet')">{{form['type_of_pet']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_color') || $check_field('add','pet_color') || $check_field('set','pet_color')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物颜色" prop="pet_color">
												<el-input id="pet_color" v-model="form['pet_color']" placeholder="请输入宠物颜色"
							  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_color')) || (!form['pet_information_id'] && $check_field('add','pet_color'))" :disabled="disabledObj['pet_color_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_color')">{{form['pet_color']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_sex') || $check_field('add','pet_sex') || $check_field('set','pet_sex')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物性别" prop="pet_sex">
								<el-select id="pet_sex" v-model="form['pet_sex']"
						v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_sex')) || (!form['pet_information_id'] && $check_field('add','pet_sex'))">
						<el-option v-for="o in list_pet_sex" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','pet_sex')">{{form['pet_sex']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_age') || $check_field('add','pet_age') || $check_field('set','pet_age')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物年龄" prop="pet_age">
												<el-input id="pet_age" v-model="form['pet_age']" placeholder="请输入宠物年龄"
							  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_age')) || (!form['pet_information_id'] && $check_field('add','pet_age'))" :disabled="disabledObj['pet_age_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_age')">{{form['pet_age']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_pictures') || $check_field('add','pet_pictures') || $check_field('set','pet_pictures')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物图片" prop="pet_pictures">
								<el-upload :disabled="disabledObj['pet_pictures_isDisabled']" id="pet_pictures" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_pet_pictures"
						:show-file-list="false" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_pictures')) || (!form['pet_information_id'] && $check_field('add','pet_pictures'))">
						<img v-if="form['pet_pictures']" :src="$fullUrl(form['pet_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','pet_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['pet_pictures'])" :preview-src-list="[$fullUrl(form['pet_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','adoption_status') || $check_field('add','adoption_status') || $check_field('set','adoption_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="领养状态" prop="adoption_status">
								<el-select id="adoption_status" v-model="form['adoption_status']"
						v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','adoption_status')) || (!form['pet_information_id'] && $check_field('add','adoption_status'))">
						<el-option v-for="o in list_adoption_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','adoption_status')">{{form['adoption_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','adoption_address') || $check_field('add','adoption_address') || $check_field('set','adoption_address')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="领养地址" prop="adoption_address">
												<el-input id="adoption_address" v-model="form['adoption_address']" placeholder="请输入领养地址"
							  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','adoption_address')) || (!form['pet_information_id'] && $check_field('add','adoption_address'))" :disabled="disabledObj['adoption_address_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','adoption_address')">{{form['adoption_address']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','disease_or_not') || $check_field('add','disease_or_not') || $check_field('set','disease_or_not')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="是否疾病" prop="disease_or_not">
								<el-select id="disease_or_not" v-model="form['disease_or_not']"
						v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','disease_or_not')) || (!form['pet_information_id'] && $check_field('add','disease_or_not'))">
						<el-option v-for="o in list_disease_or_not" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','disease_or_not')">{{form['disease_or_not']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','introduction_to_pets') || $check_field('add','introduction_to_pets') || $check_field('set','introduction_to_pets')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物简介" prop="introduction_to_pets">
								<el-input type="textarea" id="introduction_to_pets" v-model="form['introduction_to_pets']" placeholder="请输入宠物简介"
						v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','introduction_to_pets')) || (!form['pet_information_id'] && $check_field('add','introduction_to_pets'))" :disabled="disabledObj['introduction_to_pets_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','introduction_to_pets')">{{form['introduction_to_pets']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "pet_information_id",
				url_add: "~/api/pet_information/add?",
				url_set: "~/api/pet_information/set?",
				url_get_obj: "~/api/pet_information/get_obj?",
				url_upload: "~/api/pet_information/upload?",

				query: {
					"pet_information_id": 0,
				},

				form: {
								"pet_name":  '', // 宠物名称
										"type_of_pet":  '', // 宠物类型
										"pet_color":  '', // 宠物颜色
										"pet_sex":  '', // 宠物性别
										"pet_age":  '', // 宠物年龄
										"pet_pictures":  '', // 宠物图片
										"adoption_status":  '', // 领养状态
										"adoption_address":  '', // 领养地址
										"disease_or_not":  '', // 是否疾病
										"introduction_to_pets":  '', // 宠物简介
											"pet_information_id": 0, // ID
						
				},
				disabledObj:{
								"pet_name_isDisabled": false,
										"type_of_pet_isDisabled": false,
										"pet_color_isDisabled": false,
										"pet_sex_isDisabled": false,
										"pet_age_isDisabled": false,
										"pet_pictures_isDisabled": false,
										"adoption_status_isDisabled": false,
										"adoption_address_isDisabled": false,
										"disease_or_not_isDisabled": false,
										"introduction_to_pets_isDisabled": false,
										},

	
						// 宠物类型选项列表
				list_type_of_pet: [""],
	
		
						// 宠物性别选项列表
				list_pet_sex: ['公','母'],
	
		
		
						// 领养状态选项列表
				list_adoption_status: ['待领养','已被领'],
	
		
						// 是否疾病选项列表
				list_disease_or_not: ['是','否'],
	
		
	
			}
		},
		methods: {


	
	
			
				/**
			 * 获取宠物类型列表
			 */
			async get_list_type_of_pet() {
				var json = await this.$get("~/api/type_of_pet/get_list?");
				if(json.result && json.result.list){
					this.list_type_of_pet = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
			
	
			
	
			
	
						/**
			 * 上传宠物图片
			 * @param {Object} param 图片参数
			 */
			upload_pet_pictures(param){
						this.uploadFile(param.file, "pet_pictures");
					},
	
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																		
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																								$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																														

			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																																				return msg;
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/pet_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
						this.get_list_type_of_pet();
																				},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
