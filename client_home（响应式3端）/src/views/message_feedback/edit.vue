<template>
	<div class="diy_edit page_message_feedback" id="message_feedback_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','message_user') || $check_field('add','message_user') || $check_field('get','message_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								留言用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_message_user" :disabled="disabledObj['message_user_isDisabled']" v-model="form['message_user']" v-if="(form['message_user'] && $check_field('set','message_user')) || (!form['message_user'] && $check_field('add','message_user'))" >
								<option v-for="o in list_user_message_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','message_user')">{{ form['message_user'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))"  :disabled="disabledObj['user_name_isDisabled']"/>
							<span v-else-if="$check_field('get','user_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','message_title') || $check_field('add','message_title') || $check_field('get','message_title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								留言标题:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_message_title" v-model="form['message_title']" placeholder="请输入留言标题" v-if="(form['message_title'] && $check_field('set','message_title')) || (!form['message_title'] && $check_field('add','message_title'))"  :disabled="disabledObj['message_title_isDisabled']"/>
							<span v-else-if="$check_field('get','message_title')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','message_date') || $check_field('add','message_date') || $check_field('get','message_date')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								留言日期:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['message_date_isDisabled']" id="form_message_date" v-model="form['message_date']" placeholder="请输入留言日期" v-if="(form['message_date'] && $check_field('set','message_date')) || (!form['message_date'] && $check_field('add','message_date'))" />
							<span v-else-if="$check_field('get','message_date')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','message_content') || $check_field('add','message_content') || $check_field('get','message_content')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								留言内容:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_message_content" v-model="form['message_content']" v-if="(form['message_content'] && $check_field('set','message_content')) || (!form['message_content'] && $check_field('add','message_content'))" :disabled="disabledObj['message_content_isDisabled']" />
							<span v-else-if="$check_field('get','message_content')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
	


					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/message_feedback/edit','examine')">
							<!--<span> {{ form['examine_state'] }} </span>-->
							<select v-model="form['examine_state']">
								<option value="未审核">
									未审核
								</option>
								<option value="已通过">
									已通过
								</option>
								<option value="未通过">
									未通过
								</option>
							</select>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_state'] }}
							</span>
						</div>
					</div>
					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核回复:
							</span>
						</div>
						<div class="diy_field diy_desc" v-if="$check_action('/message_feedback/edit','examine')">
							<textarea v-model="form['examine_reply']"></textarea>
						</div>
						<div class="diy_field diy_text" v-else>
							<span>
								{{ form['examine_reply'] }}
							</span>
						</div>
					</div>


				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/message_feedback/get_obj?",
				url_add: "~/api/message_feedback/add?",
				url_set: "~/api/message_feedback/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"message_user": 0,
							"user_name": "",
							"message_title": "",
							"message_date": "",
							"message_content": "",
						"message_feedback_id": 0,
				},

				obj: {
						"message_user": 0, // 留言用户
							"user_name":  '', // 用户姓名
							"message_title":  '', // 留言标题
							"message_date": new Date().getTime(),
							"message_content":  '', // 留言内容
						"examine_state": "未审核",
					"examine_reply": "",
					"message_feedback_id": 0,
				},

				// 表单字段
				form: {
						"message_user": 0, // 留言用户
							"user_name":  '', // 用户姓名
							"message_title":  '', // 留言标题
							"message_date": new Date().getTime(),
							"message_content":  '', // 留言内容
						"examine_state": "未审核",
					"examine_reply": "",
					"message_feedback_id": 0,
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
									
				// ID字段
				field: "message_feedback_id",

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
					async get_user_session_message_user(){
				var _this = this;
				var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
				if(json.result && json.result.obj){
					var source_table = json.result.obj.source_table;
					var user_id = _this.$store.state.user.user_id;
					if (user_id){
						var url = "~/api/"+source_table+"/get_obj?"
						this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
							if (res.result && res.result.obj) {
								var arr = []
								for (let key in res.result.obj) {
									arr.push(key)
								}
								var arrForm = []
								for (let key in _this.form) {
									arrForm.push(key)
								}
								_this.form["message_user"] = user_id
								_this.disabledObj['message_user' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "message_user") {
                          _this.form[arrForm[j]] = res.result.obj[arr[i]]
                          _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                          break;
                        }
                      }
                    }
                  }
								}
							}
						});
					}
				}
				else if(json.error){
					console.error(json.error);
				}
			},
	
				
				
				
				
	
			/**
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/message_feedback/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
								        if (JSON.stringify(this.form["message_date"]).indexOf("-")===-1) {
          this.form["message_date"] = this.$toTime(parseInt(this.form["message_date"]), "yyyy-MM-dd")
        }
			
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
					this.get_user_session_message_user();
					this.get_list_user_message_user();
															},
	}
</script>

<style>




</style>
