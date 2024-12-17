<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','rescue_title') || $check_field('add','rescue_title') || $check_field('set','rescue_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="救助标题" prop="rescue_title">
												<el-input id="rescue_title" v-model="form['rescue_title']" placeholder="请输入救助标题"
							  v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','rescue_title')) || (!form['rescue_base_id'] && $check_field('add','rescue_title'))" :disabled="disabledObj['rescue_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','rescue_title')">{{form['rescue_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','title_no') || $check_field('add','title_no') || $check_field('set','title_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题编号" prop="title_no">
												<el-input id="title_no" v-model="form['title_no']" placeholder="请输入标题编号"
							  v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','title_no')) || (!form['rescue_base_id'] && $check_field('add','title_no'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','title_no')">{{form['title_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布日期" prop="release_date">
								<el-date-picker :disabled="disabledObj['release_date_isDisabled']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','release_date')) || (!form['rescue_base_id'] && $check_field('add','release_date'))" id="release_date"
						v-model="form['release_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_date')">{{form['release_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover_photo') || $check_field('add','cover_photo') || $check_field('set','cover_photo')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面图片" prop="cover_photo">
								<el-upload :disabled="disabledObj['cover_photo_isDisabled']" id="cover_photo" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover_photo"
						:show-file-list="false" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','cover_photo')) || (!form['rescue_base_id'] && $check_field('add','cover_photo'))">
						<img v-if="form['cover_photo']" :src="$fullUrl(form['cover_photo'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover_photo')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover_photo'])" :preview-src-list="[$fullUrl(form['cover_photo'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','application_user') || $check_field('add','application_user') || $check_field('set','application_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="申请用户" prop="application_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_application_user(form['application_user']) }}
							<!--<el-input id="business_name" v-model="form['application_user']" placeholder="请输入申请用户"-->
							<!--v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','application_user')) || (!form['rescue_base_id'] && $check_field('add','application_user'))" :disabled="disabledObj['application_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','application_user')">{{form['application_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','application_user')) || (!form['rescue_base_id'] && $check_field('add','application_user'))" id="application_user" v-model="form['application_user']" :disabled="disabledObj['application_user_isDisabled']">
								<el-option v-for="o in list_user_application_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','application_user')" id="application_user" v-model="form['application_user']" :disabled="true">
								<el-option v-for="o in list_user_application_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="application_user" v-model="form['application_user']" :disabled="disabledObj['application_user_isDisabled']">
							<el-option v-for="o in list_user_application_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','user_name')) || (!form['rescue_base_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','animal_information') || $check_field('add','animal_information') || $check_field('set','animal_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="动物信息" prop="animal_information">
								<el-input type="textarea" id="animal_information" v-model="form['animal_information']" placeholder="请输入动物信息"
						v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','animal_information')) || (!form['rescue_base_id'] && $check_field('add','animal_information'))" :disabled="disabledObj['animal_information_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','animal_information')">{{form['animal_information']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','assistance_needs') || $check_field('add','assistance_needs') || $check_field('set','assistance_needs')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="救助需求" prop="assistance_needs">
								<el-input type="textarea" id="assistance_needs" v-model="form['assistance_needs']" placeholder="请输入救助需求"
						v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','assistance_needs')) || (!form['rescue_base_id'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','assistance_needs')">{{form['assistance_needs']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
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
				field: "rescue_base_id",
				url_add: "~/api/rescue_base/add?",
				url_set: "~/api/rescue_base/set?",
				url_get_obj: "~/api/rescue_base/get_obj?",
				url_upload: "~/api/rescue_base/upload?",

				query: {
					"rescue_base_id": 0,
				},

				form: {
								"rescue_title":  '', // 救助标题
										"title_no": this.$get_stamp(), // 标题编号
										"release_date":  '', // 发布日期
										"cover_photo":  '', // 封面图片
										"application_user": 0, // 申请用户
										"user_name":  '', // 用户姓名
										"animal_information":  '', // 动物信息
										"assistance_needs":  '', // 救助需求
									"examine_state": "未审核",
								"rescue_base_id": 0, // ID
						
				},
				disabledObj:{
								"rescue_title_isDisabled": false,
										"title_no_isDisabled": false,
										"release_date_isDisabled": false,
										"cover_photo_isDisabled": false,
										"application_user_isDisabled": false,
										"user_name_isDisabled": false,
										"animal_information_isDisabled": false,
										"assistance_needs_isDisabled": false,
										},

	
		
		
		
		
					// 用户列表
				list_user_application_user: [],
						// 用户组
				group_user_application_user: "",
				
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
						/**
			 * 上传封面图片
			 * @param {Object} param 图片参数
			 */
			upload_cover_photo(param){
						this.uploadFile(param.file, "cover_photo");
					},
	
	
			
	
				/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_application_user() {
                // if(this.user_group !== "管理员" && this.form["application_user"] === 0) {
                //     this.form["application_user"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_application_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取普通用户用户组
			 */
			async get_group_user_application_user() {
							this.form["application_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
				if(json.result && json.result.obj){
					this.group_user_application_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_application_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_application_user.source_table+"/get_obj?"
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
												_this.form["application_user"] = id
									_this.disabledObj['application_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "application_user") {
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
					get_user_application_user(id){
				var obj = this.list_user_application_user.getObj({"user_id":id});
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
						        if (this.form["release_date"].indexOf("-")===-1){
          this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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


								        if(this.form["release_date"]=="0000-00-00"){
          this.form["release_date"] = null;
        }
				if(parseInt(this.form["release_date"]) > 9999){
					this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/rescue_base/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/rescue_base/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/rescue_base/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/rescue_base/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/rescue_base/view','get');
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
													this.get_list_user_application_user();
					this.get_group_user_application_user();
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
