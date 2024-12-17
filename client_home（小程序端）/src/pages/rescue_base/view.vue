<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','rescue_title') || $check_field('add','rescue_title') || $check_field('set','rescue_title')" label="救助标题" name="rescue_title">
                                <uni-easyinput type="text" v-model="form['rescue_title']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','rescue_title')) || (!form['rescue_base_id'] && $check_field('add','rescue_title'))" :disabled="disabledObj['rescue_title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','rescue_title')">
                  {{ form['rescue_title'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','title_no') || $check_field('add','title_no') || $check_field('set','title_no')" label="标题编号" name="title_no">
                                <uni-easyinput type="text" v-model="form['title_no']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','title_no')) || (!form['rescue_base_id'] && $check_field('add','title_no'))"  :disabled="true" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','title_no')">
                  {{ form['title_no'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','release_date') || $check_field('add','release_date') || $check_field('set','release_date')" label="发布日期" name="release_date">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','release_date')) || (!form['rescue_base_id'] && $check_field('add','release_date'))" v-model="form['release_date']" type="date" :disabled="disabledObj['release_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','release_date')">
                  {{ form['release_date'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','cover_photo') || $check_field('add','cover_photo') || $check_field('set','cover_photo')" label="封面图片" name="cover_photo">
                        <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['cover_photo'] && $check_field('set','cover_photo')">
                  <image v-if="disabledObj['cover_photo_isDisabled']" :src="$fullUrl(form['cover_photo'])" />
                  <image v-if="!disabledObj['cover_photo_isDisabled']" :src="$fullUrl(form['cover_photo'])" @click="change_img('cover_photo')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['cover_photo'] && $check_field('add','cover_photo')">
                  <view v-if="disabledObj['cover_photo_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['cover_photo_isDisabled']" class="btn_add_img" @click="change_img('cover_photo')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','cover_photo')">
                  <image :src="$fullUrl(form['cover_photo'])" />
                </view>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','application_user') || $check_field('add','application_user') || $check_field('set','application_user')" label="申请用户" name="application_user">
                        <uni-data-select
                  id="form_application_user"
                  v-model="form['application_user']"
                  :localdata="list_user_application_user"
                  :clear="!disabledObj['application_user_isDisabled']"
                  :disabled="disabledObj['application_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','application_user')) || (!form['rescue_base_id'] && $check_field('add','application_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['application_user']"
                  :localdata="list_user_application_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','application_user')" id="application_user"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" label="用户姓名" name="user_name">
                                <uni-easyinput type="text" v-model="form['user_name']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','user_name')) || (!form['rescue_base_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','user_name')">
                  {{ form['user_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','animal_information') || $check_field('add','animal_information') || $check_field('set','animal_information')" label="动物信息" name="animal_information">
                        <uni-easyinput type="textarea" v-model="form['animal_information']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','animal_information')) || (!form['rescue_base_id'] && $check_field('add','animal_information'))" :disabled="disabledObj['animal_information_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','animal_information')">
                  {{ form['animal_information'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','assistance_needs') || $check_field('add','assistance_needs') || $check_field('set','assistance_needs')" label="救助需求" name="assistance_needs">
                        <uni-easyinput type="textarea" v-model="form['assistance_needs']" v-if="user_group === '管理员' || (form['rescue_base_id'] && $check_field('set','assistance_needs')) || (!form['rescue_base_id'] && $check_field('add','assistance_needs'))" :disabled="disabledObj['assistance_needs_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','assistance_needs')">
                  {{ form['assistance_needs'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item label="审核状态" name="examine_state">
                <uni-data-select
                    v-model="form['examine_state']"
                    :localdata="list_examine_state"
                    v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())"
                ></uni-data-select>
                <text v-else>{{form["examine_state"]}}</text>
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
                    "release_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
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
                                                                                                  list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
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
            url: _self.$fullUrl('/api/rescue_base/upload?'),
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
            url: _self.$fullUrl('/api/rescue_base/upload?'),
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
                              if (this.form["release_date"] && JSON.stringify(this.form["release_date"]).indexOf("-")===-1) {
        this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]), "yyyy-MM-dd")
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
     * 获取普通用户用户组
     */
    async get_group_user_application_user() {
      this.form["application_user"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
      if(json.result && json.result.obj){
        this.group_user_application_user = json.result.obj;
        this.get_user_session_application_user(this.form['application_user'])
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
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                              if (this.form["release_date"] && JSON.stringify(this.form["release_date"]).indexOf("-")===-1) {
        this.form["release_date"] = this.$toTime(parseInt(this.form["release_date"]),"yyyy-MM-dd")
      }
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

  },
  created() {
                                            this.get_list_user_application_user();
            this.get_group_user_application_user();
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
