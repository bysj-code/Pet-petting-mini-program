<template>
	<view class="diy_edit page_adoption_information" id="adoption_information_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','pet_name') || $check_field('add','pet_name') || $check_field('get','pet_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								宠物名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_pet_name" v-model="form['pet_name']" placeholder="请输入宠物名称" v-if="(form['pet_name'] && $check_field('set','pet_name')) || (!form['pet_name'] && $check_field('add','pet_name'))" :disabled="disabledObj['pet_name_isDisabled']" />
							<text v-else-if="$check_field('get','pet_name')">{{ form['pet_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','type_of_pet') || $check_field('add','type_of_pet') || $check_field('get','type_of_pet')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								宠物类型:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_type_of_pet" v-model="form['type_of_pet']" placeholder="请输入宠物类型" v-if="(form['type_of_pet'] && $check_field('set','type_of_pet')) || (!form['type_of_pet'] && $check_field('add','type_of_pet'))" :disabled="disabledObj['type_of_pet_isDisabled']" />
							<text v-else-if="$check_field('get','type_of_pet')">{{ form['type_of_pet'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','pet_color') || $check_field('add','pet_color') || $check_field('get','pet_color')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								宠物颜色:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_pet_color" v-model="form['pet_color']" placeholder="请输入宠物颜色" v-if="(form['pet_color'] && $check_field('set','pet_color')) || (!form['pet_color'] && $check_field('add','pet_color'))" :disabled="disabledObj['pet_color_isDisabled']" />
							<text v-else-if="$check_field('get','pet_color')">{{ form['pet_color'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','pet_sex') || $check_field('add','pet_sex') || $check_field('get','pet_sex')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								宠物性别:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_pet_sex" v-model="form['pet_sex']" placeholder="请输入宠物性别" v-if="(form['pet_sex'] && $check_field('set','pet_sex')) || (!form['pet_sex'] && $check_field('add','pet_sex'))" :disabled="disabledObj['pet_sex_isDisabled']" />
							<text v-else-if="$check_field('get','pet_sex')">{{ form['pet_sex'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','pet_age') || $check_field('add','pet_age') || $check_field('get','pet_age')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								宠物年龄:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_pet_age" v-model="form['pet_age']" placeholder="请输入宠物年龄" v-if="(form['pet_age'] && $check_field('set','pet_age')) || (!form['pet_age'] && $check_field('add','pet_age'))" :disabled="disabledObj['pet_age_isDisabled']" />
							<text v-else-if="$check_field('get','pet_age')">{{ form['pet_age'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','adoption_address') || $check_field('add','adoption_address') || $check_field('get','adoption_address')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								领养地址:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_adoption_address" v-model="form['adoption_address']" placeholder="请输入领养地址" v-if="(form['adoption_address'] && $check_field('set','adoption_address')) || (!form['adoption_address'] && $check_field('add','adoption_address'))" :disabled="disabledObj['adoption_address_isDisabled']" />
							<text v-else-if="$check_field('get','adoption_address')">{{ form['adoption_address'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','adoption_mode') || $check_field('add','adoption_mode') || $check_field('get','adoption_mode')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								领养方式:
							</text>
						</view>
								<!-- 选项 -->
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_adoption_mode"
									v-model="form['adoption_mode']"
									:localdata="list_adoption_mode"
									v-if="(form['adoption_mode'] && $check_field('set','adoption_mode')) || (!form['adoption_mode'] && $check_field('add','adoption_mode'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','adoption_mode')">{{ form['adoption_mode'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','date_of_adoption') || $check_field('add','date_of_adoption') || $check_field('get','date_of_adoption')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								领养日期:
							</text>
						</view>
								<!-- 日期 -->
						<view class="diy_field diy_date">
							<uni-datetime-picker :disabled="disabledObj['date_of_adoption_isDisabled']" type="date" id="form_date_of_adoption" v-model="form['date_of_adoption']" placeholder="请输入领养日期" v-if="(form['date_of_adoption'] && $check_field('set','date_of_adoption')) || (!form['date_of_adoption'] && $check_field('add','date_of_adoption'))" />
							<text v-else-if="$check_field('get','date_of_adoption')">{{ form['date_of_adoption'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','adoptive_user') || $check_field('add','adoptive_user') || $check_field('get','adoptive_user')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								领养用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_adoptive_user"
									v-model="form['adoptive_user']"
									:localdata="list_user_adoptive_user"
									:clear="!disabledObj['adoptive_user_isDisabled']"
									:disabled="disabledObj['adoptive_user_isDisabled']"
									v-if="(form['adoptive_user'] && $check_field('set','adoptive_user')) || (!form['adoptive_user'] && $check_field('add','adoptive_user'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','adoptive_user')">{{ form['adoptive_user'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','user_name') || $check_field('add','user_name') || $check_field('get','user_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								用户姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_user_name" v-model="form['user_name']" placeholder="请输入用户姓名" v-if="(form['user_name'] && $check_field('set','user_name')) || (!form['user_name'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']" />
							<text v-else-if="$check_field('get','user_name')">{{ form['user_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','id_number') || $check_field('add','id_number') || $check_field('get','id_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								身份证号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_id_number" v-model="form['id_number']" placeholder="请输入身份证号" v-if="(form['id_number'] && $check_field('set','id_number')) || (!form['id_number'] && $check_field('add','id_number'))" :disabled="disabledObj['id_number_isDisabled']" />
							<text v-else-if="$check_field('get','id_number')">{{ form['id_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','contact_number') || $check_field('add','contact_number') || $check_field('get','contact_number')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								联系电话:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_contact_number" v-model="form['contact_number']" placeholder="请输入联系电话" v-if="(form['contact_number'] && $check_field('set','contact_number')) || (!form['contact_number'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
							<text v-else-if="$check_field('get','contact_number')">{{ form['contact_number'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','user_address') || $check_field('add','user_address') || $check_field('get','user_address')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								用户住址:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_user_address" v-model="form['user_address']" placeholder="请输入用户住址" v-if="(form['user_address'] && $check_field('set','user_address')) || (!form['user_address'] && $check_field('add','user_address'))" :disabled="disabledObj['user_address_isDisabled']" />
							<text v-else-if="$check_field('get','user_address')">{{ form['user_address'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','adoption_information') || $check_field('add','adoption_information') || $check_field('get','adoption_information')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								领养信息:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_adoption_information" v-model="form['adoption_information']" v-if="(form['adoption_information'] && $check_field('set','adoption_information')) || (!form['adoption_information'] && $check_field('add','adoption_information'))" :disabled="disabledObj['adoption_information_isDisabled']"/>
							<text v-else-if="$check_field('get','adoption_information')">{{ form['adoption_information'] }}</text>
						</view>
							</view>
						<view v-if="user_group === '管理员' || $check_examine()" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								审核状态:
							</text>
						</view>
						<view class="diy_field diy_text diy_text_row diy_select_flex">
							<uni-data-select
									v-model="form['examine_state']"
									:localdata="list_examine_state"
							></uni-data-select>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<text>
								{{ form['examine_state'] }}
							</text>
						</view>
					</view>

				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";
export default {
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/adoption_information/get_obj?",
			url_add:"~/api/adoption_information/add?",
			url_set:"~/api/adoption_information/set?",

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
					"adoption_information_id": 0
			},

			obj: {
					"pet_name":  '', // 宠物名称
						"type_of_pet":  '', // 宠物类型
						"pet_color":  '', // 宠物颜色
						"pet_sex":  '', // 宠物性别
						"pet_age":  '', // 宠物年龄
						"adoption_address":  '', // 领养地址
						"adoption_mode":  '', // 领养方式
						"date_of_adoption": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
						"date_of_adoption": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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

																list_adoption_mode: [],
									// 用户列表
			list_user_adoptive_user: [],
											
			field:"adoption_information_id",
			table_key:"adoption_information",

	list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
		}
	},
	methods: {
			
	
				
	
				
	
				
	
				
	
				
	
				/**
		 * 获取领养方式列表
		 */
		async get_list_adoption_mode() {
					['线上','线下'].map((o) => this.list_adoption_mode.push({value:o,text:o}));
						},
			
	
				
	
					/**
		 * 获取普通用户用户列表
		 */
		async get_list_user_adoptive_user() {
			// if(this.user_group !== "管理员" && this.form["adoptive_user"] === 0) {
			//     this.form["adoptive_user"] = this.user.user_id;
			// }
			var json = await this.$get("~/api/user/get_list?user_group=普通用户");
			if(json.result && json.result.list){
				json.result.list.map((o) => this.list_user_adoptive_user.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
	
	
				
	
				
	
				
	
				
	
				
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
			var _self = this;
			_self.upload_img_flag = false
			// 选择图像方法
			uni.chooseImage({
				count: 1,
				sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
				sourceType: ['album'], //从相册选择
				success: function(res) {
					const tempFilePaths = res.tempFilePaths;
					const uploadTask = uni.uploadFile({
						url: _self.$fullUrl('/api/adoption_information/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'adoption_information': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
						}
					});

					uploadTask.onProgressUpdate(function(res) {
						_self.percent = res.progress;
						console.log('上传进度' + res.progress);
						console.log('已经上传的数据长度' + res.totalBytesSent);
						console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
					});
				},
				error: function(e) {
					console.log(e);
				}
			});
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_before(param){
			var form = uni.db.get("form");
			if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
				this.obj = uni.push(this.obj ,form);
				this.form = uni.push(this.form ,form);
			}
			var arr = []
			for (let key in form) {
				arr.push(key)
			}
			for (var i=0;i<arr.length;i++){
				this.disabledObj[arr[i] + '_isDisabled'] = true
			}
																			if (this.form["date_of_adoption"] && JSON.stringify(this.form["date_of_adoption"]).indexOf("-")===-1) {
				this.form["date_of_adoption"] = this.$toTime(parseInt(this.form["date_of_adoption"]), "yyyy-MM-dd")
			}
																uni.db.del("form");
			return param;
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
																					this.get_list_adoption_mode();
										this.get_user_session_adoptive_user();
				this.get_list_user_adoptive_user();
																	},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
	}
	.btn_add_img{
		color: #D3D3D3;
		text-align: center;
		border: 1px solid #eee;
		height: 5rem;
		width: 5rem;
		position: relative;
	}
	.btn_add_img text{
		font-size: 35px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
	}




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
		border-color: rgb(229, 229, 229);
		background-color: rgb(255, 255, 255);
		border-radius: 4px;
		box-sizing: border-box;
		flex: 1;
		width: 100%;
		line-height: 2;
		font-size: 14px;
		height: 2.4em;
		min-height: 2.4em;
		display: block;
		outline:none;
	}
</style>

