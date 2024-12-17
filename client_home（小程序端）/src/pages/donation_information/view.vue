<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','rescue_title') || $check_field('add','rescue_title') || $check_field('set','rescue_title')" label="救助标题" name="rescue_title">
                                <uni-easyinput type="text" v-model="form['rescue_title']" v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','rescue_title')) || (!form['donation_information_id'] && $check_field('add','rescue_title'))" :disabled="disabledObj['rescue_title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','rescue_title')">
                  {{ form['rescue_title'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','title_no') || $check_field('add','title_no') || $check_field('set','title_no')" label="标题编号" name="title_no">
                                <uni-easyinput type="text" v-model="form['title_no']" v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','title_no')) || (!form['donation_information_id'] && $check_field('add','title_no'))" :disabled="disabledObj['title_no_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','title_no')">
                  {{ form['title_no'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','application_user') || $check_field('add','application_user') || $check_field('set','application_user')" label="申请用户" name="application_user">
                        <uni-data-select
                  id="form_application_user"
                  v-model="form['application_user']"
                  :localdata="list_user_application_user"
                  :clear="!disabledObj['application_user_isDisabled']"
                  :disabled="disabledObj['application_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','application_user')) || (!form['donation_information_id'] && $check_field('add','application_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['application_user']"
                  :localdata="list_user_application_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','application_user')" id="application_user"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','assistance_needs') || $check_field('add','assistance_needs') || $check_field('set','assistance_needs')" label="救助需求" name="assistance_needs">
                        <uni-easyinput type="textarea" v-model="form['assistance_needs']" v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','assistance_needs')) || (!form['donation_information_id'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','assistance_needs')">
                  {{ form['assistance_needs'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','donor_users') || $check_field('add','donor_users') || $check_field('set','donor_users')" label="捐助用户" name="donor_users">
                        <uni-data-select
                  id="form_donor_users"
                  v-model="form['donor_users']"
                  :localdata="list_user_donor_users"
                  :clear="!disabledObj['donor_users_isDisabled']"
                  :disabled="disabledObj['donor_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donor_users')) || (!form['donation_information_id'] && $check_field('add','donor_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['donor_users']"
                  :localdata="list_user_donor_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','donor_users')" id="donor_users"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','donations') || $check_field('add','donations') || $check_field('set','donations')" label="捐助物品" name="donations">
                                <uni-easyinput type="text" v-model="form['donations']" v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donations')) || (!form['donation_information_id'] && $check_field('add','donations'))" :disabled="disabledObj['donations_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','donations')">
                  {{ form['donations'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','donation_amount') || $check_field('add','donation_amount') || $check_field('set','donation_amount')" label="捐助金额" name="donation_amount">
                                <uni-easyinput type="text" v-model="form['donation_amount']" v-if="user_group === '管理员' || (form['donation_information_id'] && $check_field('set','donation_amount')) || (!form['donation_information_id'] && $check_field('add','donation_amount'))" :disabled="disabledObj['donation_amount_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','donation_amount')">
                  {{ form['donation_amount'] }}
                </text>
                            </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
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
                    "donation_amount":  0 , // 捐助金额
                                "donation_information_id": 0, // ID
                
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
                        // 用户组
            group_user_donor_users: "",
                                                                                  }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
            /**
     * 获取普通用户用户组
     */
    async get_group_user_donor_users() {
      this.form["donor_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
      if(json.result && json.result.obj){
        this.group_user_donor_users = json.result.obj;
        this.get_user_session_donor_users(this.form['donor_users'])
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
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
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

  },
  created() {
                            this.get_list_user_application_user();
                                this.get_list_user_donor_users();
            this.get_group_user_donor_users();
                              },
}
</script>

<style scoped>
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

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
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

.query_option{
  width: 100%;
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
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
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
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
