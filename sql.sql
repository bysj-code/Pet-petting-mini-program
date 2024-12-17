DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图标：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛分类';
insert into `forum_type` values ('1','分类一','分类一','/article/list?type_id=1','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `forum_type` values ('2','分类二','分类二','/article/list?type_id=2','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `forum_type` values ('3','分类三','分类三','/article/list?type_id=3','0',null,'2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','1');
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '论坛id',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `praise_len` int(10) DEFAULT '0' COMMENT '点赞数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(125) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `img` text COMMENT '封面图',
  `content` longtext COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '发帖人头像：',
  `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '论坛分类：[0,1000]用来搜索指定类型的论坛帖',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='论坛';
insert into `forum` values ('1','100','1','小明','1','150','测试标题','关键字1','描述','#','标签','/upload/forum_1.jpg','<h1>fafgwagbagbwgwag</h1>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','http://localhost:5000/upload/jingdian (11)_15.jpg','分类二');
insert into `forum` values ('2','100','2','小明','0','30','测试标题2','关键字2','dec','#','标签','/upload/forum_2.jpg','<p>测试文章内容2</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类一');
insert into `forum` values ('3','100','2','小红','0','42','测试标题3','关键字3','dec2','#','标签','/upload/forum_3.jpg','<p>测试文章内容3</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类二');
insert into `forum` values ('4','100','2','小红','0','22','测试标题4','关键字4','dec3','#','标签','/upload/forum_4.jpg','<p>测试文章内容4</p>','2023-03-31 18:21:49.0','2023-03-31 18:21:49.0','','分类三');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-03-31 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-03-31 17:35:13.0');
DROP TABLE IF EXISTS `ordinary_users`;
CREATE TABLE `ordinary_users`(ordinary_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (ordinary_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

DROP TABLE IF EXISTS `type_of_pet`;
CREATE TABLE `type_of_pet`(type_of_pet_id int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物类型ID',
`type_of_pet` varchar(64) comment '宠物类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (type_of_pet_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '宠物类型';
insert into `type_of_pet` values (1,'宠物类型1',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (2,'宠物类型2',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (3,'宠物类型3',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (4,'宠物类型4',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (5,'宠物类型5',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (6,'宠物类型6',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (7,'宠物类型7',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `type_of_pet` values (8,'宠物类型8',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');

DROP TABLE IF EXISTS `pet_information`;
CREATE TABLE `pet_information`(pet_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物信息ID',
`pet_name` varchar(64) comment '宠物名称',
`type_of_pet` varchar(64) comment '宠物类型',
`pet_color` varchar(64) comment '宠物颜色',
`pet_sex` varchar(64) comment '宠物性别',
`pet_age` varchar(64) comment '宠物年龄',
`pet_pictures` varchar(255) comment '宠物图片',
`adoption_status` varchar(64) comment '领养状态',
`adoption_address` varchar(64) comment '领养地址',
`disease_or_not` varchar(64) comment '是否疾病',
`introduction_to_pets` text comment '宠物简介',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (pet_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '宠物信息';
insert into `pet_information` values (1,'宠物名称1','宠物类型1','宠物颜色1','宠物性别1','宠物年龄1','/static/upload/1574660801279557633.jpg','领养状态1','领养地址1','是否疾病1','此处可上传文字、图片、视频、超链接、表格等内容区1',940,698,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (2,'宠物名称2','宠物类型2','宠物颜色2','宠物性别2','宠物年龄2','/static/upload/1574660637777199104.jpg','领养状态2','领养地址2','是否疾病2','此处可上传文字、图片、视频、超链接、表格等内容区2',479,705,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (3,'宠物名称3','宠物类型3','宠物颜色3','宠物性别3','宠物年龄3','/static/upload/1574660888659492865.jpg','领养状态3','领养地址3','是否疾病3','此处可上传文字、图片、视频、超链接、表格等内容区3',549,218,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (4,'宠物名称4','宠物类型4','宠物颜色4','宠物性别4','宠物年龄4','/static/upload/1574660449201291265.jpg','领养状态4','领养地址4','是否疾病4','此处可上传文字、图片、视频、超链接、表格等内容区4',285,412,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (5,'宠物名称5','宠物类型5','宠物颜色5','宠物性别5','宠物年龄5','/static/upload/1599234925440008193.jpg','领养状态5','领养地址5','是否疾病5','此处可上传文字、图片、视频、超链接、表格等内容区5',388,137,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (6,'宠物名称6','宠物类型6','宠物颜色6','宠物性别6','宠物年龄6','/static/upload/1574660706718973953.jpg','领养状态6','领养地址6','是否疾病6','此处可上传文字、图片、视频、超链接、表格等内容区6',906,680,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (7,'宠物名称7','宠物类型7','宠物颜色7','宠物性别7','宠物年龄7','/static/upload/1574660509175644161.jpg','领养状态7','领养地址7','是否疾病7','此处可上传文字、图片、视频、超链接、表格等内容区7',871,210,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `pet_information` values (8,'宠物名称8','宠物类型8','宠物颜色8','宠物性别8','宠物年龄8','/static/upload/1574660580185210881.jpg','领养状态8','领养地址8','是否疾病8','此处可上传文字、图片、视频、超链接、表格等内容区8',635,787,0,'2023-03-11 18:08:51','2023-03-11 18:08:51');

DROP TABLE IF EXISTS `adoption_information`;
CREATE TABLE `adoption_information`(adoption_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '领养信息ID',
`pet_name` varchar(64) comment '宠物名称',
`type_of_pet` varchar(64) comment '宠物类型',
`pet_color` varchar(64) comment '宠物颜色',
`pet_sex` varchar(64) comment '宠物性别',
`pet_age` varchar(64) comment '宠物年龄',
`adoption_address` varchar(64) comment '领养地址',
`adoption_mode` varchar(64) comment '领养方式',
`date_of_adoption` date comment '领养日期',
`adoptive_user` int(11) DEFAULT 0 comment '领养用户',
`user_name` varchar(64) comment '用户姓名',
`id_number` varchar(64) comment '身份证号',
`contact_number` varchar(64) comment '联系电话',
`user_address` varchar(64) comment '用户住址',
`adoption_information` text comment '领养信息',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (adoption_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '领养信息';
insert into `adoption_information` values (1,'宠物名称1','宠物类型1','宠物颜色1','宠物性别1','宠物年龄1','领养地址1','领养方式1','2023-03-11',0,'用户姓名1','身份证号1','联系电话1','用户住址1','此处可上传文字、图片、视频、超链接、表格等内容区1','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (2,'宠物名称2','宠物类型2','宠物颜色2','宠物性别2','宠物年龄2','领养地址2','领养方式2','2023-03-11',0,'用户姓名2','身份证号2','联系电话2','用户住址2','此处可上传文字、图片、视频、超链接、表格等内容区2','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (3,'宠物名称3','宠物类型3','宠物颜色3','宠物性别3','宠物年龄3','领养地址3','领养方式3','2023-03-11',0,'用户姓名3','身份证号3','联系电话3','用户住址3','此处可上传文字、图片、视频、超链接、表格等内容区3','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (4,'宠物名称4','宠物类型4','宠物颜色4','宠物性别4','宠物年龄4','领养地址4','领养方式4','2023-03-11',0,'用户姓名4','身份证号4','联系电话4','用户住址4','此处可上传文字、图片、视频、超链接、表格等内容区4','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (5,'宠物名称5','宠物类型5','宠物颜色5','宠物性别5','宠物年龄5','领养地址5','领养方式5','2023-03-11',0,'用户姓名5','身份证号5','联系电话5','用户住址5','此处可上传文字、图片、视频、超链接、表格等内容区5','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (6,'宠物名称6','宠物类型6','宠物颜色6','宠物性别6','宠物年龄6','领养地址6','领养方式6','2023-03-11',0,'用户姓名6','身份证号6','联系电话6','用户住址6','此处可上传文字、图片、视频、超链接、表格等内容区6','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (7,'宠物名称7','宠物类型7','宠物颜色7','宠物性别7','宠物年龄7','领养地址7','领养方式7','2023-03-11',0,'用户姓名7','身份证号7','联系电话7','用户住址7','此处可上传文字、图片、视频、超链接、表格等内容区7','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');
insert into `adoption_information` values (8,'宠物名称8','宠物类型8','宠物颜色8','宠物性别8','宠物年龄8','领养地址8','领养方式8','2023-03-11',0,'用户姓名8','身份证号8','联系电话8','用户住址8','此处可上传文字、图片、视频、超链接、表格等内容区8','未审核',0,'2023-03-11 18:08:51','2023-03-11 18:08:51');

DROP TABLE IF EXISTS `rescue_base`;
CREATE TABLE `rescue_base`(rescue_base_id int(11) NOT NULL AUTO_INCREMENT COMMENT '救助基地ID',
`rescue_title` varchar(64) comment '救助标题',
`title_no` varchar(64) comment '标题编号',
`release_date` date comment '发布日期',
`cover_photo` varchar(255) comment '封面图片',
`application_user` int(11) DEFAULT 0 comment '申请用户',
`user_name` varchar(64) comment '用户姓名',
`animal_information` text comment '动物信息',
`assistance_needs` text comment '救助需求',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (rescue_base_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '救助基地';
insert into `rescue_base` values (1,'救助标题1','标题编号1','2023-03-11','/static/upload/1595320481802616833.jpg',0,'用户姓名1','此处可上传文字、图片、视频、超链接、表格等内容区1','此处可上传文字、图片、视频、超链接、表格等内容区1',650,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (2,'救助标题2','标题编号2','2023-03-11','/static/upload/1595320272003530752.jpg',0,'用户姓名2','此处可上传文字、图片、视频、超链接、表格等内容区2','此处可上传文字、图片、视频、超链接、表格等内容区2',902,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (3,'救助标题3','标题编号3','2023-03-11','/static/upload/1595320226969288704.jpg',0,'用户姓名3','此处可上传文字、图片、视频、超链接、表格等内容区3','此处可上传文字、图片、视频、超链接、表格等内容区3',190,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (4,'救助标题4','标题编号4','2023-03-11','/static/upload/1595320315368439808.jpg',0,'用户姓名4','此处可上传文字、图片、视频、超链接、表格等内容区4','此处可上传文字、图片、视频、超链接、表格等内容区4',575,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (5,'救助标题5','标题编号5','2023-03-11','/static/upload/1595320361103130624.jpg',0,'用户姓名5','此处可上传文字、图片、视频、超链接、表格等内容区5','此处可上传文字、图片、视频、超链接、表格等内容区5',248,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (6,'救助标题6','标题编号6','2023-03-11','/static/upload/1595320415981404160.jpg',0,'用户姓名6','此处可上传文字、图片、视频、超链接、表格等内容区6','此处可上传文字、图片、视频、超链接、表格等内容区6',577,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (7,'救助标题7','标题编号7','2023-03-11','/static/upload/1595320527168208897.jpg',0,'用户姓名7','此处可上传文字、图片、视频、超链接、表格等内容区7','此处可上传文字、图片、视频、超链接、表格等内容区7',439,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `rescue_base` values (8,'救助标题8','标题编号8','2023-03-11','/static/upload/1595320185030443008.jpg',0,'用户姓名8','此处可上传文字、图片、视频、超链接、表格等内容区8','此处可上传文字、图片、视频、超链接、表格等内容区8',846,'未审核',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');

DROP TABLE IF EXISTS `donation_information`;
CREATE TABLE `donation_information`(donation_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '捐助信息ID',
`rescue_title` varchar(64) comment '救助标题',
`title_no` varchar(64) comment '标题编号',
`application_user` int(11) DEFAULT 0 comment '申请用户',
`assistance_needs` text comment '救助需求',
`donor_users` int(11) DEFAULT 0 comment '捐助用户',
`donations` varchar(64) comment '捐助物品',
`donation_amount` int(11) DEFAULT 0 comment '捐助金额',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (donation_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '捐助信息';
insert into `donation_information` values (1,'救助标题1','标题编号1',0,'此处可上传文字、图片、视频、超链接、表格等内容区1',0,'捐助物品1',1,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (2,'救助标题2','标题编号2',0,'此处可上传文字、图片、视频、超链接、表格等内容区2',0,'捐助物品2',2,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (3,'救助标题3','标题编号3',0,'此处可上传文字、图片、视频、超链接、表格等内容区3',0,'捐助物品3',3,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (4,'救助标题4','标题编号4',0,'此处可上传文字、图片、视频、超链接、表格等内容区4',0,'捐助物品4',4,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (5,'救助标题5','标题编号5',0,'此处可上传文字、图片、视频、超链接、表格等内容区5',0,'捐助物品5',5,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (6,'救助标题6','标题编号6',0,'此处可上传文字、图片、视频、超链接、表格等内容区6',0,'捐助物品6',6,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (7,'救助标题7','标题编号7',0,'此处可上传文字、图片、视频、超链接、表格等内容区7',0,'捐助物品7',7,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `donation_information` values (8,'救助标题8','标题编号8',0,'此处可上传文字、图片、视频、超链接、表格等内容区8',0,'捐助物品8',8,0,'2023-03-11 18:08:52','2023-03-11 18:08:52');

DROP TABLE IF EXISTS `message_feedback`;
CREATE TABLE `message_feedback`(message_feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '留言反馈ID',
`message_user` int(11) DEFAULT 0 comment '留言用户',
`user_name` varchar(64) comment '用户姓名',
`message_title` varchar(64) comment '留言标题',
`message_date` date comment '留言日期',
`message_content` text comment '留言内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (message_feedback_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '留言反馈';
insert into `message_feedback` values (1,0,'用户姓名1','留言标题1','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区1','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (2,0,'用户姓名2','留言标题2','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区2','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (3,0,'用户姓名3','留言标题3','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区3','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (4,0,'用户姓名4','留言标题4','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区4','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (5,0,'用户姓名5','留言标题5','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区5','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (6,0,'用户姓名6','留言标题6','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区6','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (7,0,'用户姓名7','留言标题7','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区7','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_feedback` values (8,0,'用户姓名8','留言标题8','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区8','未审核','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');

DROP TABLE IF EXISTS `message_notification`;
CREATE TABLE `message_notification`(message_notification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '消息通知ID',
`reminder_title` varchar(64) comment '提醒标题',
`remind_users` int(11) DEFAULT 0 comment '提醒用户',
`reminder_date` date comment '提醒日期',
`reminder_message` text comment '提醒信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (message_notification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '消息通知';
insert into `message_notification` values (1,'提醒标题1',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (2,'提醒标题2',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (3,'提醒标题3',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (4,'提醒标题4',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (5,'提醒标题5',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (6,'提醒标题6',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (7,'提醒标题7',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `message_notification` values (8,'提醒标题8',0,'2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');

DROP TABLE IF EXISTS `pet_daily`;
CREATE TABLE `pet_daily`(pet_daily_id int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物日常ID',
`pet_name` varchar(64) comment '宠物名称',
`type_of_pet` varchar(64) comment '宠物类型',
`pet_color` varchar(64) comment '宠物颜色',
`pet_sex` varchar(64) comment '宠物性别',
`pet_age` varchar(64) comment '宠物年龄',
`adoptive_user` int(11) DEFAULT 0 comment '领养用户',
`user_name` varchar(64) comment '用户姓名',
`report_date` date comment '报告日期',
`pet_daily` text comment '宠物日常',
`daily_video` varchar(255) comment '日常视频',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (pet_daily_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '宠物日常';
insert into `pet_daily` values (1,'宠物名称1','宠物类型1','宠物颜色1','宠物性别1','宠物年龄1',0,'用户姓名1','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区1','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (2,'宠物名称2','宠物类型2','宠物颜色2','宠物性别2','宠物年龄2',0,'用户姓名2','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区2','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (3,'宠物名称3','宠物类型3','宠物颜色3','宠物性别3','宠物年龄3',0,'用户姓名3','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区3','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (4,'宠物名称4','宠物类型4','宠物颜色4','宠物性别4','宠物年龄4',0,'用户姓名4','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区4','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (5,'宠物名称5','宠物类型5','宠物颜色5','宠物性别5','宠物年龄5',0,'用户姓名5','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区5','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (6,'宠物名称6','宠物类型6','宠物颜色6','宠物性别6','宠物年龄6',0,'用户姓名6','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区6','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (7,'宠物名称7','宠物类型7','宠物颜色7','宠物性别7','宠物年龄7',0,'用户姓名7','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区7','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');
insert into `pet_daily` values (8,'宠物名称8','宠物类型8','宠物颜色8','宠物性别8','宠物年龄8',0,'用户姓名8','2023-03-11','此处可上传文字、图片、视频、超链接、表格等内容区8','',0,'2023-03-11 18:08:52','2023-03-11 18:08:52');

insert into `auth` values ('1','管理员','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','1','1','1','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('2','管理员','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','1','1','1','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('3','管理员','宠物类型','type_of_pet','宠物类型','/type_of_pet/table','','_blank','1','1','1','1','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('4','管理员','宠物类型','type_of_pet','宠物类型详情','/type_of_pet/view','','_blank','1','1','1','1','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('5','管理员','宠物信息','pet_information','宠物信息','/pet_information/table','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"figure":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('6','管理员','宠物信息','pet_information','宠物信息详情','/pet_information/view','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('7','管理员','宠物信息','pet_information','宠物信息','/pet_information/list','top','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('8','管理员','宠物信息','pet_information','宠物信息详情','/pet_information/details','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('9','管理员','领养信息','adoption_information','领养信息','/adoption_information/table','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{"figure":true,"examine":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('10','管理员','领养信息','adoption_information','领养信息详情','/adoption_information/view','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('11','管理员','领养信息','adoption_information','领养信息','/adoption_information/edit','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('12','管理员','救助基地','rescue_base','救助基地','/rescue_base/table','','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"examine":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('13','管理员','救助基地','rescue_base','救助基地详情','/rescue_base/view','','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('14','管理员','救助基地','rescue_base','救助基地','/rescue_base/list','top','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('15','管理员','救助基地','rescue_base','救助基地详情','/rescue_base/details','','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('16','管理员','捐助信息','donation_information','捐助信息','/donation_information/table','','_blank','1','1','1','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('17','管理员','捐助信息','donation_information','捐助信息详情','/donation_information/view','','_blank','1','1','1','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('18','管理员','捐助信息','donation_information','捐助信息','/donation_information/edit','','_blank','1','1','1','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('19','管理员','留言反馈','message_feedback','留言反馈','/message_feedback/table','','_blank','1','1','1','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{"examine":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('20','管理员','留言反馈','message_feedback','留言反馈详情','/message_feedback/view','','_blank','1','1','1','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('21','管理员','留言反馈','message_feedback','留言反馈','/message_feedback/edit','top','_blank','1','1','1','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('22','管理员','消息通知','message_notification','消息通知','/message_notification/table','','_blank','1','1','1','1','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('23','管理员','消息通知','message_notification','消息通知详情','/message_notification/view','','_blank','1','1','1','1','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('24','管理员','宠物日常','pet_daily','宠物日常','/pet_daily/table','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('25','管理员','宠物日常','pet_daily','宠物日常详情','/pet_daily/view','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('26','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('27','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('28','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('29','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('30','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('31','管理员','论坛','forum','交流论坛','/forum/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('32','管理员','论坛','forum','论坛详情','/forum/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('33','管理员','论坛','forum','交流论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('34','管理员','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('35','管理员','论坛分类','forum_type','论坛分类','/forum_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('36','管理员','论坛分类','forum_type','论坛分类','/forum_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('37','管理员','新闻','article','宠物百科','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('38','管理员','新闻','article','宠物百科','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('39','管理员','新闻','article','宠物百科','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('40','管理员','新闻','article','宠物百科','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('41','管理员','新闻分类','article_type','百科分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('42','管理员','新闻分类','article_type','百科分类','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('43','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('44','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('45','管理员','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('46','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('47','游客','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('48','游客','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('49','游客','宠物类型','type_of_pet','宠物类型','/type_of_pet/table','','_blank','0','0','0','0','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('50','游客','宠物类型','type_of_pet','宠物类型详情','/type_of_pet/view','','_blank','0','0','0','0','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('51','游客','宠物信息','pet_information','宠物信息','/pet_information/table','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"figure":false,"can_show_comment":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('52','游客','宠物信息','pet_information','宠物信息详情','/pet_information/view','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('53','游客','宠物信息','pet_information','宠物信息','/pet_information/list','top','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('54','游客','宠物信息','pet_information','宠物信息详情','/pet_information/details','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"can_comment":false,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('55','游客','领养信息','adoption_information','领养信息','/adoption_information/table','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{"figure":false,"examine":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('56','游客','领养信息','adoption_information','领养信息详情','/adoption_information/view','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('57','游客','领养信息','adoption_information','领养信息','/adoption_information/edit','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('58','游客','救助基地','rescue_base','救助基地','/rescue_base/table','','_blank','0','0','0','0','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"examine":false,"can_show_comment":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('59','游客','救助基地','rescue_base','救助基地详情','/rescue_base/view','','_blank','0','0','0','0','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('60','游客','救助基地','rescue_base','救助基地','/rescue_base/list','top','_blank','0','0','0','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('61','游客','救助基地','rescue_base','救助基地详情','/rescue_base/details','','_blank','0','0','0','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"can_comment":false,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('62','游客','捐助信息','donation_information','捐助信息','/donation_information/table','','_blank','0','0','0','0','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('63','游客','捐助信息','donation_information','捐助信息详情','/donation_information/view','','_blank','0','0','0','0','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('64','游客','捐助信息','donation_information','捐助信息','/donation_information/edit','','_blank','0','0','0','0','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('65','游客','留言反馈','message_feedback','留言反馈','/message_feedback/table','','_blank','0','0','0','0','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{"examine":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('66','游客','留言反馈','message_feedback','留言反馈详情','/message_feedback/view','','_blank','0','0','0','0','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('67','游客','留言反馈','message_feedback','留言反馈','/message_feedback/edit','top','_blank','0','0','0','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('68','游客','消息通知','message_notification','消息通知','/message_notification/table','','_blank','0','0','0','0','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('69','游客','消息通知','message_notification','消息通知详情','/message_notification/view','','_blank','0','0','0','0','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('70','游客','宠物日常','pet_daily','宠物日常','/pet_daily/table','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('71','游客','宠物日常','pet_daily','宠物日常详情','/pet_daily/view','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('72','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('73','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('74','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('75','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('76','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('77','游客','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('78','游客','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('79','游客','论坛','forum','交流论坛','/forum/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('80','游客','论坛','forum','论坛详情','/forum/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('81','游客','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('82','游客','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('83','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('84','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('85','游客','新闻','article','宠物百科','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('86','游客','新闻','article','宠物百科','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('87','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('88','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('89','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('90','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('91','游客','公告','notice','公告','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('92','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('93','普通用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('94','普通用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('95','普通用户','宠物类型','type_of_pet','宠物类型','/type_of_pet/table','','_blank','0','0','0','0','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('96','普通用户','宠物类型','type_of_pet','宠物类型详情','/type_of_pet/view','','_blank','0','0','0','0','type_of_pet','type_of_pet','type_of_pet',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('97','普通用户','宠物信息','pet_information','宠物信息','/pet_information/table','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"figure":false,"can_show_comment":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('98','普通用户','宠物信息','pet_information','宠物信息详情','/pet_information/view','','_blank','0','0','0','0','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('99','普通用户','宠物信息','pet_information','宠物信息','/pet_information/list','top','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('100','普通用户','宠物信息','pet_information','宠物信息详情','/pet_information/details','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets','pet_name,type_of_pet,pet_color,pet_sex,pet_age,pet_pictures,adoption_status,adoption_address,disease_or_not,introduction_to_pets',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('101','普通用户','领养信息','adoption_information','领养信息','/adoption_information/table','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{"figure":false,"examine":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('102','普通用户','领养信息','adoption_information','领养信息详情','/adoption_information/view','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('103','普通用户','领养信息','adoption_information','领养信息','/adoption_information/edit','','_blank','1','1','1','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoption_address,adoption_mode,date_of_adoption,adoptive_user,user_name,id_number,contact_number,user_address,adoption_information',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('104','普通用户','救助基地','rescue_base','救助基地','/rescue_base/table','','_blank','1','1','0','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"examine":false,"can_show_comment":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('105','普通用户','救助基地','rescue_base','救助基地详情','/rescue_base/view','','_blank','1','1','0','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('106','普通用户','救助基地','rescue_base','救助基地','/rescue_base/list','top','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('107','普通用户','救助基地','rescue_base','救助基地详情','/rescue_base/details','','_blank','1','1','1','1','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs','rescue_title,title_no,release_date,cover_photo,application_user,user_name,animal_information,assistance_needs',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('108','普通用户','捐助信息','donation_information','捐助信息','/donation_information/table','','_blank','0','0','0','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('109','普通用户','捐助信息','donation_information','捐助信息详情','/donation_information/view','','_blank','0','0','0','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('110','普通用户','捐助信息','donation_information','捐助信息','/donation_information/edit','','_blank','1','1','1','1','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount','rescue_title,title_no,application_user,assistance_needs,donor_users,donations,donation_amount',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('111','普通用户','留言反馈','message_feedback','留言反馈','/message_feedback/table','','_blank','0','0','0','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{"examine":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('112','普通用户','留言反馈','message_feedback','留言反馈详情','/message_feedback/view','','_blank','0','0','0','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('113','普通用户','留言反馈','message_feedback','留言反馈','/message_feedback/edit','top','_blank','1','1','1','1','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content','message_user,user_name,message_title,message_date,message_content',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('114','普通用户','消息通知','message_notification','消息通知','/message_notification/table','','_blank','0','0','0','1','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('115','普通用户','消息通知','message_notification','消息通知详情','/message_notification/view','','_blank','0','0','0','1','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message','reminder_title,remind_users,reminder_date,reminder_message',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('116','普通用户','宠物日常','pet_daily','宠物日常','/pet_daily/table','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('117','普通用户','宠物日常','pet_daily','宠物日常详情','/pet_daily/view','','_blank','0','0','0','1','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video','pet_name,type_of_pet,pet_color,pet_sex,pet_age,adoptive_user,user_name,report_date,pet_daily,daily_video',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('118','普通用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('119','普通用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('120','普通用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('121','普通用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('122','普通用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('123','普通用户','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('124','普通用户','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('125','普通用户','论坛','forum','交流论坛','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('126','普通用户','论坛','forum','论坛详情','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('127','普通用户','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('128','普通用户','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('129','普通用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('130','普通用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('131','普通用户','新闻','article','宠物百科','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('132','普通用户','新闻','article','宠物百科','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('133','普通用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('134','普通用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('135','普通用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('136','普通用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('137','普通用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `auth` values ('138','普通用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `user_group` values ('3','100','普通用户',null,'ordinary_users','ordinary_users_id','0','3','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/static/upload/1574680749397770240.jpg','247','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/static/upload/1592706999722704897.jpg','399','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/static/upload/1574680904087896065.jpg','368','2023-03-11 18:08:52.0','2023-03-11 18:08:52.0');
insert into `article` values ('1','小猫爱休闲','宠物','864','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p>我家养了一只小花猫，可讨人喜欢了。圆圆的脑袋上竖着一对黑耳朵。小脸上嵌着一双明亮的大眼睛。小嘴微微撅着，好像要和我打招呼。</p><p><br></p><p>每当我放学回家，小猫总喜欢摇着尾巴来迎接我。我会蹲下身，把它抱在怀里。吃饭的时候，我总是弄点汤，拌上饭，里面夹几条小鱼，放在小猫身边，让它美美吃上一顿。</p><p><br></p><p>一天放学回家，我突然发现小猫不见了，我找遍了整个屋子，不见小猫的踪影。我焦急地问妈妈：“妈妈，您看见我的小猫了吗？”妈妈摇摇头，说：“没有啊！”我连忙出去四处找。东面，找了找，没有。西面，找了找，没有。前面，找了找，没有。后面，找了找，还是没有。我伤心地走到不远处的花园里。小猫正在捉蝴蝶呢！它看见我，“喵、喵”地跑过来，似乎在说：“你怎么也来了？”</p><p><br></p><p>我长长地舒了一口气。原来小猫也爱休闲！</p>','/static/upload/1574657200490545153.jpg','小猫爱休闲');
insert into `article` values ('2','宠物洗澡注意事项','宠物','766','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p>如今满大街都是宠物店，而服务的价格越来越贵，一只宠物狗洗澡就要100多块以上，大型犬更加昂贵，比人类洗澡还要贵好几倍，这导致人们舍不得去宠物店给狗子洗澡，一些人就在家里自己给狗狗洗澡。其实当我们在家里给狗狗洗澡的时候，也要注意一些事情，很多宠物狗在家里洗澡以后就生病了，我们应该提前预防，今天猪二六就来说说主人在家里给宠物狗洗澡的时候，应该注意哪些细节？</p><p class="ql-align-center"><img src="https://p5.itc.cn/q_70/images03/20220925/7cce42539ad9438faef82f9b2ceda317.jpeg"></p><p>人们最常见的错误点就是给狗狗用人类的沐浴露，狗狗的毛发很多，和人类的完全不同，所以狗子不能用人类的沐浴露。其实给宠物狗洗澡是一件很累人的事情，不仅仅是拿一个盆就马上可以洗的，主人要注意宠物狗是否刚吃饱，应该在狗狗饭后两个小时再给它洗澡，这样就不会给它的身体的带来一些负担。</p><p class="ql-align-center"><img src="https://p6.itc.cn/q_70/images03/20220925/286042768d4c49b187547030f8c85064.jpeg"></p><p>一些主人给宠物狗洗澡的时候，总是追求干净，因为宠物狗的毛发比较紧密，而且体型比较大，很多主人一洗就是不间断的两个小时，这不仅考验主人的耐心，也对宠物狗十分痛苦。</p><p>主人在给宠物狗洗澡的时候，不能让宠物狗一直待在盆里，应该也让它有些休息的时间，毕竟宠物狗洗澡的时候也是很累的，最好每隔20分钟左右让它稍微休息几分钟。</p><p class="ql-align-center"><img src="https://p6.itc.cn/q_70/images03/20220925/f3dd2c9a4fee47008748212fab062e06.jpeg"></p><p>我们在给狗狗吹干毛发的时候会感觉很累，它们有些地方的毛发在内侧，根本吹不着，而吹风机的声音和热度也会给狗狗造成干扰，适当休息很有必要，如果是在夏天的话，那我们可以尝试用毛巾先擦干，然后带它到阳台上晒太阳，这样比吹风要干得快，而且夏天炎热，宠物洗澡的时候会更加难受，洗澡也要注意温差，不然很容易感冒。</p><p>结语：以上就是猪二六对于给宠物狗洗澡的时候，主人应该注意的细节总结。主人在给宠物狗洗澡的时候，一定要注意这些细节，不然洗完澡要生病的话，还要拿一笔很高的医疗费用，你们平常给宠物狗洗澡洗对了吗？好了本期的养宠资讯就到此结束了，欢迎大家在留言区留言，我们一起学习探讨养宠知识。</p>','/static/upload/1574670914556002304.jpg','给宠物洗澡时，不能用人类沐浴露');
insert into `article` values ('3','都说养黑猫不吉利？女巫：这些人好会放屁！','宠物','795','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p>前些天在姥姥家门口遇到只超可爱的小黑猫，喂了根猫条，结果却被骂了，说<strong>黑猫不吉利，</strong>乱喂啥？<strong>在以前黑猫都是女巫才养的东西！</strong></p><p><strong>萌爪君不禁疑惑：为啥女巫才养黑猫？</strong></p><p>百度答曰：<strong>因为女巫总是穿深色衣服，养白猫的话会被人看到粘上了猫毛。</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/448/w1024h1024/20221203/9bb7-44aecbd7e061f9ad2005d921b7b1fbe4.jpg"></p><p>这个笑话好冷，但是好奇害死猫，萌爪君立马开始查资料，<strong>想知道为什么女巫会和黑猫捆绑呢？小黑猫真的不吉利么？</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/259/w700h359/20221203/0fb1-2f243052523521b4a9850cd8d6dc059d.gif"></p><p>万万没想到，不吉利这锅不是女巫的也不是黑猫的！这故事的背后，其实是<strong>一段黑猫与女性惨遭压迫的血泪史。</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/391/w530h661/20221203/0309-2c7be55cd7abbafd24059e92703829e0.gif"></p><p>✦<strong>黑猫</strong></p><p>恶魔的化身</p><p>中世纪的很多作品中，猫都是以<strong>反派形象</strong>出现的，最为典型的一种表现，就是<strong>猫咪经常被描画成跟随犹大的存在。</strong>多梅尼科·吉兰达伊奥绘于1486年的<strong>《最后的晚餐》</strong>一画中，黑猫蹲坐在了唯一没有光环的犹大身后。</p><p><img src="http://n.sinaimg.cn/sinakd20120/768/w464h304/20221203/d4b9-e979178c635bcae4d07a90c70c00dc5a.jpg"></p><p><strong>而教宗格里高利九世的一封信——《罗马之声》，更是把黑猫黑出了天际：</strong>异教徒会去<strong>供奉黑猫的塑像，</strong>并且还会匍匐在地上<strong>亲吻黑猫的肛门和尾巴，</strong>之后还会在黑暗中开启NP......当灯光再次点亮，就会出现一个<strong>半人半猫的怪物</strong>和这群异教徒进行神秘的交流。</p><p><img src="http://n.sinaimg.cn/sinakd20120/371/w702h469/20221203/0720-8fe40fd0c91f0d83037e99328908bc02.jpg"></p><p>像类似的宗教<strong>恶魔化黑猫</strong>的故事简直数不胜数，萌爪君真心实意的想替猫咪们反驳一句：<strong>走开啦！！！最恶心的明明是你们这群邪恶的人类！！！</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/10/w500h310/20221203/0bc2-5255ca03a33f64f5dd04a47b03318c08.gif"></p><p>✦<strong>女巫</strong></p><p>与黑猫捆绑在一起的女巫</p><p>早期的传教士发现，虽然人们逐渐开始信仰基督教，但是一些老传统却<strong>根深蒂固</strong>无法更改。比如他们依旧习惯用草药治疗疾病，相信村子里经验丰富的老妇人的“偏方”，<strong>而这些老妇人则因为会治病就被认为懂点法术，仿佛掌握了一些神秘力量，这也就是所谓的“女巫”前身。而老妇人因为常年寡居，通常会养一两只猫陪伴在身边来缓解孤独，就此女巫和猫产生了联系。</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/336/w567h569/20221203/017f-c0ac0f6ecf7017d91097f00965a2dcb0.jpg"></p><p><strong>但是传教的过程中怎么可以有两个神存在呢？</strong>所以女巫成为了异教徒，而与女巫关系紧密的猫则是恶魔的代表。从此，<strong>女巫、恶魔、黑猫</strong>成为了紧密相关的三个词语。而随着对异教徒的讨伐，一场声势浩大的<strong>针对养猫女性的屠杀</strong>活动开始了。</p><p><img src="http://n.sinaimg.cn/sinakd20120/658/w1024h1234/20221203/b8c4-cb4a1ac067e47c8db15faa888bcb5412.jpg"></p><p>✦<strong>猎杀</strong></p><p>当女巫与猫被猎杀</p><p>根据资料显示，借由猎杀女巫之名，三个世纪内约有<strong>十万名女巫</strong>被处死。<strong>而被视为恶魔化身的猫咪，也惨遭虐杀。</strong>甚至在英国女王伊丽莎白一世的加冕礼上，作为女王将扫除异端的象征，<strong>有上千只猫被放在网兜里活活烧死。屠猫活动</strong>在中古到近代早期的法国非常盛行，他们会在宗教节日里，<strong>把四处捕来的野猫投入到大火中。在猫咪的哀嚎声中人们放声大笑，直至这些“邪魔附体”的猫咪被烧成碳灰。</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/386/w713h473/20221203/bd63-41ddce0b762639949819b12374cee7e3.jpg"></p><p><strong>到了14世纪，欧洲一些地方的猫几乎是全部都灭绝了。</strong>而此刻<strong>黑死病</strong>爆发，这场瘟疫横扫欧洲，夺走了将近<strong>2500万人</strong>的生命。<strong>黑死病还有另外一个名字就是鼠疫。正是因为猫咪被虐杀至几近灭绝，所以老鼠的数量暴增，才导致鼠患肆虐，最后瘟疫也就随之而来了。</strong></p><p><img src="http://n.sinaimg.cn/sinakd20120/342/w709h433/20221203/5e10-4e826823dbc923159b2ac7822aa6ef07.jpg"></p><p><br></p><p>归根结底，女巫与黑猫负面形象的建立，无非是宗教为了<strong>铲除异己</strong>，<strong>对女巫施以各种残忍至极的刑罚。而这更像是玩弄侮辱女性的一种手段，猫咪只是在这场罪恶的行动中无辜受累的小生命。</strong>可悲的是，时至今日，一旦有些事情发生，无论事实如何先污名化女性仍是一部分人的首选；<strong>遇见了什么倒霉的事情，也习惯性推脱遇到了黑猫好晦气。</strong>呵呵，再遇到这种无耻之人，大家先把这篇文章糊到TA们的脸上，遇见这种人才是真晦气！<strong>转发这篇文章，让我们为遭受不公待遇的女性发声，为惨遭迫害的黑猫正名！</strong></p>','/static/upload/1599295824330752001.jpg',null);
insert into `article` values ('4','养猫省钱小技巧，可以不用，最好知道','宠物','908','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p>现在想养个猫，真的很容易掉进消费陷井里，去淘宝京东看看，猫粮，日用品，玩具什么的真是很贵啊，其实，根据我养猫的的经验感觉很多东西是可以省下来的。</p><p>猫粮，其实猫粮我觉得可以买着吃，不过可以自己给猫猫做饭和猫粮混着吃，机能保持营养，又能省钱，现在秋刀鱼淘宝上价格大约是160元20斤，可以买来做给猫吃。</p><p>消毒用品可以用二氧化氯泡腾片，食用级消毒片，淘宝上可以搜到，价格应该是三四十块钱1000片。</p><p>驱虫药也可以去淘宝上搜一搜，莫西菌素，这个得按照宠物体重服用，可以买一个小秤来称药，反正目的就是买兽用药，这个便宜。</p><p>其实，疫苗也可以自己打，淘宝上也有卖的，但是这个不推荐，因为自己打疫苗确实有点危险。</p><p>总之，要想省钱，就要尽量自己动手，多利用淘宝，拼多多。</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221203s/665/w600h865/20221203/4bb4-8abb42150feb514117bed5f274308fc8.jpg"></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221203s/641/w600h841/20221203/d6b4-a4601678ab6d4a7f9b7c6a1d6884d664.jpg"></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221203s/695/w600h895/20221203/5268-09a63241a0d5f0dd73821fadf2fa539d.jpg"></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221203s/480/w600h680/20221203/f61b-190460c5f6cf66a3bbd291fc2e145c31.jpg"></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20221203s/507/w600h707/20221203/33a3-aa74ec3f12c03e32dcbad19d86063fab.jpg"></p><p><br></p><p><br></p>','/static/upload/1599295196430860288.jpg',null);
insert into `article` values ('5','如何判断一只小腊肠犬的价格价值','宠物','289','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p>小腊肠狗的价格也就是大家通常说腊肠犬价格，虽然有成年和幼犬之分，但大家都会选择幼犬饲养，成年犬基本就忽视了，幼犬可以培养感情，成年狗狗对老主人情感比较深，所以大家都不会购买。</p><p>&nbsp;&nbsp;小腊肠狗的价格从几百元到几万元不等，这就要看你选择什么价位的了，购买什么级别的腊肠狗了。一般家庭饲养的价格都比较低，这和幼犬的父母、繁育严谨性有关，价格基本在千元以内，品相太差的500元也经常出现。品相好点的，一般都在7-8百元比较常见。</p><p>&nbsp;&nbsp;一些犬舍饲养的，宠物店出售的价格都超过千元比较多，在1000-2000元比较常见，品相好的，基本能够达到标准的，还能超过两千元的价格。纯种的，带血统的价格就高了，需要4000元以上，精品的需要8000元以上，价格还是比较贵的。尤其是冠军犬的仔细子孙，开口就是十几、几十万元，不是一般家庭能饲养的。同样是一只小腊肠狗，但价格相差是比较大的，在普通人看来，区别不大，但懂狗的人还是能看出来或评估出来价格。</p><p>&nbsp;&nbsp;首先看血统证书，当然这是血统狗才有的，有血统证书了，说明这只小腊肠狗是纯种，价格在4000元以上；从它们的父母可以判断一只小腊肠犬的价格，没有血统证书的话，我们可以看它们的父母，通过它们父母的品相，身体结构来看出价值，从而判断幼犬的价格，父母好，它们的子女遗传肯能行大，因此价格也就会高。</p><p><span style="color: rgb(51, 51, 51);">再就是小狗本身的品相了，这个需要从骨骼量、被毛、步态、身体结构等方面来衡量，大致的品相要符合，骨骼量就是看小狗骨骼是否粗壮，纤细，细长的长大后品相差。被毛是衡量一只犬是否优秀的重要地方，当然也包括骨骼量了，比赛的重点也要看骨骼量和被毛量。可以通过用手抓身体各部位被毛，感受一下哪只被毛丰厚，厚密的说明被毛量大。通过这样的选择，就会在一窝中选择出最优秀的那只，一定不会错。</span></p>','/static/upload/1574659237286510592.jpg','腊肠犬是一种智商比较高的猎犬，虽然它们的智商排名不高，但实际生活中，我们会发现它们特别的聪明，还会帮助主人干活，经常看看就学得来！虽然说是猎犬，却有着牧羊犬的智商！这种短腿的宠物狗狗吸引了很多爱狗人士。有爱狗人士问小腊肠狗价格？如何判断一只小腊肠狗的价格价值？');
insert into `article` values ('6','宠物的快乐分享','宠物','821','0','2023-03-11 18:08:53.0','2023-03-11 18:08:53.0',null,null,null,'<p><span style="color: rgb(51, 51, 51);">我家有一只</span><a href="http://www.so.com/s?q=%E5%B0%8F%E7%8B%97&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">小狗</a><span style="color: rgb(51, 51, 51);">，它的名字叫“汪汪”它的毛很黑很黑，它的</span><a href="http://www.so.com/s?q=%E5%B0%BE%E5%B7%B4&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">尾巴</a><span style="color: rgb(51, 51, 51);">常常卷起来像一个小黑圈，它那黑珍珠大小的眼睛，它的脚印像一朵朵梅花，它的牙齿尖尖的，像一座座小山，它睡觉的时候，</span><a href="http://www.so.com/s?q=%E8%80%B3%E6%9C%B5&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">耳朵</a><span style="color: rgb(51, 51, 51);">紧贴着</span><a href="http://www.so.com/s?q=%E5%9C%B0%E4%B8%8A&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">地上</a><span style="color: rgb(51, 51, 51);">。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">它的性格有些古怪，说它乖，它有时候会找个暖和的地方睡觉，无忧无虑，</span><a href="http://www.so.com/s?q=%E8%87%AA%E7%94%B1%E8%87%AA%E5%9C%A8&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">自由自在</a><span style="color: rgb(51, 51, 51);">，什么事也不过问，可是它想出去玩玩，就会出走</span><a href="http://www.so.com/s?q=%E4%B8%80%E5%A4%A9%E4%B8%80%E5%A4%9C&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">一天一夜</a><span style="color: rgb(51, 51, 51);">，任凭我怎么叫唤，它也不回来。说它贪玩，可是它又是多么的尽职，只要</span><a href="http://www.so.com/s?q=%E9%97%A8%E5%A4%96&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">门外</a><span style="color: rgb(51, 51, 51);">有人走过，它就会“汪汪”地尖叫起来，直到</span><a href="http://www.so.com/s?q=%E4%B8%BB%E4%BA%BA&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">主人</a><span style="color: rgb(51, 51, 51);">听见为止。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">我跟它相处得很好，只要看见我背起书包，它就</span><a href="http://www.so.com/s?q=%E5%9C%A8%E6%88%91%E7%9A%84%E8%BA%AB%E8%BE%B9&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">在我的身边</a><span style="color: rgb(51, 51, 51);">一直转个不停，好像在说：“小主人，别走，别走，再跟我玩一会儿！”放学回家，走</span><a href="http://www.so.com/s?q=%E5%88%B0%E9%97%A8%E5%8F%A3&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">到门口</a><span style="color: rgb(51, 51, 51);">狗就已经在大门口摇着尾巴来迎接我。我常常在出门的时候，咬住我的裤角不放。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">它要是看见一根</span><a href="http://www.so.com/s?q=%E9%AA%A8%E5%A4%B4&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">骨头</a><span style="color: rgb(51, 51, 51);">，它就像奥运会上的刘翔一样飞快地跑过去，咬着骨头跑回来，</span><a href="http://www.so.com/s?q=%E5%9C%A8%E9%99%A2%E5%AD%90%E9%87%8C&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">在院子里</a><span style="color: rgb(51, 51, 51);">啃骨头，以防临近的小狗抢它的骨头，它啃完后，又跑出</span><a href="http://www.so.com/s?q=%E9%99%A2%E5%AD%90&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">院子</a><span style="color: rgb(51, 51, 51);">，就会息一下，伸出</span><a href="http://www.so.com/s?q=%E8%88%8C%E5%A4%B4&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">舌头</a><span style="color: rgb(51, 51, 51);">，从舌头流下</span><a href="http://www.so.com/s?q=%E5%8F%A3%E6%B0%B4&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">口水</a><span style="color: rgb(51, 51, 51);">。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">它只要见着了熟人，就会使劲的摇着像</span><a href="http://www.so.com/s?q=%E5%B0%8F%E5%A7%91%E5%A8%98&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">小姑娘</a><a href="http://www.so.com/s?q=%E8%BE%AB%E5%AD%90&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">辫子</a><span style="color: rgb(51, 51, 51);">一样的尾巴，要是见到</span><a href="http://www.so.com/s?q=%E9%99%8C%E7%94%9F%E4%BA%BA&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">陌生人</a><span style="color: rgb(51, 51, 51);">，就会发出“汪汪”的叫声。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">它吃的食物有：骨头、鱼刺、</span><a href="http://www.so.com/s?q=%E7%81%AB%E8%85%BF%E8%82%A0&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">火腿肠</a><span style="color: rgb(51, 51, 51);">、鱼丸等食物。我刚把食物给放在地上，它便狼吞虎咽般地吃了下去，吃好后，要是谁给它吃的，就会对他摇尾巴表示你对它很好。 </span></p><p><span style="color: rgb(51, 51, 51);"> </span></p><p><span style="color: rgb(51, 51, 51);">这就是我们家的小狗，这就是贪玩又乖又尽职又</span><a href="http://www.so.com/s?q=%E5%8F%AF%E7%88%B1%E7%9A%84%E5%B0%8F%E7%8B%97&amp;ie=utf-8&amp;src=internal_wenda_recommend_textn" rel="noopener noreferrer" target="_blank" style="color: rgb(0, 99, 200); background-color: rgb(255, 255, 255);">可爱的小狗</a><span style="color: rgb(51, 51, 51);">，就是它让我学习进步，而且玩得很快乐，它和我在一个温暖无比的童年里开开心心地度过每一天每一年。</span></p>','/static/upload/1574658080266780672.jpg','我家的宠物日常分享');
insert into `article_type` values ('1','100','宠物','0',null,null,null,'2023-03-11 18:08:53.0','2023-03-11 18:08:53.0');
