<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="宠物百科"
				source_table="article"
			  ></list_result_search>

				<!-- 论坛搜索结果 -->
			  <list_result_search
				:list="result_forum"
				title="交流论坛"
				source_table="forum"
			  ></list_result_search>

						  <list_result_search
				v-if="$check_action('/ordinary_users/list', 'get')"
				:list="result_ordinary_users_user_name"
				title="普通用户用户姓名"
				source_table="ordinary_users"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/ordinary_users/list', 'get')"
				:list="result_ordinary_users_user_gender"
				title="普通用户用户性别"
				source_table="ordinary_users"
			  ></list_result_search>
									  <list_result_search
				v-if="$check_action('/type_of_pet/list', 'get')"
				:list="result_type_of_pet_type_of_pet"
				title="宠物类型宠物类型"
				source_table="type_of_pet"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/pet_information/list', 'get')"
				:list="result_pet_information_type_of_pet"
				title="宠物信息宠物类型"
				source_table="pet_information"
			  ></list_result_search>
																				  <list_result_search
				v-if="$check_action('/pet_information/list', 'get')"
				:list="result_pet_information_adoption_status"
				title="宠物信息领养状态"
				source_table="pet_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/pet_information/list', 'get')"
				:list="result_pet_information_disease_or_not"
				title="宠物信息是否疾病"
				source_table="pet_information"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/adoption_information/list', 'get')"
				:list="result_adoption_information_pet_name"
				title="领养信息宠物名称"
				source_table="adoption_information"
			  ></list_result_search>
																							  <list_result_search
				v-if="$check_action('/adoption_information/list', 'get')"
				:list="result_adoption_information_adoption_mode"
				title="领养信息领养方式"
				source_table="adoption_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/adoption_information/list', 'get')"
				:list="result_adoption_information_date_of_adoption"
				title="领养信息领养日期"
				source_table="adoption_information"
			  ></list_result_search>
																											  <list_result_search
				v-if="$check_action('/rescue_base/list', 'get')"
				:list="result_rescue_base_rescue_title"
				title="救助基地救助标题"
				source_table="rescue_base"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/donation_information/list', 'get')"
				:list="result_donation_information_rescue_title"
				title="捐助信息救助标题"
				source_table="donation_information"
			  ></list_result_search>
																														  <list_result_search
				v-if="$check_action('/message_feedback/list', 'get')"
				:list="result_message_feedback_user_name"
				title="留言反馈用户姓名"
				source_table="message_feedback"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/message_feedback/list', 'get')"
				:list="result_message_feedback_message_title"
				title="留言反馈留言标题"
				source_table="message_feedback"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/message_feedback/list', 'get')"
				:list="result_message_feedback_message_date"
				title="留言反馈留言日期"
				source_table="message_feedback"
			  ></list_result_search>
																		  <list_result_search
				v-if="$check_action('/message_notification/list', 'get')"
				:list="result_message_notification_reminder_date"
				title="消息通知提醒日期"
				source_table="message_notification"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/pet_daily/list', 'get')"
				:list="result_pet_daily_pet_name"
				title="宠物日常宠物名称"
				source_table="pet_daily"
			  ></list_result_search>
																										  <list_result_search
				v-if="$check_action('/pet_daily/list', 'get')"
				:list="result_pet_daily_report_date"
				title="宠物日常报告日期"
				source_table="pet_daily"
			  ></list_result_search>
												</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
	  "result_forum": [],
						"result_ordinary_users_user_name":[],
								"result_ordinary_users_user_gender":[],
									"result_type_of_pet_type_of_pet":[],
												"result_pet_information_type_of_pet":[],
																				"result_pet_information_adoption_status":[],
											"result_pet_information_disease_or_not":[],
												"result_adoption_information_pet_name":[],
																							"result_adoption_information_adoption_mode":[],
								"result_adoption_information_date_of_adoption":[],
																											"result_rescue_base_rescue_title":[],
																														"result_donation_information_rescue_title":[],
																														"result_message_feedback_user_name":[],
								"result_message_feedback_message_title":[],
								"result_message_feedback_message_date":[],
																		"result_message_notification_reminder_date":[],
												"result_pet_daily_pet_name":[],
																										"result_pet_daily_report_date":[],
										};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},
	/**
	 * 获取交流论坛
	 */
	get_forum() {
	  this.$get("~/api/forum/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_forum = json.result.list;
		}
	  });
	},

				/**
	 * 获取user_name
	 */
	get_ordinary_users_user_name(){
		this.$get("~/api/ordinary_users/get_list?like=0", { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_ordinary_users_user_name = json.result.list;
			result_ordinary_users_user_name.map(o => o.title = o['user_name'])
	  			this.result_ordinary_users_user_name = result_ordinary_users_user_name
		 	}
		});
	},
						/**
	 * 获取user_gender
	 */
	get_ordinary_users_user_gender(){
		this.$get("~/api/ordinary_users/get_list?like=0", { page: 1, size: 10, "user_gender": this.query.word }, (json) => {
		  if (json.result) {
			var result_ordinary_users_user_gender = json.result.list;
			result_ordinary_users_user_gender.map(o => o.title = o['user_gender'])
	  			this.result_ordinary_users_user_gender = result_ordinary_users_user_gender
		 	}
		});
	},
							/**
	 * 获取type_of_pet
	 */
	get_type_of_pet_type_of_pet(){
		this.$get("~/api/type_of_pet/get_list?like=0", { page: 1, size: 10, "type_of_pet": this.query.word }, (json) => {
		  if (json.result) {
			var result_type_of_pet_type_of_pet = json.result.list;
			result_type_of_pet_type_of_pet.map(o => o.title = o['type_of_pet'])
	  			this.result_type_of_pet_type_of_pet = result_type_of_pet_type_of_pet
		 	}
		});
	},
										/**
	 * 获取type_of_pet
	 */
	get_pet_information_type_of_pet(){
		this.$get("~/api/pet_information/get_list?like=0", { page: 1, size: 10, "type_of_pet": this.query.word }, (json) => {
		  if (json.result) {
			var result_pet_information_type_of_pet = json.result.list;
			result_pet_information_type_of_pet.map(o => o.title = o['type_of_pet'])
	  			this.result_pet_information_type_of_pet = result_pet_information_type_of_pet
		 	}
		});
	},
																		/**
	 * 获取adoption_status
	 */
	get_pet_information_adoption_status(){
		this.$get("~/api/pet_information/get_list?like=0", { page: 1, size: 10, "adoption_status": this.query.word }, (json) => {
		  if (json.result) {
			var result_pet_information_adoption_status = json.result.list;
			result_pet_information_adoption_status.map(o => o.title = o['adoption_status'])
	  			this.result_pet_information_adoption_status = result_pet_information_adoption_status
		 	}
		});
	},
									/**
	 * 获取disease_or_not
	 */
	get_pet_information_disease_or_not(){
		this.$get("~/api/pet_information/get_list?like=0", { page: 1, size: 10, "disease_or_not": this.query.word }, (json) => {
		  if (json.result) {
			var result_pet_information_disease_or_not = json.result.list;
			result_pet_information_disease_or_not.map(o => o.title = o['disease_or_not'])
	  			this.result_pet_information_disease_or_not = result_pet_information_disease_or_not
		 	}
		});
	},
										/**
	 * 获取pet_name
	 */
	get_adoption_information_pet_name(){
		this.$get("~/api/adoption_information/get_list?like=0", { page: 1, size: 10, "pet_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_adoption_information_pet_name = json.result.list;
			result_adoption_information_pet_name.map(o => o.title = o['pet_name'])
	  			this.result_adoption_information_pet_name = result_adoption_information_pet_name
		 	}
		});
	},
																					/**
	 * 获取adoption_mode
	 */
	get_adoption_information_adoption_mode(){
		this.$get("~/api/adoption_information/get_list?like=0", { page: 1, size: 10, "adoption_mode": this.query.word }, (json) => {
		  if (json.result) {
			var result_adoption_information_adoption_mode = json.result.list;
			result_adoption_information_adoption_mode.map(o => o.title = o['adoption_mode'])
	  			this.result_adoption_information_adoption_mode = result_adoption_information_adoption_mode
		 	}
		});
	},
						/**
	 * 获取date_of_adoption
	 */
	get_adoption_information_date_of_adoption(){
		this.$get("~/api/adoption_information/get_list?like=0", { page: 1, size: 10, "date_of_adoption": this.query.word }, (json) => {
		  if (json.result) {
			var result_adoption_information_date_of_adoption = json.result.list;
			result_adoption_information_date_of_adoption.map(o => o.title = o['date_of_adoption'])
	  			this.result_adoption_information_date_of_adoption = result_adoption_information_date_of_adoption
		 	}
		});
	},
																									/**
	 * 获取rescue_title
	 */
	get_rescue_base_rescue_title(){
		this.$get("~/api/rescue_base/get_list?like=0", { page: 1, size: 10, "rescue_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_rescue_base_rescue_title = json.result.list;
			result_rescue_base_rescue_title.map(o => o.title = o['rescue_title'])
	  			this.result_rescue_base_rescue_title = result_rescue_base_rescue_title
		 	}
		});
	},
																												/**
	 * 获取rescue_title
	 */
	get_donation_information_rescue_title(){
		this.$get("~/api/donation_information/get_list?like=0", { page: 1, size: 10, "rescue_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_donation_information_rescue_title = json.result.list;
			result_donation_information_rescue_title.map(o => o.title = o['rescue_title'])
	  			this.result_donation_information_rescue_title = result_donation_information_rescue_title
		 	}
		});
	},
																												/**
	 * 获取user_name
	 */
	get_message_feedback_user_name(){
		this.$get("~/api/message_feedback/get_list?like=0", { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_message_feedback_user_name = json.result.list;
			result_message_feedback_user_name.map(o => o.title = o['user_name'])
	  			this.result_message_feedback_user_name = result_message_feedback_user_name
		 	}
		});
	},
						/**
	 * 获取message_title
	 */
	get_message_feedback_message_title(){
		this.$get("~/api/message_feedback/get_list?like=0", { page: 1, size: 10, "message_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_message_feedback_message_title = json.result.list;
			result_message_feedback_message_title.map(o => o.title = o['message_title'])
	  			this.result_message_feedback_message_title = result_message_feedback_message_title
		 	}
		});
	},
						/**
	 * 获取message_date
	 */
	get_message_feedback_message_date(){
		this.$get("~/api/message_feedback/get_list?like=0", { page: 1, size: 10, "message_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_message_feedback_message_date = json.result.list;
			result_message_feedback_message_date.map(o => o.title = o['message_date'])
	  			this.result_message_feedback_message_date = result_message_feedback_message_date
		 	}
		});
	},
																/**
	 * 获取reminder_date
	 */
	get_message_notification_reminder_date(){
		this.$get("~/api/message_notification/get_list?like=0", { page: 1, size: 10, "reminder_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_message_notification_reminder_date = json.result.list;
			result_message_notification_reminder_date.map(o => o.title = o['reminder_date'])
	  			this.result_message_notification_reminder_date = result_message_notification_reminder_date
		 	}
		});
	},
										/**
	 * 获取pet_name
	 */
	get_pet_daily_pet_name(){
		this.$get("~/api/pet_daily/get_list?like=0", { page: 1, size: 10, "pet_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_pet_daily_pet_name = json.result.list;
			result_pet_daily_pet_name.map(o => o.title = o['pet_name'])
	  			this.result_pet_daily_pet_name = result_pet_daily_pet_name
		 	}
		});
	},
																								/**
	 * 获取report_date
	 */
	get_pet_daily_report_date(){
		this.$get("~/api/pet_daily/get_list?like=0", { page: 1, size: 10, "report_date": this.query.word }, (json) => {
		  if (json.result) {
			var result_pet_daily_report_date = json.result.list;
			result_pet_daily_report_date.map(o => o.title = o['report_date'])
	  			this.result_pet_daily_report_date = result_pet_daily_report_date
		 	}
		});
	},
									
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
	this.get_forum();
					this.get_ordinary_users_user_name();
							this.get_ordinary_users_user_gender();
								this.get_type_of_pet_type_of_pet();
											this.get_pet_information_type_of_pet();
																			this.get_pet_information_adoption_status();
										this.get_pet_information_disease_or_not();
											this.get_adoption_information_pet_name();
																						this.get_adoption_information_adoption_mode();
							this.get_adoption_information_date_of_adoption();
																										this.get_rescue_base_rescue_title();
																													this.get_donation_information_rescue_title();
																													this.get_message_feedback_user_name();
							this.get_message_feedback_message_title();
							this.get_message_feedback_message_date();
																	this.get_message_notification_reminder_date();
											this.get_pet_daily_pet_name();
																									this.get_pet_daily_report_date();
									  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
	  this.get_forum();
				  this.get_ordinary_users_user_name();
						  this.get_ordinary_users_user_gender();
							  this.get_type_of_pet_type_of_pet();
										  this.get_pet_information_type_of_pet();
																		  this.get_pet_information_adoption_status();
									  this.get_pet_information_disease_or_not();
										  this.get_adoption_information_pet_name();
																					  this.get_adoption_information_adoption_mode();
						  this.get_adoption_information_date_of_adoption();
																									  this.get_rescue_base_rescue_title();
																												  this.get_donation_information_rescue_title();
																												  this.get_message_feedback_user_name();
						  this.get_message_feedback_message_title();
						  this.get_message_feedback_message_date();
																  this.get_message_notification_reminder_date();
										  this.get_pet_daily_pet_name();
																								  this.get_pet_daily_report_date();
										},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
