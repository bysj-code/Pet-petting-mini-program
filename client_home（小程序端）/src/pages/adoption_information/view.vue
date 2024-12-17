<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','pet_name') || $check_field('add','pet_name') || $check_field('set','pet_name')" label="宠物名称" name="pet_name">
                                <uni-easyinput type="text" v-model="form['pet_name']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','pet_name')) || (!form['adoption_information_id'] && $check_field('add','pet_name'))" :disabled="disabledObj['pet_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_name')">
                  {{ form['pet_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','type_of_pet') || $check_field('add','type_of_pet') || $check_field('set','type_of_pet')" label="宠物类型" name="type_of_pet">
                                <uni-easyinput type="text" v-model="form['type_of_pet']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','type_of_pet')) || (!form['adoption_information_id'] && $check_field('add','type_of_pet'))" :disabled="disabledObj['type_of_pet_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','type_of_pet')">
                  {{ form['type_of_pet'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_color') || $check_field('add','pet_color') || $check_field('set','pet_color')" label="宠物颜色" name="pet_color">
                                <uni-easyinput type="text" v-model="form['pet_color']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','pet_color')) || (!form['adoption_information_id'] && $check_field('add','pet_color'))" :disabled="disabledObj['pet_color_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_color')">
                  {{ form['pet_color'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_sex') || $check_field('add','pet_sex') || $check_field('set','pet_sex')" label="宠物性别" name="pet_sex">
                                <uni-easyinput type="text" v-model="form['pet_sex']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','pet_sex')) || (!form['adoption_information_id'] && $check_field('add','pet_sex'))" :disabled="disabledObj['pet_sex_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_sex')">
                  {{ form['pet_sex'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_age') || $check_field('add','pet_age') || $check_field('set','pet_age')" label="宠物年龄" name="pet_age">
                                <uni-easyinput type="text" v-model="form['pet_age']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','pet_age')) || (!form['adoption_information_id'] && $check_field('add','pet_age'))" :disabled="disabledObj['pet_age_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_age')">
                  {{ form['pet_age'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoption_address') || $check_field('add','adoption_address') || $check_field('set','adoption_address')" label="领养地址" name="adoption_address">
                                <uni-easyinput type="text" v-model="form['adoption_address']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','adoption_address')) || (!form['adoption_information_id'] && $check_field('add','adoption_address'))" :disabled="disabledObj['adoption_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','adoption_address')">
                  {{ form['adoption_address'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoption_mode') || $check_field('add','adoption_mode') || $check_field('set','adoption_mode')" label="领养方式" name="adoption_mode">
                        <uni-data-select
                  v-model="form.adoption_mode"
                  :localdata="list_adoption_mode"
                  :clear="!disabledObj['adoption_mode_isDisabled']"
                  :disabled="disabledObj['adoption_mode_isDisabled']"
                  v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','adoption_mode')) || (!form['adoption_information_id'] && $check_field('add','adoption_mode'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','adoption_mode')">
                  {{ form['adoption_mode'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','date_of_adoption') || $check_field('add','date_of_adoption') || $check_field('set','date_of_adoption')" label="领养日期" name="date_of_adoption">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','date_of_adoption')) || (!form['adoption_information_id'] && $check_field('add','date_of_adoption'))" v-model="form['date_of_adoption']" type="date" :disabled="disabledObj['date_of_adoption_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','date_of_adoption')">
                  {{ form['date_of_adoption'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoptive_user') || $check_field('add','adoptive_user') || $check_field('set','adoptive_user')" label="领养用户" name="adoptive_user">
                        <uni-data-select
                  id="form_adoptive_user"
                  v-model="form['adoptive_user']"
                  :localdata="list_user_adoptive_user"
                  :clear="!disabledObj['adoptive_user_isDisabled']"
                  :disabled="disabledObj['adoptive_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','adoptive_user')) || (!form['adoption_information_id'] && $check_field('add','adoptive_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['adoptive_user']"
                  :localdata="list_user_adoptive_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','adoptive_user')" id="adoptive_user"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" label="用户姓名" name="user_name">
                                <uni-easyinput type="text" v-model="form['user_name']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','user_name')) || (!form['adoption_information_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','user_name')">
                  {{ form['user_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','id_number') || $check_field('add','id_number') || $check_field('set','id_number')" label="身份证号" name="id_number">
                                <uni-easyinput type="text" v-model="form['id_number']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','id_number')) || (!form['adoption_information_id'] && $check_field('add','id_number'))" :disabled="disabledObj['id_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','id_number')">
                  {{ form['id_number'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" label="联系电话" name="contact_number">
                                <uni-easyinput type="text" v-model="form['contact_number']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','contact_number')) || (!form['adoption_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_number')">
                  {{ form['contact_number'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','user_address') || $check_field('add','user_address') || $check_field('set','user_address')" label="用户住址" name="user_address">
                                <uni-easyinput type="text" v-model="form['user_address']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','user_address')) || (!form['adoption_information_id'] && $check_field('add','user_address'))" :disabled="disabledObj['user_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','user_address')">
                  {{ form['user_address'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoption_information') || $check_field('add','adoption_information') || $check_field('set','adoption_information')" label="领养信息" name="adoption_information">
                        <uni-easyinput type="textarea" v-model="form['adoption_information']" v-if="user_group === '管理员' || (form['adoption_information_id'] && $check_field('set','adoption_information')) || (!form['adoption_information_id'] && $check_field('add','adoption_information'))" :disabled="disabledObj['adoption_information_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','adoption_information')">
                  {{ form['adoption_information'] }}
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
      field: "adoption_information_id",
      url_add: "~/api/adoption_information/add?",
      url_set: "~/api/adoption_information/set?",
      url_get_obj: "~/api/adoption_information/get_obj?",
      url_upload: "~/api/adoption_information/upload?",

      query: {
        "adoption_information_id": 0,
      },

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
                        "adoption_information_id": 0, // ID
                
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
          list_adoption_mode: [],
                                                                    // 用户列表
            list_user_adoptive_user: [],
                        // 用户组
            group_user_adoptive_user: "",
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
            url: _self.$fullUrl('/api/adoption_information/upload?'),
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
            url: _self.$fullUrl('/api/adoption_information/upload?'),
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
                                                                      if (this.form["date_of_adoption"] && JSON.stringify(this.form["date_of_adoption"]).indexOf("-")===-1) {
        this.form["date_of_adoption"] = this.$toTime(parseInt(this.form["date_of_adoption"]), "yyyy-MM-dd")
      }
                                                          uni.db.del("form");
      return param;
    },
        
            
            
            
            
            
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
            /**
     * 获取普通用户用户组
     */
    async get_group_user_adoptive_user() {
      this.form["adoptive_user"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=普通用户");
      if(json.result && json.result.obj){
        this.group_user_adoptive_user = json.result.obj;
        this.get_user_session_adoptive_user(this.form['adoptive_user'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_adoptive_user(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_adoptive_user.source_table+"/get_obj?"
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
                  if (arr[i] !== "adoptive_user") {
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
                                                                      if (this.form["date_of_adoption"] && JSON.stringify(this.form["date_of_adoption"]).indexOf("-")===-1) {
        this.form["date_of_adoption"] = this.$toTime(parseInt(this.form["date_of_adoption"]),"yyyy-MM-dd")
      }
                                                        },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/adoption_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/adoption_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/adoption_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/adoption_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/adoption_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                                                        this.get_list_adoption_mode();
                            this.get_list_user_adoptive_user();
            this.get_group_user_adoptive_user();
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
