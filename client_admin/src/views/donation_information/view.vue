<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','rescue_title') || $check_field('add','rescue_title') || $check_field('set','rescue_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="救助标题" prop="rescue_title">
												<el-input id="rescue_title" v-model="form['rescue_title']" placeholder="请输入救助标题"
							  v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','rescue_title')) || (!form['donation_information_id'] && $check_field('add','rescue_title'))" :disabled="disabledObj['rescue_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','rescue_title')">{{form['rescue_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','title_no') || $check_field('add','title_no') || $check_field('set','title_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题编号" prop="title_no">
												<el-input id="title_no" v-model="form['title_no']" placeholder="请输入标题编号"
							  v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','title_no')) || (!form['donation_information_id'] && $check_field('add','title_no'))" :disabled="disabledObj['title_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title_no')">{{form['title_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','application_user') || $check_field('add','application_user') || $check_field('set','application_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="申请用户" prop="application_user">
													<el-select v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','application_user')) || (!form['donation_information_id'] && $check_field('add','application_user'))" id="application_user" v-model="form['application_user']" :disabled="disabledObj['application_user_isDisabled']">
							<el-option v-for="o in list_user_application_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','application_user')" id="application_user" v-model="form['application_user']" :disabled="true">
							<el-option v-for="o in list_user_application_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','assistance_needs') || $check_field('add','assistance_needs') || $check_field('set','assistance_needs')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="救助需求" prop="assistance_needs">
								<el-input type="textarea" id="assistance_needs" v-model="form['assistance_needs']" placeholder="请输入救助需求"
						v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','assistance_needs')) || (!form['donation_information_id'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','assistance_needs')">{{form['assistance_needs']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','donor_users') || $check_field('add','donor_users') || $check_field('set','donor_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="捐助用户" prop="donor_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_donor_users(form['donor_users']) }}
							<!--<el-input id="business_name" v-model="form['donor_users']" placeholder="请输入捐助用户"-->
							<!--v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donor_users')) || (!form['donation_information_id'] && $check_field('add','donor_users'))" :disabled="disabledObj['donor_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','donor_users')">{{form['donor_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donor_users')) || (!form['donation_information_id'] && $check_field('add','donor_users'))" id="donor_users" v-model="form['donor_users']" :disabled="disabledObj['donor_users_isDisabled']">
								<el-option v-for="o in list_user_donor_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','donor_users')" id="donor_users" v-model="form['donor_users']" :disabled="true">
								<el-option v-for="o in list_user_donor_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="donor_users" v-model="form['donor_users']" :disabled="disabledObj['donor_users_isDisabled']">
							<el-option v-for="o in list_user_donor_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','donations') || $check_field('add','donations') || $check_field('set','donations')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="捐助物品" prop="donations">
												<el-input id="donations" v-model="form['donations']" placeholder="请输入捐助物品"
							  v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donations')) || (!form['donation_information_id'] && $check_field('add','donations'))" :disabled="disabledObj['donations_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','donations')">{{form['donations']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','donation_amount') || $check_field('add','donation_amount') || $check_field('set','donation_amount')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="捐助金额" prop="donation_amount">
								<el-input-number id="donation_amount" v-model.number="form['donation_amount']"
						v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donation_amount')) || (!form['donation_information_id'] && $check_field('add','donation_amount'))" :disabled="disabledObj['donation_amount_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','donation_amount')">{{form['donation_amount']}}</div>
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
				field: "donation_information_id",
				url_add: "~/api/donation_information/add?",
				url_set: "~/api/donation_information/set?",
				url_get_obj: "~/api/donation_information/get_obj?",
				url_upload: "~/api/donation_information/upload?",

				query: {
					"donation_information_id": 0,
				},

				form: {
								"rescue_title":  '', // 救助标题
										"title_no":  '', // 标题编号
										"application_user": 0, // 申请用户
										"assistance_needs":  '', // 救助需求
										"donor_users": 0, // 捐助用户
										"donations":  '', // 捐助物品
										"donation_amount":  0, // 捐助金额
											"donation_information_id": 0, // ID
						
				},
				disabledObj:{
								"rescue_title_isDisabled": false,
										"title_no_isDisabled": false,
										"application_user_isDisabled": false,
										"assistance_needs_isDisabled": false,
										"donor_users_isDisabled": false,
										"donations_isDisabled": false,
					          			"donation_amount_isDisabled": false,
										},

	
		
		
					// 用户列表
				list_user_application_user: [],
				
		
					// 用户列表
				list_user_donor_users: [],
						// 用户组
				group_user_donor_users: "",
				
		
	
			}
		},
		methods: {


	
	
			
	
			
	
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
			 * 获取普通用户用户列表
			 */
			async get_list_user_donor_users() {
                // if(this.user_group !== "管理员" && this.form["donor_users"] === 0) {
                //     this.form["donor_users"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_donor_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取普通用户用户组
			 */
			async get_group_user_donor_users() {
							this.form["donor_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
				if(json.result && json.result.obj){
					this.group_user_donor_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_donor_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_donor_users.source_table+"/get_obj?"
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
												_this.form["donor_users"] = id
									_this.disabledObj['donor_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "donor_users") {
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
					get_user_donor_users(id){
				var obj = this.list_user_donor_users.getObj({"user_id":id});
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
					bl = this.$check_action('/donation_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/donation_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/donation_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/donation_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/donation_information/view','get');
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
										this.get_list_user_donor_users();
					this.get_group_user_donor_users();
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
