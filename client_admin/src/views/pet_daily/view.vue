<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','pet_name') || $check_field('add','pet_name') || $check_field('set','pet_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物名称" prop="pet_name">
												<el-input id="pet_name" v-model="form['pet_name']" placeholder="请输入宠物名称"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','pet_name')) || (!form['pet_daily_id'] && $check_field('add','pet_name'))" :disabled="disabledObj['pet_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_name')">{{form['pet_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','type_of_pet') || $check_field('add','type_of_pet') || $check_field('set','type_of_pet')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物类型" prop="type_of_pet">
												<el-input id="type_of_pet" v-model="form['type_of_pet']" placeholder="请输入宠物类型"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','type_of_pet')) || (!form['pet_daily_id'] && $check_field('add','type_of_pet'))" :disabled="disabledObj['type_of_pet_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','type_of_pet')">{{form['type_of_pet']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_color') || $check_field('add','pet_color') || $check_field('set','pet_color')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物颜色" prop="pet_color">
												<el-input id="pet_color" v-model="form['pet_color']" placeholder="请输入宠物颜色"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','pet_color')) || (!form['pet_daily_id'] && $check_field('add','pet_color'))" :disabled="disabledObj['pet_color_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_color')">{{form['pet_color']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_sex') || $check_field('add','pet_sex') || $check_field('set','pet_sex')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物性别" prop="pet_sex">
												<el-input id="pet_sex" v-model="form['pet_sex']" placeholder="请输入宠物性别"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','pet_sex')) || (!form['pet_daily_id'] && $check_field('add','pet_sex'))" :disabled="disabledObj['pet_sex_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_sex')">{{form['pet_sex']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_age') || $check_field('add','pet_age') || $check_field('set','pet_age')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物年龄" prop="pet_age">
												<el-input id="pet_age" v-model="form['pet_age']" placeholder="请输入宠物年龄"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','pet_age')) || (!form['pet_daily_id'] && $check_field('add','pet_age'))" :disabled="disabledObj['pet_age_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_age')">{{form['pet_age']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','adoptive_user') || $check_field('add','adoptive_user') || $check_field('set','adoptive_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="领养用户" prop="adoptive_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_adoptive_user(form['adoptive_user']) }}
							<!--<el-input id="business_name" v-model="form['adoptive_user']" placeholder="请输入领养用户"-->
							<!--v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','adoptive_user')) || (!form['pet_daily_id'] && $check_field('add','adoptive_user'))" :disabled="disabledObj['adoptive_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','adoptive_user')">{{form['adoptive_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','adoptive_user')) || (!form['pet_daily_id'] && $check_field('add','adoptive_user'))" id="adoptive_user" v-model="form['adoptive_user']" :disabled="disabledObj['adoptive_user_isDisabled']">
								<el-option v-for="o in list_user_adoptive_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','adoptive_user')" id="adoptive_user" v-model="form['adoptive_user']" :disabled="true">
								<el-option v-for="o in list_user_adoptive_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="adoptive_user" v-model="form['adoptive_user']" :disabled="disabledObj['adoptive_user_isDisabled']">
							<el-option v-for="o in list_user_adoptive_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','user_name')) || (!form['pet_daily_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','report_date') || $check_field('add','report_date') || $check_field('set','report_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="报告日期" prop="report_date">
								<el-date-picker :disabled="disabledObj['report_date_isDisabled']" v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','report_date')) || (!form['pet_daily_id'] && $check_field('add','report_date'))" id="report_date"
						v-model="form['report_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','report_date')">{{form['report_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','pet_daily') || $check_field('add','pet_daily') || $check_field('set','pet_daily')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="宠物日常" prop="pet_daily">
								<el-input type="textarea" id="pet_daily" v-model="form['pet_daily']" placeholder="请输入宠物日常"
						v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','pet_daily')) || (!form['pet_daily_id'] && $check_field('add','pet_daily'))" :disabled="disabledObj['pet_daily_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','pet_daily')">{{form['pet_daily']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','daily_video') || $check_field('add','daily_video') || $check_field('set','daily_video')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="日常视频" prop="daily_video">
												<el-upload v-if="user_group === '管理员' || (form['pet_daily_id'] && $check_field('set','daily_video')) || (!form['pet_daily_id'] && $check_field('add','daily_video'))" class="upload-demo" drag
						action="" style="max-width: 300px;width: 100%;" :http-request="upload_daily_video" :limit="1" accept="video/ogg,video/mp4,video/webm">
						<i class="el-icon-upload"></i>
						<div class="el-upload__text">将视频拖到此处，或<em>点击上传</em></div>
					</el-upload>
					<div v-else-if="$check_field('get','daily_video')">
						<el-button type="primary" @click="download(form['daily_video'])">下载<i
								class="el-icon-download el-icon--right"></i></el-button>
					</div>
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
				field: "pet_daily_id",
				url_add: "~/api/pet_daily/add?",
				url_set: "~/api/pet_daily/set?",
				url_get_obj: "~/api/pet_daily/get_obj?",
				url_upload: "~/api/pet_daily/upload?",

				query: {
					"pet_daily_id": 0,
				},

				form: {
								"pet_name":  '', // 宠物名称
										"type_of_pet":  '', // 宠物类型
										"pet_color":  '', // 宠物颜色
										"pet_sex":  '', // 宠物性别
										"pet_age":  '', // 宠物年龄
										"adoptive_user": 0, // 领养用户
										"user_name":  '', // 用户姓名
										"report_date":  '', // 报告日期
										"pet_daily":  '', // 宠物日常
										"daily_video":  '', // 日常视频
											"pet_daily_id": 0, // ID
						
				},
				disabledObj:{
								"pet_name_isDisabled": false,
										"type_of_pet_isDisabled": false,
										"pet_color_isDisabled": false,
										"pet_sex_isDisabled": false,
										"pet_age_isDisabled": false,
										"adoptive_user_isDisabled": false,
										"user_name_isDisabled": false,
										"report_date_isDisabled": false,
										"pet_daily_isDisabled": false,
										"daily_video_isDisabled": false,
										},

	
		
		
		
		
		
					// 用户列表
				list_user_adoptive_user: [],
						// 用户组
				group_user_adoptive_user: "",
				
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
			
	
				/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_adoptive_user() {
                // if(this.user_group !== "管理员" && this.form["adoptive_user"] === 0) {
                //     this.form["adoptive_user"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_adoptive_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取普通用户用户组
			 */
			async get_group_user_adoptive_user() {
							this.form["adoptive_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
				if(json.result && json.result.obj){
					this.group_user_adoptive_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_adoptive_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_adoptive_user.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["adoptive_user"] = id
									_this.disabledObj['adoptive_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "adoptive_user") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_adoptive_user(id){
				var obj = this.list_user_adoptive_user.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
						/**
			 * 上传日常视频
			 * @param {Object} param 视频参数
			 */
			upload_daily_video(param){
						this.uploadFile(param.file, "daily_video");
					},
	
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
													// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
														
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
																        if (this.form["report_date"].indexOf("-")===-1){
          this.form["report_date"] = this.$toTime(parseInt(this.form["report_date"]),"yyyy-MM-dd")
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


																							        if(this.form["report_date"]=="0000-00-00"){
          this.form["report_date"] = null;
        }
				if(parseInt(this.form["report_date"]) > 9999){
					this.form["report_date"] = this.$toTime(parseInt(this.form["report_date"]),"yyyy-MM-dd")
				}
								

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
					bl = this.$check_action('/pet_daily/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_daily/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_daily/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_daily/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/pet_daily/view','get');
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
															this.get_list_user_adoptive_user();
					this.get_group_user_adoptive_user();
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
