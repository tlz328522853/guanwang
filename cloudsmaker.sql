/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cloudsmaker

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-05 20:58:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cmf_ad`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_asset`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');

-- ----------------------------
-- Table structure for `cmf_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cmf_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_links`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_links
-- ----------------------------
INSERT INTO `cmf_links` VALUES ('4', 'http://www.soundgroup.com', '桑德集团', 'admin/20170704/595b395d3c0a2.png', '_blank', '', '1', '0', null, '0');
INSERT INTO `cmf_links` VALUES ('5', 'http://www.aliyun.com', '阿里云', 'admin/20170704/595b397a2de4e.png', '_blank', '', '1', '0', null, '0');
INSERT INTO `cmf_links` VALUES ('6', 'http://www.e20.net.cn', 'E2O环境平台', 'admin/20170704/595b398726b58.png', '_blank', '', '1', '0', null, '0');
INSERT INTO `cmf_links` VALUES ('7', 'http://www.caepi.org.cn', '中国环保产业协会', 'admin/20170704/595b3993b0867.png', '_blank', '', '1', '0', null, '0');
INSERT INTO `cmf_links` VALUES ('8', 'http://www.zhb.gov.cn', '环境保护部', 'admin/20170704/595b2d25ec393.png', '_blank', '', '1', '0', null, '0');

