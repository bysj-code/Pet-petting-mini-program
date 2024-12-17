<template>
	<view class="diy_edit page_donation_information" id="donation_information_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','rescue_title') || $check_field('add','rescue_title') || $check_field('get','rescue_title')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								救助标题:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_rescue_title" v-model="form['rescue_title']" placeholder="请输入救助标题" v-if="(form['rescue_title'] && $check_field('set','rescue_title')) || (!form['rescue_title'] && $check_field('add','rescue_title'))" :disabled="disabledObj['rescue_title_isDisabled']" />
							<text v-else-if="$check_field('get','rescue_title')">{{ form['rescue_title'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','title_no') || $check_field('add','title_no') || $check_field('get','title_no')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								标题编号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_title_no" v-model="form['title_no']" placeholder="请输入标题编号" v-if="(form['title_no'] && $check_field('set','title_no')) || (!form['title_no'] && $check_field('add','title_no'))" :disabled="disabledObj['title_no_isDisabled']" />
							<text v-else-if="$check_field('get','title_no')">{{ form['title_no'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','application_user') || $check_field('add','application_user') || $check_field('get','application_user')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								申请用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_application_user"
									v-model="form['application_user']"
									:localdata="list_user_application_user"
									:clear="!disabledObj['application_user_isDisabled']"
									:disabled="disabledObj['application_user_isDisabled']"
									v-if="(form['application_user'] && $check_field('set','application_user')) || (!form['application_user'] && $check_field('add','application_user'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','application_user')">{{ form['application_user'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','assistance_needs') || $check_field('add','assistance_needs') || $check_field('get','assistance_needs')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								救助需求:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_assistance_needs" v-model="form['assistance_needs']" v-if="(form['assistance_needs'] && $check_field('set','assistance_needs')) || (!form['assistance_needs'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']"/>
							<text v-else-if="$check_field('get','assistance_needs')">{{ form['assistance_needs'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','donor_users') || $check_field('add','donor_users') || $check_field('get','donor_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								捐助用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_donor_users"
									v-model="form['donor_users']"
									:localdata="list_user_donor_users"
									:clear="!disabledObj['donor_users_isDisabled']"
									:disabled="disabledObj['donor_users_isDisabled']"
									v-if="(form['donor_users'] && $check_field('set','donor_users')) || (!form['donor_users'] && $check_field('add','donor_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','donor_users')">{{ form['donor_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','donations') || $check_field('add','donations') || $check_field('get','donations')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								捐助物品:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_donations" v-model="form['donations']" placeholder="请输入捐助物品" v-if="(form['donations'] && $check_field('set','donations')) || (!form['donations'] && $check_field('add','donations'))" :disabled="disabledObj['donations_isDisabled']" />
							<text v-else-if="$check_field('get','donations')">{{ form['donations'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','donation_amount') || $check_field('add','donation_amount') || $check_field('get','donation_amount')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								捐助金额:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_donation_amount" v-model="form['donation_amount']" placeholder="请输入捐助金额" v-if="(form['donation_amount'] && $check_field('set','donation_amount')) || (!form['donation_amount'] && $check_field('add','donation_amount'))" :disabled="disabledObj['donation_amount_isDisabled']" />
							<text v-else-if="$check_field('get','donation_amount')">{{ form['donation_amount'] }}</text>
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
			url_get_obj:"~/api/donation_information/get_obj?",
			url_add:"~/api/donation_information/add?",
			url_set:"~/api/donation_information/set?",

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
					"donation_information_id": 0
			},

			obj: {
					"rescue_title":  '', // 救助标题
						"title_no":  '', // 标题编号
						"application_user": 0, // 申请用户
						"assistance_needs":  '', // 救助需求
						"donor_users": 0, // 捐助用户
						"donations":  '', // 捐助物品
						"donation_amount":  0 , // 捐助金额
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
						"donation_amount":  0 , // 捐助金额
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
					
			field:"donation_information_id",
			table_key:"donation_information",

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
				json.result.list.map((o) => this.list_user_application_user.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
				json.result.list.map((o) => this.list_user_donor_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
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
						url: _self.$fullUrl('/api/donation_information/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'donation_information': 'test'
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
											this.get_list_user_application_user();
								this.get_user_session_donor_users();
				this.get_list_user_donor_users();
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

