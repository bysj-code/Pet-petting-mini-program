<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','pet_name') || $check_field('add','pet_name') || $check_field('set','pet_name')" label="宠物名称" name="pet_name">
                                <uni-easyinput type="text" v-model="form['pet_name']" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_name')) || (!form['pet_information_id'] && $check_field('add','pet_name'))" :disabled="disabledObj['pet_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_name')">
                  {{ form['pet_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','type_of_pet') || $check_field('add','type_of_pet') || $check_field('set','type_of_pet')" label="宠物类型" name="type_of_pet">
                        <uni-data-select
                  v-model="form.type_of_pet"
                  :localdata="list_type_of_pet"
                  :clear="!disabledObj['type_of_pet_isDisabled']"
                  :disabled="disabledObj['type_of_pet_isDisabled']"
                  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','type_of_pet')) || (!form['pet_information_id'] && $check_field('add','type_of_pet'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','type_of_pet')">
                  {{ form['type_of_pet'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_color') || $check_field('add','pet_color') || $check_field('set','pet_color')" label="宠物颜色" name="pet_color">
                                <uni-easyinput type="text" v-model="form['pet_color']" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_color')) || (!form['pet_information_id'] && $check_field('add','pet_color'))" :disabled="disabledObj['pet_color_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_color')">
                  {{ form['pet_color'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_sex') || $check_field('add','pet_sex') || $check_field('set','pet_sex')" label="宠物性别" name="pet_sex">
                        <uni-data-select
                  v-model="form.pet_sex"
                  :localdata="list_pet_sex"
                  :clear="!disabledObj['pet_sex_isDisabled']"
                  :disabled="disabledObj['pet_sex_isDisabled']"
                  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_sex')) || (!form['pet_information_id'] && $check_field('add','pet_sex'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_sex')">
                  {{ form['pet_sex'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_age') || $check_field('add','pet_age') || $check_field('set','pet_age')" label="宠物年龄" name="pet_age">
                                <uni-easyinput type="text" v-model="form['pet_age']" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','pet_age')) || (!form['pet_information_id'] && $check_field('add','pet_age'))" :disabled="disabledObj['pet_age_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','pet_age')">
                  {{ form['pet_age'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pet_pictures') || $check_field('add','pet_pictures') || $check_field('set','pet_pictures')" label="宠物图片" name="pet_pictures">
                        <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['pet_pictures'] && $check_field('set','pet_pictures')">
                  <image v-if="disabledObj['pet_pictures_isDisabled']" :src="$fullUrl(form['pet_pictures'])" />
                  <image v-if="!disabledObj['pet_pictures_isDisabled']" :src="$fullUrl(form['pet_pictures'])" @click="change_img('pet_pictures')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['pet_pictures'] && $check_field('add','pet_pictures')">
                  <view v-if="disabledObj['pet_pictures_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['pet_pictures_isDisabled']" class="btn_add_img" @click="change_img('pet_pictures')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','pet_pictures')">
                  <image :src="$fullUrl(form['pet_pictures'])" />
                </view>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoption_status') || $check_field('add','adoption_status') || $check_field('set','adoption_status')" label="领养状态" name="adoption_status">
                        <uni-data-select
                  v-model="form.adoption_status"
                  :localdata="list_adoption_status"
                  :clear="!disabledObj['adoption_status_isDisabled']"
                  :disabled="disabledObj['adoption_status_isDisabled']"
                  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','adoption_status')) || (!form['pet_information_id'] && $check_field('add','adoption_status'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','adoption_status')">
                  {{ form['adoption_status'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','adoption_address') || $check_field('add','adoption_address') || $check_field('set','adoption_address')" label="领养地址" name="adoption_address">
                                <uni-easyinput type="text" v-model="form['adoption_address']" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','adoption_address')) || (!form['pet_information_id'] && $check_field('add','adoption_address'))" :disabled="disabledObj['adoption_address_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','adoption_address')">
                  {{ form['adoption_address'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','disease_or_not') || $check_field('add','disease_or_not') || $check_field('set','disease_or_not')" label="是否疾病" name="disease_or_not">
                        <uni-data-select
                  v-model="form.disease_or_not"
                  :localdata="list_disease_or_not"
                  :clear="!disabledObj['disease_or_not_isDisabled']"
                  :disabled="disabledObj['disease_or_not_isDisabled']"
                  v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','disease_or_not')) || (!form['pet_information_id'] && $check_field('add','disease_or_not'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','disease_or_not')">
                  {{ form['disease_or_not'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','introduction_to_pets') || $check_field('add','introduction_to_pets') || $check_field('set','introduction_to_pets')" label="宠物简介" name="introduction_to_pets">
                        <uni-easyinput type="textarea" v-model="form['introduction_to_pets']" v-if="user_group === '管理员' || (form['pet_information_id'] && $check_field('set','introduction_to_pets')) || (!form['pet_information_id'] && $check_field('add','introduction_to_pets'))" :disabled="disabledObj['introduction_to_pets_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','introduction_to_pets')">
                  {{ form['introduction_to_pets'] }}
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
      field: "pet_information_id",
      url_add: "~/api/pet_information/add?",
      url_set: "~/api/pet_information/set?",
      url_get_obj: "~/api/pet_information/get_obj?",
      url_upload: "~/api/pet_information/upload?",

      query: {
        "pet_information_id": 0,
      },

      form: {
            "pet_name":  '', // 宠物名称
                    "type_of_pet":  '', // 宠物类型
                    "pet_color":  '', // 宠物颜色
                    "pet_sex":  '', // 宠物性别
                    "pet_age":  '', // 宠物年龄
                    "pet_pictures":  '', // 宠物图片
                    "adoption_status":  '', // 领养状态
                    "adoption_address":  '', // 领养地址
                    "disease_or_not":  '', // 是否疾病
                    "introduction_to_pets":  '', // 宠物简介
                                "pet_information_id": 0, // ID
                
              },
          disabledObj:{
                        "pet_name_isDisabled": false,
                                "type_of_pet_isDisabled": false,
                                "pet_color_isDisabled": false,
                                "pet_sex_isDisabled": false,
                                "pet_age_isDisabled": false,
                                "pet_pictures_isDisabled": false,
                                "adoption_status_isDisabled": false,
                                "adoption_address_isDisabled": false,
                                "disease_or_not_isDisabled": false,
                                "introduction_to_pets_isDisabled": false,
                                  },
                                          // 宠物类型选项列表
          list_type_of_pet: [],
                                                          // 宠物性别选项列表
          list_pet_sex: [],
                                                                              // 领养状态选项列表
          list_adoption_status: [],
                                                          // 是否疾病选项列表
          list_disease_or_not: [],
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
            url: _self.$fullUrl('/api/pet_information/upload?'),
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
            url: _self.$fullUrl('/api/pet_information/upload?'),
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
     * 获取宠物类型列表
     */
    async get_list_type_of_pet() {
              var json = await this.$get("~/api/type_of_pet/get_list?");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_type_of_pet.push({value:o.type_of_pet,text:o.type_of_pet}));
      }
      else if(json.error){
        console.error(json.error);
      }
        },
        
            
            /**
     * 获取宠物性别列表
     */
    async get_list_pet_sex() {
          ['公','母'].map((o) => this.list_pet_sex.push({value:o,text:o}));
            },
        
            
            
            /**
     * 获取领养状态列表
     */
    async get_list_adoption_status() {
          ['待领养','已被领'].map((o) => this.list_adoption_status.push({value:o,text:o}));
            },
        
            
            /**
     * 获取是否疾病列表
     */
    async get_list_disease_or_not() {
          ['是','否'].map((o) => this.list_disease_or_not.push({value:o,text:o}));
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
        bl = this.$check_action('/pet_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/pet_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/pet_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/pet_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/pet_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                this.get_list_type_of_pet();
                        this.get_list_pet_sex();
                                this.get_list_adoption_status();
                        this.get_list_disease_or_not();
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
