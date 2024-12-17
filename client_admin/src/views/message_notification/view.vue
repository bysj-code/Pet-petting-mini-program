<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','reminder_title') || $check_field('add','reminder_title') || $check_field('set','reminder_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提醒标题" prop="reminder_title">
												<el-input id="reminder_title" v-model="form['reminder_title']" placeholder="请输入提醒标题"
							  v-if="user_group === '管理员' || (form['message_notification_id'] && $check_field('set','reminder_title')) || (!form['message_notification_id'] && $check_field('add','reminder_title'))" :disabled="disabledObj['reminder_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reminder_title')">{{form['reminder_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remind_users') || $check_field('add','remind_users') || $check_field('set','remind_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提醒用户" prop="remind_users">
													<el-select v-if="user_group === '管理员' || (form['message_notification_id'] && $check_field('set','remind_users')) || (!form['message_notification_id'] && $check_field('add','remind_users'))" id="remind_users" v-model="form['remind_users']" :disabled="disabledObj['remind_users_isDisabled']">
							<el-option v-for="o in list_user_remind_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','remind_users')" id="remind_users" v-model="form['remind_users']" :disabled="true">
							<el-option v-for="o in list_user_remind_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reminder_date') || $check_field('add','reminder_date') || $check_field('set','reminder_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提醒日期" prop="reminder_date">
								<el-date-picker :disabled="disabledObj['reminder_date_isDisabled']" v-if="user_group === '管理员' || (form['message_notification_id'] && $check_field('set','reminder_date')) || (!form['message_notification_id'] && $check_field('add','reminder_date'))" id="reminder_date"
						v-model="form['reminder_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','reminder_date')">{{form['reminder_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','reminder_message') || $check_field('add','reminder_message') || $check_field('set','reminder_message')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="提醒信息" prop="reminder_message">
								<el-input type="textarea" id="reminder_message" v-model="form['reminder_message']" placeholder="请输入提醒信息"
						v-if="user_group === '管理员' || (form['message_notification_id'] && $check_field('set','reminder_message')) || (!form['message_notification_id'] && $check_field('add','reminder_message'))" :disabled="disabledObj['reminder_message_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reminder_message')">{{form['reminder_message']}}</div>
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
				field: "message_notification_id",
				url_add: "~/api/message_notification/add?",
				url_set: "~/api/message_notification/set?",
				url_get_obj: "~/api/message_notification/get_obj?",
				url_upload: "~/api/message_notification/upload?",

				query: {
					"message_notification_id": 0,
				},

				form: {
								"reminder_title":  '', // 提醒标题
										"remind_users": 0, // 提醒用户
										"reminder_date":  '', // 提醒日期
										"reminder_message":  '', // 提醒信息
											"message_notification_id": 0, // ID
						
				},
				disabledObj:{
								"reminder_title_isDisabled": false,
										"remind_users_isDisabled": false,
										"reminder_date_isDisabled": false,
										"reminder_message_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_remind_users: [],
				
		
	
			}
		},
		methods: {


	
	
			
	
				/**
			 * 获取普通用户用户列表
			 */
			async get_list_user_remind_users() {
                // if(this.user_group !== "管理员" && this.form["remind_users"] === 0) {
                //     this.form["remind_users"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=普通用户");
                if(json.result && json.result.list){
                    this.list_user_remind_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_remind_users(id){
				var obj = this.list_user_remind_users.getObj({"user_id":id});
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
						        if (this.form["reminder_date"].indexOf("-")===-1){
          this.form["reminder_date"] = this.$toTime(parseInt(this.form["reminder_date"]),"yyyy-MM-dd")
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


								        if(this.form["reminder_date"]=="0000-00-00"){
          this.form["reminder_date"] = null;
        }
				if(parseInt(this.form["reminder_date"]) > 9999){
					this.form["reminder_date"] = this.$toTime(parseInt(this.form["reminder_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/message_notification/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/message_notification/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/message_notification/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/message_notification/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/message_notification/view','get');
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
							this.get_list_user_remind_users();
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