-- ----------------------------
-- Table structure for `cmf_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_menu
-- ----------------------------
INSERT INTO `cmf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `cmf_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `cmf_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `cmf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '0', '备份管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `cmf_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `cmf_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `cmf_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `cmf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');

-- ----------------------------
-- Table structure for `cmf_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '1', '0-1');
INSERT INTO `cmf_nav` VALUES ('17', '1', '10', '好嘞APP', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '113', '0-5-10-17');
INSERT INTO `cmf_nav` VALUES ('18', '1', '10', ' 桑德村镇水务云平台', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '116', '0-5-10-18');
INSERT INTO `cmf_nav` VALUES ('16', '1', '10', '环卫云平台', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '112', '0-5-10-16');
INSERT INTO `cmf_nav` VALUES ('4', '1', '0', '关于我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '2', '0-4');
INSERT INTO `cmf_nav` VALUES ('5', '1', '0', '产品与服务', '', 'javascript:void(0);', '', '1', '4', '0-5');
INSERT INTO `cmf_nav` VALUES ('6', '1', '0', '信息中心', '', 'home', '', '1', '4', '0-6');
INSERT INTO `cmf_nav` VALUES ('7', '1', '0', '公司新闻', '', 'home', '', '1', '6', '0-7');
INSERT INTO `cmf_nav` VALUES ('9', '1', '0', '解决方案', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"45\";}}', '', '1', '3', '0-9');
INSERT INTO `cmf_nav` VALUES ('19', '1', '11', '桑德盒子', '', 'index.php?g=portal&amp;m=page&amp;a=index&amp;id=15&amp;index=0', '', '1', '0', '0-5-11-19');
INSERT INTO `cmf_nav` VALUES ('10', '1', '5', '软件产品', '', 'javascript:void(0);', '', '1', '111', '0-5-10');
INSERT INTO `cmf_nav` VALUES ('11', '1', '5', '硬件产品', '', 'javascript:void(0);', '', '1', '222', '0-5-11');
INSERT INTO `cmf_nav` VALUES ('14', '1', '10', '物联网', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '114', '0-5-10-14');
INSERT INTO `cmf_nav` VALUES ('20', '1', '11', '电池采集卡', '', 'index.php?g=portal&amp;m=page&amp;a=index&amp;id=15&amp;index=1', '', '1', '0', '0-5-11-20');
INSERT INTO `cmf_nav` VALUES ('21', '1', '11', '数据网管', '', 'index.php?g=portal&amp;amp;m=page&amp;amp;a=index&amp;amp;id=15&amp;amp;index=2', '', '1', '0', '0-5-11-21');
INSERT INTO `cmf_nav` VALUES ('22', '1', '11', '智能生活仪表集中器', '', 'index.php?g=portal&amp;amp;amp;m=page&amp;amp;amp;a=index&amp;amp;amp;id=15&amp;amp;amp;index=3', '', '1', '0', '0-5-11-22');
INSERT INTO `cmf_nav` VALUES ('23', '1', '0', '招贤纳士', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"19\";}}', '', '1', '8', '0-23');
INSERT INTO `cmf_nav` VALUES ('26', '1', '10', '桑德动力电池云服务', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '115', '0-5-10-26');

-- ----------------------------
-- Table structure for `cmf_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of cmf_nav_cat
-- ----------------------------
INSERT INTO `cmf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `cmf_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_options`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_options
-- ----------------------------
INSERT INTO `cmf_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `cmf_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u5317\\u4eac\\u667a\\u6167\\u4e91\\u884c\\u79d1\\u6280\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\",\"site_admin_url_password\":\"\",\"site_tpl\":\"custom_bootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\\u4eacICP\\u590714046044\\u53f7-1\",\"site_admin_email\":\"cm_info@cloudsmaker.net\",\"site_tongji\":\"\",\"site_copyright\":\"Copyright\\u00a92016 \\u667a\\u6167\\u4e91\\u884c\",\"site_seo_title\":\"\",\"site_seo_keywords\":\"\\u4e92\\u8054\\u7f51,\\u8f6f\\u4ef6\\uff0c\\u7269\\u8054\\u7f51\\uff0c\\u5927\\u6570\\u636e\\uff0c\\u667a\\u80fd\\u786c\\u4ef6\\uff0c\\u73af\\u536b\\uff0c\\u667a\\u6167\\u57ce\\u5e02\\uff0c\\u667a\\u6167\\u57ce\\u7ba1\\uff0c\\u667a\\u6167\\u6c34\\u52a1\\uff0c\\u6cb3\\u57df\\u6cbb\\u7406\\uff0c\\u7269\\u6d41\\u3001\\u56de\\u6536\\uff0c\\u7535\\u5546\\uff0co2o,oto\",\"site_seo_description\":\"\\u667a\\u6167\\u4e91\\u884c\\uff0c\\u70b9\\u4eae\\u65b0\\u751f\\u6d3b\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `cmf_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');
INSERT INTO `cmf_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for `cmf_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_posts`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of cmf_posts
-- ----------------------------
INSERT INTO `cmf_posts` VALUES ('1', '1', '智慧,环境,环保,联系,地址', null, '2016-10-09 18:19:24', '', '北京智慧云行科技有限责任公司', '桑德集团旗下全资子公司', '1', '1', '2016-10-09 18:17:53', '&lt;div class=&quot;topBorder&quot;&gt;\r\n	&lt;div class=&quot;box_inner&quot;&gt;\r\n		&lt;ul class=&quot;tab_two&quot; id=&quot;tab&quot;&gt; \r\n			&lt;li &gt;&lt;span&gt;公司简介&lt;/span&gt;&lt;/li&gt; \r\n			&lt;li &gt;&lt;span&gt;发展历程&lt;/span&gt;&lt;/li&gt;\r\n			&lt;li &gt;&lt;span&gt;资质证书&lt;/span&gt;&lt;/li&gt; \r\n			&lt;li &gt;&lt;span&gt;联系我们&lt;/span&gt;&lt;/li&gt; \r\n		&lt;/ul&gt; \r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div  class=&quot;bgWhite&quot;&gt;\r\n	&lt;div class=&quot;lx_container&quot; id=&quot;tabContainer&quot;&gt;\r\n		&lt;div class=\'gsjj\' &gt;\r\n			&lt;h3 class=&quot;jj_title mr1&quot;&gt;背景实力雄厚&lt;/h3&gt;\r\n			&lt;div class=&quot;box_inner jj_info&quot;&gt;\r\n				&lt;p&gt;\r\n					 北京智慧云行科技有限责任公司是桑德集团旗下全资子公司。       \r\n				&lt;/p&gt;\r\n				&lt;p&gt;\r\n					  智慧云行是环境领域互联网解决方案专家。多次荣获国家级、市级多项创新奖项。\r\n				&lt;/p&gt;\r\n				&lt;p&gt;\r\n					 智慧云行为桑德集团迈向互联网+提供了技术保障，巩固了桑德集团在环保行业的领军地位。秉承开放、互联、跨界、提质、融合的理念，基于互联网思维，利用物联网技术，营造多业协同的行业生态。对包括民生、环保、公共安全、城市服务、工商业活动在内的各种需求做出智能响应。力争为环保行业互联化建设提供完善的软硬件解决方案。为人类创造更美好的城市生活 。\r\n				&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			&lt;h3 class=&quot;jj_title mr2&quot;&gt;涉及领域广泛&lt;/h3&gt;\r\n			&lt;ul class=&quot;jj_img_box&quot;&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img1.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo1&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;环卫&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img2.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo2&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;水务&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img3.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo3&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;固废&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img4.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo4&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;智慧城市&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img5.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo5&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;新能源&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img6.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo6&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;大数据&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img7.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo7&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;物联网&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;jj_img_list&quot;&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img8.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;div class=&quot;jj_img_info&quot;&gt;\r\n						&lt;span class=&quot;jj_logo8&quot;&gt;&lt;/span&gt;\r\n						&lt;p&gt;智能硬件&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n				&lt;h3 class=&quot;jj_title mr2&quot;&gt;公司资质力量强大&lt;/h3&gt;\r\n				&lt;div class=&quot;box_inner&quot;  style=&quot;margin-bottom: 120px;&quot;&gt;\r\n					&lt;ul class=&quot;jj_zz_list&quot;&gt;\r\n						&lt;li&gt;\r\n							&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_logo9.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n							&lt;div&gt;\r\n								&lt;h3&gt;\r\n									成立时间\r\n								&lt;/h3&gt;\r\n								&lt;p&gt;成立于2016年3月&lt;/p&gt;\r\n							&lt;/div&gt;\r\n						&lt;/li&gt;\r\n						&lt;li&gt;\r\n							&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_logo10.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n							&lt;div&gt;\r\n								&lt;h3&gt;\r\n									注册地点\r\n								&lt;/h3&gt;\r\n								&lt;p&gt;注册于国家高新技术产业示范基地中关村科技园&lt;/p&gt;\r\n							&lt;/div&gt;\r\n						&lt;/li&gt;\r\n						&lt;li&gt;\r\n							&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_logo11.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n							&lt;div&gt;\r\n								&lt;h3&gt;\r\n									注册资金\r\n								&lt;/h3&gt;\r\n								&lt;p&gt;注册资金1000万人民币&lt;/p&gt;\r\n							&lt;/div&gt;\r\n						&lt;/li&gt;\r\n						&lt;li&gt;\r\n							&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_logo12.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n							&lt;div&gt;\r\n								&lt;h3&gt;\r\n									资质力量\r\n								&lt;/h3&gt;\r\n								&lt;p&gt;公司现有博士占比 10% 硕士占比70%&lt;/p&gt;\r\n							&lt;/div&gt;\r\n						&lt;/li&gt;\r\n					&lt;/ul&gt;\r\n					\r\n				&lt;/div&gt;\r\n				&lt;!--&lt;div class=&quot;jj_bottom&quot;&gt;\r\n						&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/jj_img9.png&quot; alt=&quot;&quot; /&gt;\r\n						&lt;div class=&quot;jj_bottom_info&quot;&gt;\r\n							&lt;h3 class=&quot;jj_title&quot;&gt;未来发展趋势清晰&lt;/h3&gt;\r\n							&lt;p&gt;\r\n								 未来，公司将大力投入到智慧城市、海绵城市、大数据云分析等方向，为努力打造环保领域标杆云平台产品奠定夯实的技术基础。\r\n							&lt;/p&gt;\r\n						&lt;/div&gt;\r\n					&lt;/div&gt;--&gt;\r\n		&lt;/div&gt;\r\n		&lt;div class=&quot;box_inner gslc&quot;&gt;\r\n			&lt;div class=&quot;time_box&quot;&gt;\r\n				&lt;h3 class=&quot;yearHead&quot;&gt;&lt;span&gt;2016&lt;/span&gt;&lt;/h3&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;12月&lt;/span&gt;&lt;div	&gt;&lt;p&gt;获得“中关村高新技术企业”奖 &lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;10月&lt;/span&gt;&lt;div&gt;&lt;p&gt;获得最具“互联网+”特色奖&lt;/p&gt;&lt;!--&lt;p&gt;获得最具“互联网+”特色奖获得最具“互联网+”特色奖获得最具“互联网+”特色奖获得最具“互联网+”特色奖&lt;/p&gt;--&gt;&lt;/div&gt;&lt;/div&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;09月&lt;/span&gt;&lt;div	&gt;&lt;p&gt;获得万物互联产业联盟“会员单位”奖&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;	\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;03月&lt;/span&gt;&lt;div	&gt;&lt;p&gt;正式成立公司，名为北京智慧云行科技有限责任公司，注册资金1000万。  &lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\r\n				&lt;h3 class=&quot;yearHead&quot;&gt;&lt;span&gt;2015&lt;/span&gt;&lt;/h3&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;12月&lt;/span&gt;&lt;div&gt;&lt;p&gt; 获得桑德集团优秀团队奖&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;11月&lt;/span&gt;&lt;div	&gt;&lt;p&gt;环卫云平台项目正式启动&lt;/p&gt;&lt;p&gt;回收联盟成功上线&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\r\n				&lt;h3 class=&quot;yearHead&quot;&gt;&lt;span&gt;2014&lt;/span&gt;&lt;/h3&gt;\r\n				&lt;div class=&quot;month&quot;&gt;&lt;span&gt;04月&lt;/span&gt;&lt;div	&gt;&lt;p&gt;桑德集团互联网创新中心成立 &lt;/p&gt;&lt;/div&gt;&lt;/div&gt;\r\n		     &lt;/div&gt;\r\n		&lt;/div&gt;\r\n		&lt;div class=&quot;zz_info &quot;&gt;\r\n			&lt;div class=&quot;zz_list one&quot; &gt;\r\n				&lt;div class=&quot;box_inner&quot;&gt;\r\n					&lt;div class=&quot;zz_img&quot;&gt;\r\n						&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/zz_01.png&quot; style=&quot;margin:20px auto;&quot; alt=&quot;&quot; /&gt;\r\n					&lt;/div&gt;\r\n					&lt;div&gt;\r\n						&lt;div class=&quot;zz_desc_info&quot;&gt;\r\n							&lt;h3&gt;最具“互联网+”特色奖&lt;/h3&gt;\r\n							&lt;p &gt;2016年度中国智慧环卫优秀示范评选&lt;/p&gt;\r\n						&lt;/div&gt;\r\n						\r\n					&lt;/div&gt;	\r\n				&lt;/div&gt;\r\n								\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;zz_list two&quot; &gt;\r\n				&lt;div class=&quot;box_inner&quot;&gt;\r\n					&lt;div&gt;\r\n						&lt;div class=&quot;zz_desc_info&quot;&gt;\r\n							&lt;h3&gt;最具“互联网+”特色奖&lt;/h3&gt;\r\n							&lt;p &gt;2016年度中国智慧环卫优秀示范评选&lt;/p&gt;\r\n						&lt;/div&gt;\r\n					&lt;/div&gt;\r\n					&lt;div class=&quot;zz_img&quot;&gt;\r\n						&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/zz_02.png&quot; style=&quot;width: 50%;&quot; alt=&quot;&quot; /&gt;\r\n					&lt;/div&gt;			\r\n				&lt;/div&gt;\r\n							\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;zz_list three&quot;&gt;\r\n				&lt;div class=&quot;box_inner&quot;&gt;\r\n					&lt;div class=&quot;zz_img&quot;&gt;\r\n						&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/zz_03.png&quot; style=&quot;margin:20px auto;&quot; alt=&quot;&quot; /&gt;\r\n					&lt;/div&gt;	\r\n					&lt;div&gt;\r\n						&lt;div class=&quot;zz_desc_info&quot;&gt;\r\n							&lt;h3&gt;最具“互联网+”特色奖&lt;/h3&gt;\r\n							&lt;p &gt;2016年度中国智慧环卫优秀示范评选&lt;/p&gt;\r\n						&lt;/div&gt;\r\n					&lt;/div&gt;	\r\n				&lt;/div&gt;								\r\n			&lt;/div&gt;\r\n   			&lt;div class=&quot;zz_list four&quot;&gt;\r\n				&lt;div class=&quot;box_inner&quot;&gt;\r\n					&lt;div&gt;\r\n						&lt;div class=&quot;zz_desc_info&quot;&gt;\r\n							&lt;h3&gt;中关村高新技术企业&lt;/h3&gt;\r\n							&lt;p &gt;中关村科技园区管理委员会&lt;/p&gt;\r\n						&lt;/div&gt;\r\n					&lt;/div&gt;	\r\n					&lt;div class=&quot;zz_img&quot;&gt;\r\n						&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/zz_04.png&quot; style=&quot;margin:20px auto;&quot; alt=&quot;&quot; /&gt;\r\n					&lt;/div&gt;		\r\n				&lt;/div&gt;							\r\n			&lt;/div&gt;\r\n		&lt;/div&gt;\r\n		&lt;div class=&quot;lx_info box_inner&quot;&gt;\r\n			&lt;div class=&quot;lx_info_left&quot;&gt;\r\n				&lt;h3&gt;联系我们&lt;/h3&gt;\r\n				&lt;div&gt;&lt;i class=&quot;i_tel&quot;&gt;&lt;/i&gt;010-82606526&lt;/div&gt;\r\n				&lt;div &gt;&lt;i class=&quot;i_net&quot;&gt;&lt;/i&gt;&lt;a href=&quot;http://www.cloudsmaker.net&quot;&gt;www.cloudsmaker.net &lt;/a&gt;&lt;/div&gt;\r\n				&lt;div&gt;&lt;i class=&quot;i_email&quot;&gt;&lt;/i&gt;customer@cloudsmaker.net &lt;/div&gt;\r\n				&lt;div&gt;&lt;i class=&quot;i_address&quot;&gt;&lt;/i&gt;北京市海淀区北四环西路66号中国技术交易大厦1530&lt;/div&gt;\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;lx_info_right&quot;&gt;\r\n				&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/companyAddress.png&quot; alt=&quot;&quot; /&gt;\r\n			&lt;/div&gt;\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;	\r\n&lt;/div&gt;', '0', '2', '', '0', '{\"template\":\"contact\",\"thumb\":\"portal\\/20170313\\/58c660a248622.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('2', '2', '', '', '2016-12-06 17:51:05', '', '智慧环卫', '实现环卫作业自动化，决策自动化', '1', '1', '2017-07-05 14:25:44', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c866407a62.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost:8088\\/code\\/data\\/upload\\/portal\\/20170705\\/595c4e9f3696e.png\",\"alt\":\"home_imgP_hw1920.png\"}]}', '178', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('36', '1', '', '', '2017-07-05 10:29:12', '', '智慧水务', '信息化指引未来', '1', '1', '2017-07-05 14:24:41', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8625d07a9.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost:8088\\/code\\/data\\/upload\\/portal\\/20170705\\/595c4f200157a.png\",\"alt\":\"home_imgP_waterWu1.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('37', '1', '', '', '2017-07-05 10:30:12', '', '数字化城管', '提升城市环境', '3', '1', '2017-07-05 10:31:24', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c4f7915e49.png\",\"alt\":\"home_imgP_jt1920.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('38', '1', '', '', '2017-07-05 10:30:12', '', '数字化城管', '提升城市环境', '3', '1', '2017-07-05 10:35:40', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c5077ee198.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c4f7915e49.png\",\"alt\":\"home_imgP_jt1920.png\"}]}', '1', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('39', '1', '', '', '2017-07-05 10:30:12', '', '数字化城管', '提升城市环境', '1', '1', '2017-07-05 14:26:36', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c86983c8d7.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost:8088\\/code\\/data\\/upload\\/portal\\/20170705\\/595c4f7915e49.png\",\"alt\":\"home_imgP_jt1920.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('3', '2', '', '', '2016-12-06 17:55:51', '', '企业邮箱', 'javascript:void(0);', '0', '1', '2017-01-10 10:13:46', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('4', '2', '', '', '2016-12-06 18:00:15', '', 'OA办公', 'javascript:void(0);', '0', '1', '2017-01-10 10:13:32', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('5', '2', '', '', '2016-12-06 18:00:48', '', '联系我们', 'http://www.cloudsmaker.net/index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '3', '1', '2017-06-09 14:19:25', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('6', '2', '', '', '2016-12-06 18:01:03', '', '友情链接', 'javascript:void(0);', '0', '1', '2017-01-10 10:12:50', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('7', '2', '', '', '2016-12-06 18:01:25', '', '人才招聘', './index.php?g=portal&amp;m=page&amp;a=index&amp;id=19', '3', '1', '2017-01-20 14:27:20', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('8', '2', '', '', '2016-12-06 18:01:43', '', '成功案例', 'javascript:void(0);', '0', '1', '2017-06-29 13:48:38', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('9', '2', '', '', '2016-12-06 18:02:03', '', '典型客户', 'javascript:void(0);', '0', '1', '2017-06-29 13:48:44', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('10', '2', '', '', '2016-12-06 18:02:21', '<p>/index.php?m=page&amp;a=index&amp;id=16</p>', '北京智慧云行科技有限责任公司', '', '1', '1', '2017-07-03 17:27:53', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('11', '2', '智慧,环保,环境,平台', null, '2016-12-20 18:10:08', '', '环卫云平台', '在“互联网+环卫”的大背景下，基于物联网、互联网、大数据、GIS、多媒体等技术，将传统环卫业务与互联网技术深度融合。', '1', '1', '2016-12-20 18:08:29', '&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;product_nav&quot;&gt; \r\n	&lt;ul&gt; \r\n		&lt;li class=&quot;nav_tab current&quot; data-href=&quot;#ypt0&quot;&gt;&lt;span&gt;产品介绍&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot; data-href=\'#ypt1\'&gt;&lt;span&gt;功能结构&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot; data-href=\'#ypt2\'&gt;&lt;span&gt;功能介绍&lt;/span&gt;&lt;/li&gt; \r\n	&lt;/ul&gt; \r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product_list_box&quot;&gt;	\r\n	&lt;section class=&quot;product_list&quot; id=&quot;ypt0&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;产品介绍&lt;/span&gt; &lt;/h2&gt; \r\n		&lt;div class=&quot;nav0_detail&quot;&gt;\r\n			&lt;ul&gt;\r\n				&lt;li&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/hw0.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;多技术融合&lt;/h3&gt;\r\n						&lt;p&gt;\r\n							环卫云平台是在“互联网+环卫”的大背景下，基于物联网、互联网、大数据、GIS、多媒体等技术，将传统环卫业务与互联网技术深度融合，\r\n							吸纳企业运营管理先进经验并将其流程化、标准化、服务化搭建起的环卫行业性云平台。\r\n						&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/hw1.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;节约成本&lt;/h3&gt;\r\n						&lt;p&gt;\r\n							环卫云平台以帮助客户节约成本、增加收入、创造利润为目标。通过实现一系列核心功能帮助客户实现精细化管理、精细化运营。帮助客户快速响应市场需求，应对市场变化，提升客户的服务能力、服务质量。\r\n						&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/hw2.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;政府项目&lt;/h3&gt;\r\n						&lt;p&gt;\r\n							环卫云可为政府环卫主管部门、环卫项目公司随时随地提供环卫作业监控及环卫运营管理信息服务。政府环卫主管部门、环卫项目公司可按需选择环卫云平台服务管理功能，并购买相应的服务。\r\n						&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/hw3.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;服务提供&lt;/h3&gt;\r\n						&lt;p&gt;\r\n							环卫云提供的服务包括环卫运营管理、环卫人力资源管理、作业质量考核分析、环卫资产管理、环卫物料库房管理、环卫广告管理、再生资源回收管理、环卫物流服务、环卫突发事件应急管理、环境咨询、环保设备租赁服务、环保设备销售服务等。\r\n						&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n		&lt;/div&gt; \r\n	&lt;/section&gt;\r\n	&lt;section class=&quot;product_list&quot; id=&quot;ypt1&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;功能结构&lt;/span&gt; &lt;/h2&gt;\r\n		&lt;div class=&quot;nav1_detail&quot;&gt;\r\n			&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/hw4.png&quot; alt=&quot;&quot; /&gt;\r\n		&lt;/div&gt;\r\n	&lt;/section&gt;\r\n	&lt;section class=&quot;product_list&quot; id=\'ypt2\'&gt; \r\n		&lt;h2&gt; &lt;span&gt;功能介绍&lt;/span&gt; &lt;/h2&gt;\r\n		&lt;div class=&quot;nav2_detail&quot;&gt;\r\n			&lt;div&gt;\r\n				&lt;h3&gt;基础信息&lt;/h3&gt;\r\n				&lt;p&gt;机构管理&lt;/p&gt;\r\n				&lt;p&gt;人员管理&lt;/p&gt;\r\n				&lt;p&gt;人员调出功能&lt;/p&gt;\r\n				&lt;p&gt;人员调入功能&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&gt;\r\n				&lt;h3&gt;作业规划&lt;/h3&gt;\r\n				&lt;p&gt;人员线路规划&lt;/p&gt;\r\n				&lt;p&gt;人员巡检规划&lt;/p&gt;\r\n				&lt;p&gt;地图模式下的整体规划，包括&lt;/p&gt;\r\n				&lt;p&gt;增加规划，修改规划，删除规划以及驾驶委托等功能&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&gt;\r\n				&lt;h3&gt;作业规划&lt;/h3&gt;\r\n				&lt;p&gt;对环卫作业的人，车，物，事的监察管理及综合监察管理&lt;/p&gt;\r\n				&lt;p&gt;车辆作业监察&lt;/p&gt;\r\n				&lt;p&gt;人员作业监察&lt;/p&gt;\r\n				&lt;p&gt;环卫设备设施监察&lt;/p&gt;\r\n				&lt;p&gt;环卫事件监察&lt;/p&gt;\r\n				&lt;p&gt;综合监察&lt;/p&gt;\r\n				&lt;p&gt;视频实时播放&lt;/p&gt;\r\n			&lt;/div&gt;\r\n		&lt;/div&gt;\r\n	&lt;/section&gt;\r\n&lt;/div&gt;', '0', '2', 'index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '0', '{\"template\":\"product\",\"thumb\":\"portal\\/20170313\\/58c65fcdcda9f.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('12', '2', '物联,智慧,环保,环境', null, '2016-12-20 18:11:23', '', '物联网', '智慧云行物联网系统是公司自主研发的一款战略性产品', '1', '1', '2016-12-20 18:10:11', '&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;product_nav&quot;&gt; \r\n	&lt;ul&gt; \r\n		&lt;li class=&quot;nav_tab current&quot; data-href=&quot;#wlw0&quot;&gt;&lt;span&gt;产品介绍&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot; data-href=\'#wlw1\'&gt;&lt;span&gt;产品特点&lt;/span&gt;&lt;/li&gt; \r\n	&lt;/ul&gt; \r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product_list_box&quot;&gt;	\r\n	&lt;section class=&quot;product_list&quot; id=&quot;wlw0&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;产品介绍&lt;/span&gt; &lt;/h2&gt; \r\n		&lt;div class=\'wlw_para\'&gt;\r\n			&lt;p&gt;智慧云行物联网系统是公司自主研发的一款战略性产品。&lt;/p&gt;\r\n			&lt;p&gt;整个系统经过多次优化改造，现已成功部署在全球多个数据中心，日处理数据量可达PB级，并具备接入千万级设备和用户的能力，是国内领先的物联网平台。&lt;/p&gt;\r\n		&lt;/div&gt;\r\n	&lt;/section&gt;\r\n	&lt;section class=&quot;product_list&quot; id=&quot;wlw1&quot; style=&quot;padding-bottom: 120px;&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;产品特点&lt;/span&gt; &lt;/h2&gt;\r\n		&lt;div class=&quot;nav0_detail&quot; &gt;\r\n			&lt;ul&gt;\r\n				&lt;li class=&quot;wlw_detail&quot;&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/wlw1.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;\r\n							提供千万级\r\n						&lt;/h3&gt;\r\n						&lt;p&gt;用户接入能力&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;wlw_detail&quot;&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/wlw2.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;\r\n							提供千万级\r\n						&lt;/h3&gt;\r\n						&lt;p&gt;用户接入能力&lt;/p&gt;\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;wlw_detail&quot;&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/wlw3.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;\r\n							提供m2m功能\r\n						&lt;/h3&gt;\r\n						\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n				&lt;li class=&quot;wlw_detail&quot;&gt;\r\n					&lt;span&gt;&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/wlw4.png&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n					&lt;div&gt;\r\n						&lt;h3&gt;\r\n							 支持mqtt，coap，808&lt;br/&gt;  ZigBee,ModBus等协议\r\n						&lt;/h3&gt;\r\n						\r\n					&lt;/div&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n		&lt;/div&gt; \r\n	&lt;/section&gt;\r\n&lt;/div&gt;', '0', '2', 'index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '0', '{\"template\":\"product\",\"thumb\":\"portal\\/20170313\\/58c65fe6482ce.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('13', '2', '桑德,动力,电池,云平台', null, '2016-12-27 15:01:05', '', '桑德动力电池云平台', '桑德动力电池云平台是自主研发服务平台。电池云平台是自主研发服务平台电池云平台是自主研发服务平台', '1', '1', '2016-12-27 14:59:44', '&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;product_nav&quot;&gt; \r\n	&lt;ul&gt; \r\n		&lt;li class=&quot;nav_tab current&quot; data-href=&quot;#dldc0&quot;&gt;&lt;span&gt;平台介绍&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot; data-href=\'#dldc1\'&gt;&lt;span&gt;主要功能&lt;/span&gt;&lt;/li&gt; \r\n	&lt;/ul&gt; \r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product_list_box&quot;&gt;	\r\n	&lt;section class=&quot;product_list&quot; id=&quot;dldc0&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;平台介绍&lt;/span&gt; &lt;/h2&gt; \r\n		&lt;div class=\'wlw_para indent\'&gt;\r\n			&lt;p&gt;锂电池云平台通过实时采集锂电池生命周期（电池生产存储、电池运输过程、电池装车运行、电池梯次回收利用、电池报废待拆解位置定位）各阶段数据，对锂电池进行全生命周期的监管。&lt;/p&gt;\r\n			&lt;p&gt;通过数据分析进行故障诊断和报警，确保电池使用安全。通过持续采集动力锂电池数据，计算分析出动力锂电池的健康状态，促进动力锂电池合理的进行梯次回收利用。对于报废的锂电池进行位置定位，方便回收企业上门回收电池，减少环境污染。&lt;/p&gt;\r\n		&lt;/div&gt;\r\n	&lt;/section&gt;\r\n	&lt;section class=&quot;product_list&quot; id=&quot;dldc1&quot; style=&quot;padding-bottom: 120px;&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;主要功能&lt;/span&gt; &lt;/h2&gt;\r\n		&lt;div class=&quot;dcdc_info&quot; &gt;\r\n			&lt;div class=&quot;left&quot;&gt; \r\n				&lt;div&gt;\r\n					&lt;span class=&quot;numBg&quot;&gt;01&lt;/span&gt;\r\n					&lt;p class=&quot;dc_desc_info&quot;&gt;电池能力分布检测&lt;/p&gt;\r\n				&lt;/div&gt;\r\n				&lt;div&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/dldc1.png&quot;  alt=&quot;&quot; /&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;right&quot;&gt; \r\n				\r\n				&lt;div&gt;\r\n					&lt;img  src=&quot;./themes/custom_bootx/Public/assets/images/new/dldc2.png&quot;  alt=&quot;&quot; /&gt;\r\n				&lt;/div&gt;\r\n				&lt;div&gt;\r\n					&lt;span class=&quot;numBg&quot;&gt;02&lt;/span&gt;\r\n					&lt;p class=&quot;dc_desc_info&quot;&gt;故障报警分布监测&lt;/p&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;left&quot;&gt; \r\n				&lt;div&gt;\r\n					&lt;span class=&quot;numBg&quot;&gt;03&lt;/span&gt;\r\n					&lt;p class=&quot;dc_desc_info&quot;&gt;回收电池&lt;/p&gt;\r\n				&lt;/div&gt;\r\n				&lt;div&gt;\r\n					&lt;img  src=&quot;./themes/custom_bootx/Public/assets/images/new/dldc3.png&quot; alt=&quot;&quot; /&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n			&lt;div class=&quot;right&quot;&gt; \r\n				\r\n				&lt;div&gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/dldc4.png&quot;   alt=&quot;&quot; /&gt;\r\n				&lt;/div&gt;\r\n				&lt;div&gt;\r\n					&lt;span class=&quot;numBg&quot;&gt;04&lt;/span&gt;\r\n					&lt;p class=&quot;dc_desc_info&quot;&gt;梯次利用&lt;/p&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n		&lt;/div&gt; \r\n	&lt;/section&gt;\r\n	\r\n&lt;/div&gt;', '0', '2', 'index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '0', '{\"template\":\"product\",\"thumb\":\"portal\\/20170313\\/58c66005a0b78.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('14', '2', '物联网,互联网,大数据,GIS,多媒体', null, '2017-01-03 16:21:05', '', '桑德村镇水务云平台', '在“互联网+环卫”的大背景下，基于物联网、互联网、大数据、GIS、多媒体等技术，将传统环卫业务与互联网技术深度融合', '1', '1', '2017-01-03 16:19:16', '&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;product_nav&quot;&gt; \r\n	&lt;ul&gt; \r\n		&lt;li class=&quot;nav_tab current&quot; data-href=&quot;#sw0&quot;&gt;&lt;span&gt;产品介绍&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot; data-href=\'#sw1\'&gt;&lt;span&gt;主要功能&lt;/span&gt;&lt;/li&gt; \r\n	&lt;/ul&gt; \r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product_list_box&quot;&gt;	\r\n	&lt;section class=&quot;product_list&quot; id=&quot;sw0&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;产品介绍&lt;/span&gt; &lt;/h2&gt; \r\n		&lt;div class=\'sw_para\'&gt;\r\n			&lt;p&gt;村镇水务云平台基于大数据和云计算体系架构，采用分散监控、集中管理的模式，为企业用户提供厂站集中运营管控机制，实现远程监控、集中运维、智能巡检、设备管理、生产数据管理、无人值守等功能，满足水务企业对管辖内的给水站（厂）的集中化运营管控需求。&lt;/p&gt;\r\n			&lt;p&gt;村镇供水智能运营管理系统可定时读取水表的水费数据，获取一个或多个水表指定时间的刻度数据。同时获取营业收费系统中的水费收取情况，供水厂人员查看，实现了系统之间无缝的对接，更加方便水厂对水费、用水量的管理。&lt;/p&gt;\r\n			&lt;p&gt;村镇供水智能运营管理系统采用多样化的费用收取接口，支持用户通过微信、支付宝等方式缴费。&lt;/p&gt;\r\n		&lt;/div&gt;\r\n	&lt;/section&gt;\r\n	&lt;section class=&quot;product_list&quot; id=&quot;sw1&quot;&gt; \r\n		&lt;h2&gt; &lt;span&gt;主要功能&lt;/span&gt; &lt;/h2&gt;\r\n		&lt;div  style=&quot;padding-bottom: 120px;&quot;&gt;\r\n			&lt;ul class=&quot;cell&quot;&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo1.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;设备管理&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo2.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;远程抄表&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo3.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;工单管理&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo4.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;阶梯计价&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo5.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;水质监测&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo6.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;信息发布&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/sw_logo7.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;运营管理&lt;/h3&gt;\r\n				&lt;/li&gt;\r\n				&lt;li &gt;\r\n					&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/space.png&quot; alt=&quot;&quot; /&gt;\r\n					&lt;h3&gt;&amp;nbsp;  &lt;/h3&gt;\r\n				&lt;/li&gt;\r\n			&lt;/ul&gt;\r\n		&lt;/div&gt; \r\n	&lt;/section&gt;	\r\n&lt;/div&gt;', '0', '2', 'index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '0', '{\"template\":\"product\",\"thumb\":\"portal\\/20170313\\/58c6601d38403.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('15', '2', '桑德盒子,电池采集卡,PLC前置机,智能水表集中器', null, '2017-01-05 15:20:07', '', '智能硬件产品', '桑德盒子，电池采集卡，PLC前置机，智能水表集中器等智能硬件产品，是智慧云行公司自制的智能硬件产品，这些智能硬件产品适用于很多智能项目当中', '1', '1', '2017-01-05 15:18:42', '&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;product_nav&quot;&gt; \r\n	&lt;ul id=&quot;yj_tab&quot;&gt; \r\n		&lt;li class=&quot;nav_tab current&quot;&gt;&lt;span&gt;桑德盒子&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot;&gt;&lt;span&gt;电池采集卡&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot;&gt;&lt;span&gt;PLC前置机&lt;/span&gt;&lt;/li&gt; \r\n		&lt;li class=&quot;nav_tab&quot;&gt;&lt;span&gt;智能水表集中器&lt;/span&gt;&lt;/li&gt; \r\n	&lt;/ul&gt; \r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;bgWhite&quot;&gt;\r\n&lt;div class=&quot;box_inner yj_box&quot; id=&quot;yj_container&quot;&gt;	\r\n	&lt;div&gt;\r\n		&lt;div class=&quot;yj_info&quot;&gt;\r\n			&lt;div&gt;\r\n				&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/yj_img1.png&quot;  /&gt;\r\n			&lt;/div&gt;\r\n			\r\n			&lt;div&gt;\r\n				&lt;p &gt;\r\n					通过GPS技术、里程定位技术及汽车黑匣技术，对车辆进行现代化管理，包括:行车安全监控管理、运营管理、服务质量管理、智能集中调度管理等。\r\n				&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;div class=&quot;yj_info&quot;&gt;\r\n			&lt;div&gt;\r\n				&lt;p&gt;\r\n					一种对动力电池寿命的评价、判断、实时跟踪的装置。装置向电池云平台发送动力电池二维码数据（管理编号）、动力电池组SOC（剩余电量）信息、动力电池组具体位置信息(GPS)等。实时传输电池的运行情况并综合监控各项数据，将电池在运行过程中的数据一览无遗。实现电池组状态远程监控，为动力电池回收提供准确有效的方法、确保资源再生利用、避免环境污染。\r\n				&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&gt;\r\n				&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/yj_img2.png&quot;  /&gt;\r\n			&lt;/div&gt;\r\n			\r\n			\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;div class=&quot;yj_info&quot;&gt;\r\n			&lt;div&gt;\r\n				&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/yj_img3.png&quot; alt=&quot;&quot;  style=&quot;width: 100%;&quot;/&gt;\r\n			&lt;/div&gt;\r\n			\r\n			&lt;div&gt;\r\n				&lt;p&gt;\r\n					实现对自动化过程和装备的监视和控制。它能从自动化过程和装备中采集各种信息，并将信息以图形化等更易于理解的方式进行显示，将重要的信息以各种手段传送到相关人员，对信息执行必要分析处理和存储，远传；接收远控指令，发出控制指令等等。\r\n				&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;div class=&quot;yj_info&quot;&gt;\r\n			&lt;div&gt;\r\n				&lt;p&gt;\r\n					集中器与远传计量表、采集器共同组成远程抄表控制管理系统。集中器是一个抄表区域的数据汇总设备，用于对水、电、气、热计量表数据进行采集和存储。集中器 具有上行和下行两个通道。上行通道可选用GPRS无线方式、局域网方式与管理中心实现远程通信。下行通道采用微功率无线方式对其管辖的采集器进行数据采集、处理和存储。\r\n				&lt;/p&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&gt;\r\n				&lt;img src=&quot;./themes/custom_bootx/Public/assets/images/new/yj_img4.png&quot;  alt=&quot;&quot; /&gt;\r\n			&lt;/div&gt;\r\n			\r\n			\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '0', '2', 'index.php?m=page&amp;a=index&amp;id=1&amp;from=pro', '0', '{\"template\":\"product_yj\",\"thumb\":\"portal\\/20170313\\/58c66036c709d.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('17', '2', '', '', '2017-01-09 16:42:31', '', '新能源', '清洁，绿色，可循环模式', '1', '1', '2017-07-05 14:19:32', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c84ef36de8.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost:8088\\/code\\/data\\/upload\\/portal\\/20170704\\/595b389938c61.png\",\"alt\":\"home_imgP_newYuan1.png\"}]}', '206', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('16', '2', '新闻', null, '2017-01-09 15:21:55', '', '新闻中心', '这里，有你不了解的智慧云行', '1', '1', '2017-01-09 15:20:34', '', '0', '2', '', '0', '{\"template\":\"articleCenter\",\"thumb\":\"portal\\/20170109\\/58733a0f64a88.png\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('18', '2', '', '', '2017-01-09 17:02:43', '', '物联网', '行业智能大数据平台', '1', '1', '2017-07-05 14:23:01', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8598211e1.png\",\"template\":\"\",\"photo\":[{\"url\":\"http:\\/\\/localhost:8088\\/code\\/data\\/upload\\/portal\\/20170704\\/595b5ea119bfc.png\",\"alt\":\"home_imgP_wulian1.png\"}]}', '237', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('40', '1', '', '', '2017-07-05 14:45:02', '', '智慧环卫', '实现环卫作业自动化，决策自动化', '1', '1', '2017-07-05 14:46:33', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8b453e7e4.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c8b3a6d742.png\",\"alt\":\"home_imgP_hw1920.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('41', '1', '', '', '2017-07-05 14:47:09', '', '新能源', '清洁，绿色，可循环模式', '1', '1', '2017-07-05 14:48:18', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8baf1b514.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c8b921ca62.png\",\"alt\":\"home_imgP_newYuan1.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('42', '1', '', '', '2017-07-05 14:50:00', '', '物联网', '行业智能大数据平台', '1', '1', '2017-07-05 14:51:05', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8c568f40e.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c8c437dfed.png\",\"alt\":\"home_imgP_wulian1.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('43', '1', '', '', '2017-07-05 14:52:13', '', '智慧水务', '', '1', '1', '2017-07-05 14:52:47', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8cbc1be4d.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c8caf873dc.png\",\"alt\":\"home_imgP_waterWu1.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('44', '1', '', '', '2017-07-05 14:53:02', '', '数字化城管', '提升城市环境', '1', '1', '2017-07-05 14:54:21', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c8d150f9ce.png\",\"template\":\"\",\"photo\":[{\"url\":\"portal\\/20170705\\/595c8ced4447c.png\",\"alt\":\"home_imgP_jt1920.png\"}]}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('45', '1', '', null, '2017-07-05 16:48:17', '', '解决方案', '', '1', '1', '2017-07-05 16:48:04', '', '0', '2', '', '0', '{\"template\":\"solution\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('19', '2', '', null, '2017-01-20 13:50:49', '', '加入我们', '一起创造绿色、美好的城市生活环境', '1', '1', '2017-01-20 13:49:49', '', '0', '2', '', '0', '{\"template\":\"job\",\"thumb\":\"portal\\/20170313\\/58c65a4d4b317.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('20', '2', '', null, '2017-01-20 13:52:38', '', 'Java高级工程师', '一起创造绿色、美好的城市生活环境', '0', '1', '2017-01-20 13:51:52', '	&lt;h3 class=&quot;job_detail_title&quot;&gt;Java高级工程师&lt;/h3&gt;\r\n	&lt;div class=&quot;job_detail_info&quot;&gt;\r\n		&lt;h4&gt;你将负责&lt;/h4&gt;\r\n		&lt;p&gt;1.  参与功能需求说明书和系统概要设计，并负责完成核心代码。参与功能需求说明书和系统概要设计，并负责完成核心代码。 &lt;/p&gt;\r\n		&lt;p&gt;2.  根据开发规范与流程独立完成核心模块的设计和编码相关文档。&lt;/p&gt;\r\n	&lt;/div&gt;\r\n	&lt;div class=&quot;job_detail_info&quot;&gt;\r\n		&lt;h4&gt;任职要求&lt;/h4&gt;\r\n		&lt;p&gt;\r\n			1.  大学本科及以上学历，计算机及相关专业。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			2.  JAVA基础扎实，有5年以上相关工作经验。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			3.  熟悉大型系统的设计和开发，尤其在有大数据量、高并发产品经验。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			4.  熟练缓存技术和分布式系统理论，有Redis,Memcache实际使用经验。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			5.  熟悉Spring MVC、iBatis等主流开源框架及原理。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			6.  熟练使用Eclipse/Maven/ SVN等软件开发工具精通编程工具。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			7.  熟悉Linux，Nginx，熟练配置维护Tomcat, Jetty等应用服务器。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			8.  熟悉数据库设计，熟悉MySQL,MongoDB等数据库，并具有较好的SQL编写及优化能力。并具有较好的SQL编写及优化能力。\r\n		&lt;/p&gt;\r\n		&lt;p&gt;\r\n			9.  有在github等开源社区拥有自己作品的优先。\r\n		&lt;/p&gt;\r\n	&lt;/div&gt;', '0', '2', '', '0', '{\"template\":\"jobDetail\",\"thumb\":\"portal\\/20170313\\/58c65b665f785.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('21', '2', '', '', '2017-01-21 16:32:36', '<h4>你将负责</h4><p>1. 参与功能需求说明书和系统概要设计，并负责完成核心代码。</p><p>2. 根据开发规范与流程独立完成核心模块的设计和编码相关文档。</p><h4>任职要求</h4><p>1.大学本科及以上学历，计算机及相关专业。</p><p>2.JAVA基础扎实，有5年以上相关工作经验。</p><p>3.熟悉大型系统的设计和开发，尤其在有大数据量、高并发产品经验。</p><p>4.熟练缓存技术和分布式系统理论，有Redis,Memcache实际使用经验。</p><p>5.熟悉Spring MVC、iBatis等主流开源框架及原理。</p><p>6.熟练使用Eclipse/Maven/ SVN等软件开发工具精通编程工具。</p><p>7.熟悉Linux，Nginx，熟练配置维护Tomcat, Jetty等应用服务器。</p><p>8.熟悉数据库设计，熟悉MySQL,MongoDB等数据库，并具有较好的SQL编写及优化能力。</p><p>9.有在github等开源社区拥有自己作品的优先。</p><p><br/></p>', 'Java高级工程师', '', '1', '1', '2017-01-21 18:05:44', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '267', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('22', '2', '', '', '2017-01-21 16:51:40', '<h4>你将负责</h4><p>1.2-3年以上基于Android平台软件开发工作经验，有成熟app上线经验者优先。</p><p>2.熟悉Android开发技术，包括UI、网络等方面。</p><p>3.熟悉Android开发工具和相关开发测试工具的使用。</p><p>4.参与产品设计，按照设计规范，完成技术文档编写。</p><p>5.熟悉Android性能调优方法。</p><p>6.精通常用数据结构与算法,熟悉设计模式。</p><p>7.良好的代码编写规范。</p><h4>任职要求</h4><p>1.计算机相关专业，本科或以上学历。</p><p>2.具备3年以上软件开发经验，精通Java编程，对面向对象的开发有深刻认识。</p><p>3.熟悉Android系统架构及相关技术，有2年以上Android SDK和JAVA实际开发经验，有NDK，JIN开发经验优先。</p><p>4.熟悉市场主流短代SDK逻辑，1年以上运营商基地业务SDK接入和破解经验。</p><p>5.精通Android平台上的应用开发，熟练应用网络API，熟悉Socket/HTTP、Android线程、进程通信机制。</p><p>6.熟悉现有Android设备，有适配经验，熟悉移动设备的开发特点，性能调优。</p><p>7.良好的团队协作精神，较强的主动性，勇于承担任务，具有良好的沟通能力。</p>', 'Android工程师', '', '1', '1', '2017-01-21 18:07:04', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '152', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('23', '2', '', '', '2017-01-21 16:52:20', '<h4>你将负责</h4><p>1.项目的独立设计研发及协作研发能力。</p><p>2.硬件原理图设计、PCB图设计。</p><p>3. 与结构设计的配合、协作能力。</p><p>4.电路板的制作、焊接及相关加工协调。</p><p>5.相关器件选型及采购。</p><p>6.硬件工作协助导入到生产。</p><p>7.生产、销售过程中的技术问题跟进和解决。</p><h4>任职要求</h4><p>1.本科以上学历，通信、电子、计算机等相关专业。</p><p>2.两年以上硬件开发工作经验（应届毕业生免）。</p><p>3.熟练掌握原理图、PCB设计、熟练使用Altium Designer(必须)设计原理图、PCB。</p><p>4.熟悉电路仿真。</p><p>5.熟悉电磁兼容性设计。</p><p>6.熟练掌握单片机、ARM等硬件设计。模拟、数字电路熟练。</p><p>7.掌握C编程，可以做电路驱动的程序开发。</p><p>8.动手能力强，熟练的焊接技术及一定的组装能力。</p><p>9.成功独立设计过电子产品，成功设计过大批量生产产品者优先。</p><p>10.设计导入生产、生产跟进经验、现场安装及处理问题能力。</p><p>11.工作态度端正，协作能力，吃苦耐劳。</p>', '硬件工程师', '', '1', '1', '2017-01-21 18:23:37', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '144', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('24', '2', '', '', '2017-01-21 16:52:33', '<h4>你将负责</h4><p>1.全面负责移动端产品、项目的功能、兼容性、安全及用户体验等方面的测试工作，保证产品的质量，把控各个版本的升级迭代。</p><p>2.根据需求文档、设计文档分析测试点、测试范围，制定测试计划。</p><p>3.设计和编写测试用例。</p><p>4.根据接口功能，执行组件/模块测试、API测试、接口测试。</p><p>5.协助定位bug，配合开发人员重现和修复bug。</p><h4>任职要求</h4><p>1.具有3年以上手机端软件测试或开发经验，最少2年以上APP测试经验，熟悉产品开发和测试流程。</p><p>2.熟悉android及ios系统结构及App运行原理，熟悉linux, 熟练搭载测试环境，熟悉手机测试相关工具的使用对mysql和linux有一定的使用经验。</p><p>3.有自动化测试工作经验者优先考虑。</p>', '测试工程师', '', '1', '1', '2017-01-21 18:24:27', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '138', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('25', '2', '', '', '2017-01-21 16:52:45', '<h4>你将负责</h4><p>1.配合硬件工程师完成新产品的软件调试、制定测试规范、作业指导书。</p><p>2.根据研发需求，进行需求分析，概要设计、详细设计、编码、测试、调试等。</p><p>3.嵌入式系统驱动和应用程序开发维护。</p><p>4.组织产品在应用中的技术问题攻关。</p><p>5.常用总线如CAN总线、USB总线、SPA、I2C等相关接口通讯软件设计。</p><h4>任职要求</h4><p>1.具有8年以上工作经验且至少5年以上嵌入式软件编程经验。</p><p>2.精通C、C++嵌入式开发，熟悉单片机、ARM应用系统设计，至少熟悉一种汇编语言，熟悉8位、32位单片机、ARM，能熟练使用相关开发工具软件。</p><p>3.具有GPRS/3G/4G模块应用开发经验。</p><p>4.具有LINUX操作系统下开发经验，熟悉LINUX操作系统内核，USB、WLAN/串口、网口等驱动开发。</p><p>5.精通linux内核，具有内核裁剪经验优先。</p>', '嵌入式软件工程师', '', '1', '1', '2017-01-21 18:24:55', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '105', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('26', '2', '', '', '2017-01-21 16:52:57', '<h4>你将负责</h4><p>1.负责产品的开发、技术实现，能独立解决开发中的重难点问题。</p><p>2.WebGIS相关系统的需求分析、产品化技术设计与研发。</p><p>3.模块设计与开发。</p><p>4.开源Web技术研究与应用。</p><p>5.其它相关工作。</p><h4>任职要求</h4><p>1.地理信息系统、测绘工程、计算机、环境工程或相关专业本科以上学历。</p><p>2.具备良好的GIS及相关知识。</p><p>3.具备2年及以上WebGIS研发工作经验。</p><p>4.精通WebGIS开发技术，精通ArcGIS Server开发。</p><p>5.精通Java开发技术。</p><p>6.负责产品的开发、技术实现，能独立解决开发中的重难点问题。</p><p>7.熟悉B/S结构的GIS平台研究，能独立设计开发GIS系统者优先。</p><p>8.具备较强的GIS理论知识，具备地图投影、坐标变换的技能，熟悉GIS数据相关行业标准。</p><p>9.精通ArcGIS Desktop使用、ArcObjects开发。</p><p>10.精通SSM开发框架，熟悉MVC开发模式，熟练掌握Mysql数据库及SQL语言。</p><p>11.精通Java、jsp、javascript、XML等常用程序开发语言，能够熟练使用Eclipse、Idea等开发工具和CVS、Git、SVN等源代码版本控制工具，具备良好的程序设计风格。</p><p>12.掌握常用的设计模式。</p>', 'GIS开发工程师', '', '1', '1', '2017-01-21 18:25:28', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '132', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('27', '2', '', '', '2017-01-21 16:53:09', '<h4>你将负责</h4><p>1.根据产品需求和设计完成前端页面代码，实现交互效果 。</p><p>2.与后台工程师协作，完成数据交互、动态信息展现。</p><p>3.维护及优化网站前端页面执行性能和加载性能，优化前端代码规范。</p><h4>任职要求</h4><p>1.熟练运用html5/css3布局，具备一定的审美能力和观察能力，能快速精确的还原设计稿。</p><p>2.代码结构清晰，熟练使用javascript、ajax、jQuery，，有与服务端数据交互的经验，对web3.0标准有所了解，能轻松处理各种浏览器兼容问题。</p><p>3.熟悉基于html5的webapp 界面开发。</p><p>4.熟悉web前端的主流技术框架，懂得变通，能够写出高性能、可复用的前端组件。</p><p>5.有前端MV*框架（Angular.js、React.js、React Native）研发经验。</p><p>6.对模块化和组件有相关的见解。</p><p>7.熟悉前端构建工具基本用法（wepack、gulp、grunt）。</p><p>8.熟悉CSS预处理（less）、HTML模板的语法(handleabrs)。</p><p>9.有团队管理经验优先。</p>', 'Web前端工程师', '', '1', '1', '2017-01-21 18:25:53', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '139', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('28', '2', '', '', '2017-01-21 16:53:25', '<h4>你将负责</h4><p>1.负责项目的整体规划、实施方案的制定、组织统筹任务分发、资源调配，并按计划严格执行。</p><p>2.负责有效的控制质量、进度，达到预定项目目标，向主管领导报告项目进展状况，并对项目的实施成果进行整理、总结。</p><p>3.负责项目团队管理，任务分派和协调，团队培养,协调好团队内部关系。</p><p>3.优化项目实施管理流程，提升团队整体能力，提高项目质量。</p><p>4.协助业务部门技术需求调研，通过与用户交流，收集整理引导用户需求，并形成需求文档、原型等。</p><p>5.思维活跃，有创意，&nbsp;通过与部门沟通或者领导沟通能够有自己的想法，有信心和能力做出更精彩的项目。</p><h4>任职要求</h4><p>1.大学全日制本科或以上学历，计算机及相关专业。</p><p>2.5年或以上互联网或者软件业内工作经验,至少有2年以上同时管理多个软件项目和团队的经验。</p><p>3.熟悉Spring&nbsp;MVC、mybatis等相关开源项目并熟练使用常用版本管理工具，SVN或Git，熟练使用MySQL、Oracle等主流关系型数据库及相关开发。</p><p>4.熟练使用MS&nbsp;Project、Mindmanager、Visio、Axure、Powerpoint等项目经理常用工具。</p><p>5.具备较强的规划、组织、推动、进度控制、实施、监控及协调沟通能力，能带领团队出色完成项目。</p><p>6.具备非常强的问题分析与解决能力，且能够及时地协调与处理各种紧急需求或突发问题。</p><p>7.具有良好的文档撰写能力，具备用户需求分析经验，善于编写软件应用系统技术方案等。</p><p>8.出色的逻辑组织能力、能够自然、顺畅的与客户进行沟通并对客户进行必要引导，具备承担售前工作的能力。</p><p>9.具备优秀的职业素养，高度的工作热情，积极、主动、敢于担当，责任心强能够承担较大工作压力。</p>', '项目经理', '', '1', '1', '2017-07-05 13:08:08', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170705\\/595c7432eb168.png\",\"template\":\"\"}', '146', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('29', '2', '', '', '2017-01-21 16:53:38', '<h4>你将负责</h4><p>1. 承担集团内既有业务和新业务的信息化与互联网化项目的实施管理工作;组织项目实施团队，控制项目实施进度、项目质量和总体成本，控制本部门承接项目的阶段性验收工作。</p><p>2. 协助业务需求部门梳理业务规范、流程和主数据，推动信息系统与服务对象业务的融合，帮助服务对象实现互联网化。</p><p>3. 快速掌握公司现有的互联网平台和相关技术。</p><p>4. 组织制定、评审部门各项实施和服务标准，编制、完善实施和服务流程，并组织部门人员进行研究讨论，规范部门内部管理并付诸执行，提高工作效率。</p><p>5. 负责人才引进、考核、培训等工作，承担团队建设的职责。</p><p>6. 向上级汇报工作，并完成领导临时交办的其他工作。</p><h4>任职要求</h4><p>1. 全日制本科以上学历，计算机、通信、自动化、管理学或相关专业。</p><p>2. 5年以上信息化工作经验，3年及以上大型软件/项目的管理经验，具有大型企业信息化/互联网化规划和实施项目经验者优先；最好有ERP,物联网相关项目的实施经验。</p><p>3. 具备较为系统的项目管理知识和IT知识，具备较强的项目管理及客户需求把控能力。</p><p>4. 了解环保相关行业的基本知识，具备实践经验者优先考虑。</p><p>5. 具有较强计划、组织、指挥督导和协调能力，能较好地处理人际关系，具备与企业用户中高级别管理层沟通和对话的能力，能够化解各种冲突。</p><p>6. 具备良好的管理理念和技巧，能够合理安排工作计划、完成任务分派。</p>', '项目实施经理', '', '1', '1', '2017-01-21 18:27:15', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '110', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('30', '2', '', '', '2017-01-22 09:57:13', '<h4>你将负责</h4><p>1. 负责环卫云平台的调研以及规划，撰写合乎产品需求、逻辑缜密的产品需求文档，推动产品研发整个过程。</p><p>2. 结合需求能独立完成页面布局、原型图及流程图。</p><p>3. 跨部门协调沟通，与研发、测试、UI、推广部门等紧密结合，确保产品实现进度和质量，跟踪产品的设计、开发、发布、运营等环节，确保项目按时完成和上线。</p><p>4. 针对产品开发过程中的问题，提出需求优化解决方案，持续迭代。</p><p>5. 负责产品上线后向业务部门普及培训相关知识。</p><h4>任职要求</h4><p>1. 本科及以上学历，4年以上互联网产品经理工作经验。</p><p>2.熟练使用axure、xmind、viso等工具。</p><p>3.优秀的表达、沟通与协调能力、团队合作精神、保密意识。</p><p>4.智慧城市、智慧环卫工作经验优先，传统行业管理系统产品经验可优先考虑。</p>', '互联网产品经理', '', '1', '1', '2017-01-22 09:58:38', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '246', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('31', '2', '', '', '2017-01-22 09:58:43', '<h4>你将负责</h4><p>1.负责SaaS企业运营管理云平台需求分析、系统设计，提出解决方案，并编写需求分析和系统设计文档。</p><p>2.负责管理、组织需求和系统设计评审。</p><p>3.负责需求变更管理，需求的生命周期管理。</p><p>4.全方位管理监控项目的开发流程，及时对系统进行调整。</p><p>5.验收研发部门提交的产品是否满足业务需求。</p><p>6.配合收集和分析产品市场信息，进行产品背景调查，收集整理产品相关资料。</p><p>7.参与制订项目计划。</p><p>8.参与编制用户文档。</p><p>9.组织新产品上线测试、推广工作，跟踪、监控产品上线后的运营情况，不断对产品进行完善。</p><h4>任职要求</h4><p>1.至少5年以上需求分析，产品设计工作经验。</p><p>2.工作认真细心，具备责任心、团队意识，能承担较强工作压力。</p><p>3.良好的沟通能力、文档编写能力、组织协调能力。</p><p>4.对互联网及环境保护知识有一定积累对智慧社区、大数据等应用，对智慧城市有较为深入的理解认识优先。</p><p>5.有SaaS、ERP、企业运营管理系统经验者优先。</p>', '需求分析师', '', '1', '1', '2017-01-22 09:59:26', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '140', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('32', '2', '', '', '2017-01-22 10:00:13', '<h4>你将负责</h4><p>1.楼宇或小区电梯广告位置开发,维护好公司与物业的关系。</p><p>2.保证广告能够成功发布。</p><p>3.控制媒介租金。</p><p>4.制定合同签订合同。</p><p>5.订立季度开发目标，完成开发目标。</p><p>6.公司对外宣传，媒体开发。</p><h4>任职要求</h4><p>1.广告、公关、新闻传播学、市场营销等类专业本科以上学历。</p><p>2.有一定的广告客户资源优先，可独立开拓市场。</p><p>3.具有良好的沟通、协调能力，能够独立跟进、服务客户，具备专业的销售能力。</p>', '互联网渠道经理', '', '1', '1', '2017-01-22 10:01:00', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '92', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('33', '2', '', '', '2017-01-22 10:01:05', '<h4>你将负责</h4><p>1.全面负责公司产品的推广与销售工作。</p><p>2.掌握市场动态，分析客户需求，建设渠道，主动开拓，完成上级下达的任务指标。</p><p>3.独立完成项目的策划与推广，建立和维护良好的客户关系。</p><p>4.评估、预测和控制销售成本，促使销售利润最大化。</p><p>5.根据企业整体销售计划与战略，制定自身的销售目标与策略。</p><p>6.项目合同的策划与撰写，协助梳理客户需求，筹备商务材料、售前方案、功能及报价清单等。</p><p>7.收集市场及行业信息，参与市场推广各项工作。</p><p>8.完成领导交办的临时任务。</p><h4>任职要求</h4><p>1.计算机、环境工程或营销专业学历，具有环保行业、移动互联网行业及产品销售背景、两年及以上营销工作经验优先。</p><p>2.具有较强的市场调研、策划能力，对市场具有良好的洞察力，开拓能力。</p><p>3.勤奋、善沟通、有耐心、有韧性，有抗压能力。</p>', '营销', '', '1', '1', '2017-06-29 13:48:21', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '100', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('34', '2', '', '', '2017-01-22 10:01:34', '<h4>你将负责</h4><p>1.公司软件宣传文章的组织及写作。</p><p>2.产品宣传册的设计及产品优化的辅助设计。</p><p>3.参与公司官方网站、官方微信公众号等网络宣传渠道的建设、更新、维护的工作。</p><p>4.公司营销、广告、产品等企划的规划和实施工作。</p><p>5.企业形象策划与实施。</p><p>6.企业文化建设与监督管理。</p><p>7.收集同行业或相似企业的相关动态、市场信息、公司近期项目发展状况等信息。</p><p>8.维护和完善网上宣传管理制度、定期丰富和完善网络宣传渠道的功能。</p><h4>任职要求</h4><p>1.本科以上学历，新闻学、企业管理、中文等相关专业。</p><p>2.两年以上市场部企划宣传工作经验，有互联网、自动化、安全相关背景优先。</p><p>3.擅长分析思考，良好的文案写作能力。</p><p>4.一定的新闻、宣传渠道资源，能快速自主开展工作。</p><p>5.良好的沟通协调能力。</p>', '企业宣传策划', '', '1', '1', '2017-06-29 13:48:11', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '116', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('35', '1', '', '', '2017-07-04 10:10:14', '', '地址：北京市海淀区北四环西路66号中国技术交易大厦15层1518', '', '3', '1', '2017-07-04 10:20:00', null, '0', '1', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cmf_role`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `cmf_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------
INSERT INTO `cmf_role_user` VALUES ('1', '2');

-- ----------------------------
-- Table structure for `cmf_route`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('7', '2', '环卫云平台', 'admin/20161207/58476c19c0c4f.png', '/index.php?m=page&amp;a=index&amp;id=11', '环卫云平台，方便、快捷、直观', '1920尺寸的首页幻灯片', '1', '111');
INSERT INTO `cmf_slide` VALUES ('3', '1', '环卫云平台', 'admin/20161206/584688fa75621.png', '/index.php?m=page&amp;a=index&amp;id=11', '环卫云平台，方便、快捷、直观', '', '1', '11');
INSERT INTO `cmf_slide` VALUES ('4', '1', '桑德动力电池云平台', 'admin/20161206/5846890c1bfc1.png', '/index.php?m=page&amp;a=index&amp;id=13', '桑德动力电池云平台，方便、快捷、直观', '', '1', '12');
INSERT INTO `cmf_slide` VALUES ('5', '1', '桑德村镇水务云平台', 'admin/20161206/5846891c6b236.png', '/index.php?m=page&amp;a=index&amp;id=14', '桑德村镇水务云平台，方便、快捷、直观', '', '1', '13');
INSERT INTO `cmf_slide` VALUES ('6', '1', '物联网', 'admin/20161206/58468965ef534.png', '/index.php?m=page&amp;a=index&amp;id=12', '物联网，专为大型集团企业量身打造的一体化协同办公平台', '', '1', '14');
INSERT INTO `cmf_slide` VALUES ('8', '2', '桑德动力电池云平台', 'admin/20161207/58476c4e2fe0e.png', '/index.php?m=page&amp;a=index&amp;id=13', '桑德动力电池云平台，方便、快捷、直观', '1920尺寸的首页幻灯片', '1', '112');
INSERT INTO `cmf_slide` VALUES ('9', '2', '桑德村镇水务云平台', 'admin/20161207/58476c76093d1.png', '/index.php?m=page&amp;a=index&amp;id=14', '桑德村镇水务云平台，方便、快捷、直观', '尺寸1920的首页幻灯片', '1', '113');
INSERT INTO `cmf_slide` VALUES ('10', '2', '物联网', 'admin/20161207/58476ca7749ac.png', '/index.php?m=page&amp;a=index&amp;id=12', '物联网，专为大型集团企业量身打造的一体化协同办公平台', '尺寸1920的首页幻灯片', '1', '114');
INSERT INTO `cmf_slide` VALUES ('11', '3', '环卫云平台', 'admin/20170705/595c96afa2e6b.png', '/index.php?m=page&amp;a=index&amp;id=11', '标准化流程，精细化管理', '幻灯片底下 对应的 按钮图片', '1', '1111');
INSERT INTO `cmf_slide` VALUES ('12', '3', '桑德动力电池云平台', 'admin/20170705/595c969fa0745.png', '/index.php?m=page&amp;a=index&amp;id=13', '国内首家动力电池全生命周期管理系统', '', '1', '1112');
INSERT INTO `cmf_slide` VALUES ('13', '3', '桑德村镇水务云平台', 'admin/20170705/595c9689320c1.png', '/index.php?m=page&amp;a=index&amp;id=14', '运维规范化，规划科学化，决策智能化', '', '1', '1113');
INSERT INTO `cmf_slide` VALUES ('14', '3', '物联网', 'admin/20170705/595c94c5d70ed.png', '/index.php?m=page&amp;a=index&amp;id=12', '产业升级，实现社会新价值', '', '1', '1114');

-- ----------------------------
-- Table structure for `cmf_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of cmf_slide_cat
-- ----------------------------
INSERT INTO `cmf_slide_cat` VALUES ('1', '首页幻灯片1440', 'portal_index', '首页幻灯片1440尺寸的类别，需要与1920顺序一致', '1');
INSERT INTO `cmf_slide_cat` VALUES ('2', '首页幻灯片1920', 'portal_index_1920', '首页幻灯片1920的分类，需要与1440顺序一致', '1');
INSERT INTO `cmf_slide_cat` VALUES ('3', '首页按钮类别', 'portal_menu', '需要与首页幻灯片1920和1440顺序一致', '1');

-- ----------------------------
-- Table structure for `cmf_terms`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of cmf_terms
-- ----------------------------
INSERT INTO `cmf_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('3', '中间轮播', '', 'picture', '新闻类别的文章，首页显示', '0', '0', '0-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('4', '伙伴链接', '', 'article', 'footer底部的 伙伴网站链接', '0', '0', '0-4', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('5', '技术研发', '', 'article', '招贤纳士', '0', '0', '0-5', '', '', '', 'job', 'jobDetail', '0', '1');
INSERT INTO `cmf_terms` VALUES ('6', '产品', '', 'article', '招贤纳士', '0', '0', '0-6', '', '', '', 'job', 'jobDetail', '0', '1');
INSERT INTO `cmf_terms` VALUES ('7', '市场营销', '', 'article', '招贤纳士', '0', '0', '0-7', '', '', '', 'job', 'jobDetail', '0', '1');
INSERT INTO `cmf_terms` VALUES ('8', '宣传策划', '', 'article', '招贤纳士', '0', '0', '0-8', '', '', '', 'job', 'jobDetail', '0', '1');

-- ----------------------------
-- Table structure for `cmf_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of cmf_term_relationships
-- ----------------------------
INSERT INTO `cmf_term_relationships` VALUES ('1', '2', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('2', '3', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('3', '4', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('4', '5', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('5', '6', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('6', '7', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('7', '8', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('8', '9', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('9', '10', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('10', '17', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('11', '18', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('12', '21', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('13', '22', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('14', '23', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('15', '24', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('16', '25', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('17', '26', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('18', '27', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('19', '28', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('20', '29', '5', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('21', '30', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('22', '31', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('23', '32', '7', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('24', '33', '7', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('25', '34', '8', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('27', '35', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('28', '36', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('29', '37', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('30', '38', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('31', '39', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('32', '40', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('33', '41', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('34', '42', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('35', '43', '3', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('36', '44', '3', '0', '1');

-- ----------------------------
-- Table structure for `cmf_users`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_users
-- ----------------------------
INSERT INTO `cmf_users` VALUES ('1', 'admin', '###672cc04019b6f2f2df895fba748c74cf', 'admin', 'wangrs@cloudsmaker.net', 'www.cloudsmaker.net/', null, '0', null, '', '0.0.0.0', '2017-07-04 14:10:04', '2016-10-09 02:24:54', '', '1', '0', '1', '0', '');
INSERT INTO `cmf_users` VALUES ('2', 'jiazengchao', '###68d96f8db92e3d9ee3c5cda86ac4e9fd', '', 'jzc_email@163.com', '', null, '0', null, null, '119.57.88.50', '2017-06-09 14:02:24', '2016-10-09 18:32:29', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `cmf_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorites
-- ----------------------------
