<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','message_user') || $check_field('add','message_user') || $check_field('set','message_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="留言用户" prop="message_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_message_user(form['message_user']) }}
							<!--<el-input id="business_name" v-model="form['message_user']" placeholder="请输入留言用户"-->
							<!--v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','message_user')) || (!form['message_feedback_id'] && $check_field('add','message_user'))" :disabled="disabledObj['message_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','message_user')">{{form['message_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','message_user')) || (!form['message_feedback_id'] && $check_field('add','message_user'))" id="message_user" v-model="form['message_user']" :disabled="disabledObj['message_user_isDisabled']">
								<el-option v-for="o in list_user_message_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','message_user')" id="message_user" v-model="form['message_user']" :disabled="true">
								<el-option v-for="o in list_user_message_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="message_user" v-model="form['message_user']" :disabled="disabledObj['message_user_isDisabled']">
							<el-option v-for="o in list_user_message_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="用户姓名" prop="user_name">
												<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','user_name')) || (!form['message_feedback_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','message_title') || $check_field('add','message_title') || $check_field('set','message_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="留言标题" prop="message_title">
												<el-input id="message_title" v-model="form['message_title']" placeholder="请输入留言标题"
							  v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','message_title')) || (!form['message_feedback_id'] && $check_field('add','message_title'))" :disabled="disabledObj['message_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','message_title')">{{form['message_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','message_date') || $check_field('add','message_date') || $check_field('set','message_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="留言日期" prop="message_date">
								<el-date-picker :disabled="disabledObj['message_date_isDisabled']" v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','message_date')) || (!form['message_feedback_id'] && $check_field('add','message_date'))" id="message_date"
						v-model="form['message_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','message_date')">{{form['message_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','message_content') || $check_field('add','message_content') || $check_field('set','message_content')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="留言内容" prop="message_content">
								<el-input type="textarea" id="message_content" v-model="form['message_content']" placeholder="请输入留言内容"
						v-if="user_group === '管理员' || (form['message_feedback_id'] && $check_field('set','message_content')) || (!form['message_feedback_id'] && $check_field('add','message_content'))" :disabled="disabledObj['message_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','message_content')">{{form['message_content']}}</div>
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
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
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
				field: "message_feedback_id",
				url_add: "~/api/message_feedback/add?",
				url_set: "~/api/message_feedback/set?",
				url_get_obj: "~/api/message_feedback/get_obj?",
				url_upload: "~/api/message_feedback/upload?",

				query: {
					"message_feedback_id": 0,
				},

				form: {
								"message_user": 0, // 留言用户
										"user_name":  '', // 用户姓名
										"message_title":  '', // 留言标题
										"message_date":  '', // 留言日期
										"message_content":  '', // 留言内容
									"examine_state": "未审核",
							"examine_reply": "",
							"message_feedback_id": 0, // ID
						
				},
				disabledObj:{
								"message_user_isDisabled": false,
										"user_name_isDisabled": false,
										"message_title_isDisabled": false,
										"message_date_isDisabled": false,
										"message_content_isDisabled": false,
										},

	
					// 用户列表
				list_user_message_user: [],
						// 用户组
				group_user_message_user: "",
				
		
		
		
	
			}
		},
		methods: {


	
	
				/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_message_user() {
                // if(this.user_group !== "管理员" && this.form["message_user"] === 0) {
                //     this.form["message_user"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_message_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取普通用户用户组
			 */
			async get_group_user_message_user() {
							this.form["message_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
				if(json.result && json.result.obj){
					this.group_user_message_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_message_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_message_user.source_table+"/get_obj?"
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
												_this.form["message_user"] = id
									_this.disabledObj['message_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "message_user") {
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
					get_user_message_user(id){
				var obj = this.list_user_message_user.getObj({"user_id":id});
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
								        if (this.form["message_date"].indexOf("-")===-1){
          this.form["message_date"] = this.$toTime(parseInt(this.form["message_date"]),"yyyy-MM-dd")
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


											        if(this.form["message_date"]=="0000-00-00"){
          this.form["message_date"] = null;
        }
				if(parseInt(this.form["message_date"]) > 9999){
					this.form["message_date"] = this.$toTime(parseInt(this.form["message_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/message_feedback/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/message_feedback/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/message_feedback/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/message_feedback/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/message_feedback/view','get');
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
					this.get_list_user_message_user();
					this.get_group_user_message_user();
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
