<template>
	<div class="diy_list page_pet_information" id="pet_information_list">
		<div class="warp">
			<div class="container diy_list_container">
				<div class="diy_list_title">
					<div class="col">
						<span class="title">宠物信息列表</span>
					</div>
				</div>
				<div class="row diy_list_search">
					<div class="col">
						<!-- 搜索栏 -->
						<div class="view">
							<span class="diy_list_search_title">关键字搜索：</span>
									<b-form-input size="sm" class="mr-sm-2" placeholder="宠物类型搜索" v-model="query['type_of_pet']" />
													<b-form-input size="sm" class="mr-sm-2" placeholder="领养状态搜索" v-model="query['adoption_status']" />
										<b-form-input size="sm" class="mr-sm-2" placeholder="是否疾病搜索" v-model="query['disease_or_not']" />
									<b-button size="sm" @click="search()" >
								<b-icon icon="search"/>
							</b-button>
						</div>
						<!-- /搜索栏 -->
					</div>
				</div>
				<div class="diy_list_select_box">
					<span class="diy_list_select_title">下拉搜索：</span>
						<div class="diy_list_dropdown_box">
						<div class="col">
							<!-- 筛选 -->
							<div class="view">
												<b-dropdown text="宠物类型" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','type_of_pet')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o, i) in list_type_of_pet" :key="i" @click="filter_set(o['type_of_pet'],'type_of_pet')" >
												{{ o['type_of_pet'] }}
										</b-dropdown-item>
								</b-dropdown>
																		<b-dropdown :text="title" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','adoption_status')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o,i) in list_adoption_status" @click="filter_set(o,'adoption_status')" >
										{{ o }}
										</b-dropdown-item>
								</b-dropdown>
															<b-dropdown :text="title" variant="outline-dark" left>
									<b-dropdown-item @click="filter_set('全部','disease_or_not')">全部</b-dropdown-item>
										<b-dropdown-item v-for="(o,i) in list_disease_or_not" @click="filter_set(o,'disease_or_not')" >
										{{ o }}
										</b-dropdown-item>
								</b-dropdown>
											</div>
							<!-- /筛选 -->
						</div>
					</div>
					<div class="diy_list_sort_box">
						<div class="col">
							<!-- 排序 -->
							<div class="view">
								<b-dropdown text="排序" variant="outline-dark" left>
										<b-dropdown-item v-for="(o, i) in list_sort" :key="i" @click="set_sort(o)" >
												{{ o.name }}
										</b-dropdown-item>
								</b-dropdown>
							</div>
							<!--/排序 -->
						</div>
					</div>
				</div>

				<div class="row diy_list_box">
					<div class="col">
						<!-- 列表 -->
						<list_pet_information :list="list" />
						<!-- /列表 -->
					</div>
				</div>
				<div class="row diy_list_page_box">
					<div class="col overflow-auto flex_cc">
						<!-- 分页器 -->
<!--						<diy_pager v-model="query['page']" :size="query['size']" :count="count" v-on:toPage="toPage" v-on:toSize="toSize" ></diy_pager>-->
            <b-pagination
                v-model="query.page"
                :total-rows="count"
                :per-page="query.size"
                @change="goToPage"
            />
						<!-- /分页器 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import list_pet_information from "@/components/diy/list_pet_information.vue";
	import diy_pager from "@/components/diy/diy_pager";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			diy_pager,
			list_pet_information
		},
		data() {
			return {
				url_get_list: "~/api/pet_information/get_list?like=0",

				// 查询条件
				query: {
					keyword: "",
					page: 1,
					size: 10,
									"type_of_pet": "", // 宠物类型
															"adoption_status": "", // 领养状态
												"disease_or_not": "", // 是否疾病
								},

				// 排序内容
				list_sort: [{
						name: "创建时间从高到低",
						value: "create_time desc",
					},
					{
						name: "创建时间从低到高",
						value: "create_time asc",
					},
					{
						name: "更新时间从高到低",
						value: "update_time desc",
					},
					{
						name: "更新时间从低到高",
						value: "update_time asc",
					},
							{
						name: "宠物类型正序",
						value: "type_of_pet asc",
					},
					{
						name: "宠物类型倒序",
						value: "type_of_pet desc",
					},
											{
						name: "领养状态正序",
						value: "adoption_status asc",
					},
					{
						name: "领养状态倒序",
						value: "adoption_status desc",
					},
								{
						name: "是否疾病正序",
						value: "disease_or_not asc",
					},
					{
						name: "是否疾病倒序",
						value: "disease_or_not desc",
					},
						],

							// 宠物类型列表
				"list_type_of_pet": [""],
									// 宠物性别列表
				"list_pet_sex": ['公','母'],
											// 领养状态列表
				"list_adoption_status": ['待领养','已被领'],
									// 是否疾病列表
				"list_disease_or_not": ['是','否'],
				
			}
		},
		methods: {
      get_list_before(param) {
      },
			/**
			 * 筛选选择
			 */
			filter_set(o,key) {
			    if (o == "全部") {
			        this.query[key] = "";
			    } else {
			        this.query[key] = o;
			    }
			    this.search();
			},

			/**
			 * 排序
			 */
			set_sort(o) {
			    this.query.orderby = o.value;
			    this.search();
			},


					/**
			 * 获取宠物类型列表
			 */
			async get_list_type_of_pet() {
				var json = await this.$get("~/api/type_of_pet/get_list?");
				if (json.result) {
					this.list_type_of_pet = json.result.list;
				} else if (json.error) {
					console.log(json.error);
				}
			},
									
			/**
			 * 筛选
			 */
							filter_type_of_pet(o) {
				if (o == "全部") {
					this.query["type_of_pet"] = "";
				} else {
					this.query["type_of_pet"] = o;
				}
				this.search();
			},
															filter_adoption_status(o) {
				if (o == "全部") {
					this.query["adoption_status"] = "";
				} else {
					this.query["adoption_status"] = o;
				}
				this.search();
			},
												filter_disease_or_not(o) {
				if (o == "全部") {
					this.query["disease_or_not"] = "";
				} else {
					this.query["disease_or_not"] = o;
				}
				this.search();
			},
									/**
			 * 重置
			 */
			reset() {
								this.query.type_of_pet = ""
														this.query.adoption_status = ""
											this.query.disease_or_not = ""
								this.search();
			},

			// 返回条数
			toSize(i){
				this.query.size = i;
				this.first();
			},

			// 返回页数
			toPage(i){
				this.query.page = i;
				this.first();
			},

      goToPage(v){
        this.query.page = v;
        this.goToNew(v)
      },

		},
		computed: {
		},
		created() {
						/**
			 * 获取宠物类型列表
			 */
			this.get_list_type_of_pet();
																				}
	}
</script>

<style>
</style>
