<template>
	<div class="diy_edit page_donation_information" id="donation_information_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','rescue_title') || $check_field('add','rescue_title') || $check_field('get','rescue_title')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								救助标题:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_rescue_title" v-model="form['rescue_title']" placeholder="请输入救助标题" v-if="(form['rescue_title'] && $check_field('set','rescue_title')) || (!form['rescue_title'] && $check_field('add','rescue_title'))"  :disabled="disabledObj['rescue_title_isDisabled']"/>
							<span v-else-if="$check_field('get','rescue_title')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','title_no') || $check_field('add','title_no') || $check_field('get','title_no')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								标题编号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_title_no" v-model="form['title_no']" placeholder="请输入标题编号" v-if="(form['title_no'] && $check_field('set','title_no')) || (!form['title_no'] && $check_field('add','title_no'))"  :disabled="disabledObj['title_no_isDisabled']"/>
							<span v-else-if="$check_field('get','title_no')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','application_user') || $check_field('add','application_user') || $check_field('get','application_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								申请用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_application_user" :disabled="disabledObj['application_user_isDisabled']" v-model="form['application_user']" v-if="(form['application_user'] && $check_field('set','application_user')) || (!form['application_user'] && $check_field('add','application_user'))" >
								<option v-for="o in list_user_application_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','application_user')">{{ form['application_user'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','assistance_needs') || $check_field('add','assistance_needs') || $check_field('get','assistance_needs')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								救助需求:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_assistance_needs" v-model="form['assistance_needs']" v-if="(form['assistance_needs'] && $check_field('set','assistance_needs')) || (!form['assistance_needs'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']" />
							<span v-else-if="$check_field('get','assistance_needs')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','donor_users') || $check_field('add','donor_users') || $check_field('get','donor_users')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								捐助用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_donor_users" :disabled="disabledObj['donor_users_isDisabled']" v-model="form['donor_users']" v-if="(form['donor_users'] && $check_field('set','donor_users')) || (!form['donor_users'] && $check_field('add','donor_users'))" >
								<option v-for="o in list_user_donor_users" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','donor_users')">{{ form['donor_users'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','donations') || $check_field('add','donations') || $check_field('get','donations')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								捐助物品:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_donations" v-model="form['donations']" placeholder="请输入捐助物品" v-if="(form['donations'] && $check_field('set','donations')) || (!form['donations'] && $check_field('add','donations'))"  :disabled="disabledObj['donations_isDisabled']"/>
							<span v-else-if="$check_field('get','donations')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','donation_amount') || $check_field('add','donation_amount') || $check_field('get','donation_amount')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								捐助金额:
							</span>
						</div>
								<!-- 数字 -->
						<div class="diy_field diy_number">
							<input type="number" id="form_donation_amount" v-model.number="form['donation_amount']" placeholder="请输入捐助金额" v-if="(form['donation_amount'] && $check_field('set','donation_amount')) || (!form['donation_amount'] && $check_field('add','donation_amount'))" :disabled="disabledObj['donation_amount_isDisabled']" />
							<span v-else-if="$check_field('get','donation_amount')">{{ form['${obj.name}'] }}</span>
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
				url_get_obj: "~/api/donation_information/get_obj?",
				url_add: "~/api/donation_information/add?",
				url_set: "~/api/donation_information/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"rescue_title": "",
							"title_no": "",
							"application_user": 0,
							"assistance_needs": "",
							"donor_users": 0,
							"donations": "",
							"donation_amount": 0,
						"donation_information_id": 0,
				},

				obj: {
						"rescue_title":  '', // 救助标题
							"title_no":  '', // 标题编号
							"application_user": 0, // 申请用户
							"assistance_needs":  '', // 救助需求
							"donor_users": 0, // 捐助用户
							"donations":  '', // 捐助物品
							"donation_amount":  0, // 捐助金额
						"donation_information_id": 0,
				},

				// 表单字段
				form: {
						"rescue_title":  '', // 救助标题
							"title_no":  '', // 标题编号
							"application_user": 0, // 申请用户
							"assistance_needs":  '', // 救助需求
							"donor_users": 0, // 捐助用户
							"donations":  '', // 捐助物品
							"donation_amount":  0, // 捐助金额
						"donation_information_id": 0,
				},
				disabledObj:{
						"rescue_title_isDisabled": false,
							"title_no_isDisabled": false,
							"application_user_isDisabled": false,
							"assistance_needs_isDisabled": false,
							"donor_users_isDisabled": false,
							"donations_isDisabled": false,
							},

										// 用户列表
				list_user_application_user: [],
									// 用户列表
				list_user_donor_users: [],
					
				// ID字段
				field: "donation_information_id",

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
					async get_user_session_donor_users(){
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
								_this.form["donor_users"] = user_id
								_this.disabledObj['donor_users' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "donor_users") {
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
				this.$post("~/api/donation_information/upload?", form, (res) => {
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
												this.get_list_user_application_user();
									this.get_user_session_donor_users();
					this.get_list_user_donor_users();
									},
	}
</script>

<style>




</style>
