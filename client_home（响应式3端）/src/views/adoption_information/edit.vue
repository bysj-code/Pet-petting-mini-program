<template>
	<div class="diy_edit page_adoption_information" id="adoption_information_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','pet_name') || $check_field('add','pet_name') || $check_field('get','pet_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								宠物名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pet_name" v-model="form['pet_name']" placeholder="请输入宠物名称" v-if="(form['pet_name'] && $check_field('set','pet_name')) || (!form['pet_name'] && $check_field('add','pet_name'))"  :disabled="disabledObj['pet_name_isDisabled']"/>
							<span v-else-if="$check_field('get','pet_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','type_of_pet') || $check_field('add','type_of_pet') || $check_field('get','type_of_pet')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								宠物类型:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_type_of_pet" v-model="form['type_of_pet']" placeholder="请输入宠物类型" v-if="(form['type_of_pet'] && $check_field('set','type_of_pet')) || (!form['type_of_pet'] && $check_field('add','type_of_pet'))"  :disabled="disabledObj['type_of_pet_isDisabled']"/>
							<span v-else-if="$check_field('get','type_of_pet')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','pet_color') || $check_field('add','pet_color') || $check_field('get','pet_color')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								宠物颜色:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pet_color" v-model="form['pet_color']" placeholder="请输入宠物颜色" v-if="(form['pet_color'] && $check_field('set','pet_color')) || (!form['pet_color'] && $check_field('add','pet_color'))"  :disabled="disabledObj['pet_color_isDisabled']"/>
							<span v-else-if="$check_field('get','pet_color')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','pet_sex') || $check_field('add','pet_sex') || $check_field('get','pet_sex')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								宠物性别:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pet_sex" v-model="form['pet_sex']" placeholder="请输入宠物性别" v-if="(form['pet_sex'] && $check_field('set','pet_sex')) || (!form['pet_sex'] && $check_field('add','pet_sex'))"  :disabled="disabledObj['pet_sex_isDisabled']"/>
							<span v-else-if="$check_field('get','pet_sex')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','pet_age') || $check_field('add','pet_age') || $check_field('get','pet_age')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								宠物年龄:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_pet_age" v-model="form['pet_age']" placeholder="请输入宠物年龄" v-if="(form['pet_age'] && $check_field('set','pet_age')) || (!form['pet_age'] && $check_field('add','pet_age'))"  :disabled="disabledObj['pet_age_isDisabled']"/>
							<span v-else-if="$check_field('get','pet_age')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','adoption_address') || $check_field('add','adoption_address') || $check_field('get','adoption_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领养地址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_adoption_address" v-model="form['adoption_address']" placeholder="请输入领养地址" v-if="(form['adoption_address'] && $check_field('set','adoption_address')) || (!form['adoption_address'] && $check_field('add','adoption_address'))"  :disabled="disabledObj['adoption_address_isDisabled']"/>
							<span v-else-if="$check_field('get','adoption_address')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','adoption_mode') || $check_field('add','adoption_mode') || $check_field('get','adoption_mode')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领养方式:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_adoption_mode" v-model="form['adoption_mode']" v-if="(form['adoption_mode'] && $check_field('set','adoption_mode')) || (!form['adoption_mode'] && $check_field('add','adoption_mode'))" >
								<option v-for="o in list_adoption_mode" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','adoption_mode')">{{ form['adoption_mode'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','date_of_adoption') || $check_field('add','date_of_adoption') || $check_field('get','date_of_adoption')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领养日期:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['date_of_adoption_isDisabled']" id="form_date_of_adoption" v-model="form['date_of_adoption']" placeholder="请输入领养日期" v-if="(form['date_of_adoption'] && $check_field('set','date_of_adoption')) || (!form['date_of_adoption'] && $check_field('add','date_of_adoption'))" />
							<span v-else-if="$check_field('get','date_of_adoption')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','adoptive_user') || $check_field('add','adoptive_user') || $check_field('get','adoptive_user')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领养用户:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_adoptive_user" :disabled="disabledObj['adoptive_user_isDisabled']" v-model="form['adoptive_user']" v-if="(form['adoptive_user'] && $check_field('set','adoptive_user')) || (!form['adoptive_user'] && $check_field('add','adoptive_user'))" >
								<option v-for="o in list_user_adoptive_user" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','adoptive_user')">{{ form['adoptive_user'] }}</span>
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
							<div v-if="$check_field('set','id_number') || $check_field('add','id_number') || $check_field('get','id_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								身份证号:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_id_number" v-model="form['id_number']" placeholder="请输入身份证号" v-if="(form['id_number'] && $check_field('set','id_number')) || (!form['id_number'] && $check_field('add','id_number'))"  :disabled="disabledObj['id_number_isDisabled']"/>
							<span v-else-if="$check_field('get','id_number')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','contact_number') || $check_field('add','contact_number') || $check_field('get','contact_number')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								联系电话:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_contact_number" v-model="form['contact_number']" placeholder="请输入联系电话" v-if="(form['contact_number'] && $check_field('set','contact_number')) || (!form['contact_number'] && $check_field('add','contact_number'))"  :disabled="disabledObj['contact_number_isDisabled']"/>
							<span v-else-if="$check_field('get','contact_number')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','user_address') || $check_field('add','user_address') || $check_field('get','user_address')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								用户住址:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_user_address" v-model="form['user_address']" placeholder="请输入用户住址" v-if="(form['user_address'] && $check_field('set','user_address')) || (!form['user_address'] && $check_field('add','user_address'))"  :disabled="disabledObj['user_address_isDisabled']"/>
							<span v-else-if="$check_field('get','user_address')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','adoption_information') || $check_field('add','adoption_information') || $check_field('get','adoption_information')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								领养信息:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_adoption_information" v-model="form['adoption_information']" v-if="(form['adoption_information'] && $check_field('set','adoption_information')) || (!form['adoption_information'] && $check_field('add','adoption_information'))" :disabled="disabledObj['adoption_information_isDisabled']" />
							<span v-else-if="$check_field('get','adoption_information')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
	


					<div v-if="user_group === '管理员' || $check_examine()" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								审核状态:
							</span>
						</div>
						<div class="diy_field diy_select" v-if="$check_action('/adoption_information/edit','examine')">
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
				url_get_obj: "~/api/adoption_information/get_obj?",
				url_add: "~/api/adoption_information/add?",
				url_set: "~/api/adoption_information/set?",

				// 登录权限
				oauth: {
					"signIn": true,
					"user_group": []
				},

				// 查询条件
				query: {
						"pet_name": "",
							"type_of_pet": "",
							"pet_color": "",
							"pet_sex": "",
							"pet_age": "",
							"adoption_address": "",
							"adoption_mode": "",
							"date_of_adoption": "",
							"adoptive_user": 0,
							"user_name": "",
							"id_number": "",
							"contact_number": "",
							"user_address": "",
							"adoption_information": "",
						"adoption_information_id": 0,
				},

				obj: {
						"pet_name":  '', // 宠物名称
							"type_of_pet":  '', // 宠物类型
							"pet_color":  '', // 宠物颜色
							"pet_sex":  '', // 宠物性别
							"pet_age":  '', // 宠物年龄
							"adoption_address":  '', // 领养地址
							"adoption_mode":  '', // 领养方式
							"date_of_adoption": new Date().getTime(),
							"adoptive_user": 0, // 领养用户
							"user_name":  '', // 用户姓名
							"id_number":  '', // 身份证号
							"contact_number":  '', // 联系电话
							"user_address":  '', // 用户住址
							"adoption_information":  '', // 领养信息
						"examine_state": "未审核",
					"adoption_information_id": 0,
				},

				// 表单字段
				form: {
						"pet_name":  '', // 宠物名称
							"type_of_pet":  '', // 宠物类型
							"pet_color":  '', // 宠物颜色
							"pet_sex":  '', // 宠物性别
							"pet_age":  '', // 宠物年龄
							"adoption_address":  '', // 领养地址
							"adoption_mode":  '', // 领养方式
							"date_of_adoption": new Date().getTime(),
							"adoptive_user": 0, // 领养用户
							"user_name":  '', // 用户姓名
							"id_number":  '', // 身份证号
							"contact_number":  '', // 联系电话
							"user_address":  '', // 用户住址
							"adoption_information":  '', // 领养信息
						"examine_state": "未审核",
					"adoption_information_id": 0,
				},
				disabledObj:{
						"pet_name_isDisabled": false,
							"type_of_pet_isDisabled": false,
							"pet_color_isDisabled": false,
							"pet_sex_isDisabled": false,
							"pet_age_isDisabled": false,
							"adoption_address_isDisabled": false,
							"adoption_mode_isDisabled": false,
							"date_of_adoption_isDisabled": false,
							"adoptive_user_isDisabled": false,
							"user_name_isDisabled": false,
							"id_number_isDisabled": false,
							"contact_number_isDisabled": false,
							"user_address_isDisabled": false,
							"adoption_information_isDisabled": false,
					},

																	// 领养方式选项列表
				list_adoption_mode: ['线上','线下'],
										// 用户列表
				list_user_adoptive_user: [],
											
				// ID字段
				field: "adoption_information_id",

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
					async get_user_session_adoptive_user(){
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
								_this.form["adoptive_user"] = user_id
								_this.disabledObj['adoptive_user' + '_isDisabled'] = true
								for (var i=0;i<arr.length;i++){
                  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                    for (var j = 0; j < arrForm.length; j++) {
                      if (arr[i] === arrForm[j]) {
                        if (arr[i] !== "adoptive_user") {
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
				this.$post("~/api/adoption_information/upload?", form, (res) => {
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
																        if (JSON.stringify(this.form["date_of_adoption"]).indexOf("-")===-1) {
          this.form["date_of_adoption"] = this.$toTime(parseInt(this.form["date_of_adoption"]), "yyyy-MM-dd")
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
																													this.get_user_session_adoptive_user();
					this.get_list_user_adoptive_user();
																		},
	}
</script>

<style>




</style>
