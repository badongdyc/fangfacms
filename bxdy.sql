-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015-05-04 16:30:08
-- 服务器版本: 5.0.90-log
-- PHP 版本: 5.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bxdy`
--

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_activity`
--

CREATE TABLE IF NOT EXISTS `fangfa_activity` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '主键',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目ID',
  `title` char(80) NOT NULL default '' COMMENT '活动名称',
  `attr` set('top','scroll','hot') default NULL COMMENT '文档属性',
  `thumb` char(100) NOT NULL default '' COMMENT '活动海报',
  `description` varchar(250) default NULL COMMENT '活动摘要',
  `seokeywords` char(200) NOT NULL COMMENT '关键字',
  `seodescription` char(255) NOT NULL default '' COMMENT '描述',
  `seotitle` varchar(100) default NULL COMMENT 'SEO标题',
  `url` char(100) NOT NULL COMMENT '链接',
  `sort` tinyint(4) unsigned NOT NULL default '1' COMMENT '排序',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `template` varchar(50) default NULL COMMENT '模板名称',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '建立时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `start_time` int(11) default NULL COMMENT '活动开始时间',
  `end_time` int(11) default NULL COMMENT '活动结束时间',
  `content` text COMMENT '活动详情',
  `in_time` int(11) default NULL COMMENT '活动开始时间',
  `allowguest` tinyint(4) NOT NULL COMMENT '是否会员才能报名',
  `address` varchar(255) character set ucs2 default NULL COMMENT '活动地址',
  `chengbanfang` varchar(255) default NULL COMMENT '活动承办方',
  `zuzhifang` varchar(255) default NULL,
  `out_time` int(10) default NULL COMMENT '活动结束时间',
  `status` tinyint(2) NOT NULL default '0' COMMENT '待审=0,审核=9，回收站=-1',
  `vip` tinyint(2) NOT NULL COMMENT '允许会员参加=1，不允许会员参加=0',
  PRIMARY KEY  (`aid`),
  KEY `status` (`sort`,`aid`),
  KEY `listorder` (`catid`,`sort`,`aid`),
  KEY `catid` (`catid`,`aid`),
  KEY `updatetime` (`catid`,`update_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='动活列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_activity_apply`
--

CREATE TABLE IF NOT EXISTS `fangfa_activity_apply` (
  `mid` int(11) unsigned NOT NULL auto_increment COMMENT '主键',
  `bianhao` int(11) unsigned NOT NULL COMMENT '会员编号',
  `ip` char(15) NOT NULL COMMENT '报名ip地址',
  `aid` int(11) NOT NULL COMMENT '活动ID',
  `name` char(10) NOT NULL COMMENT '姓名',
  `tel` char(15) default NULL COMMENT '电话',
  `email` char(20) default NULL COMMENT '电子邮件',
  `qq` int(12) default NULL COMMENT 'qq',
  `message` text COMMENT '报名者留言',
  `create_time` int(11) default NULL COMMENT '创建时间',
  `update_time` int(11) default NULL COMMENT '更新时间',
  `reply` char(250) default NULL COMMENT '管理员回复',
  `reply_time` int(11) default NULL COMMENT '回复时间',
  `reply_user_id` tinyint(4) default NULL COMMENT '回复人ID',
  `status` enum('1','0','-1') default '0',
  PRIMARY KEY  (`mid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='活动报名表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_acts`
--

CREATE TABLE IF NOT EXISTS `fangfa_acts` (
  `aid` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL COMMENT '操作名称，中文',
  `appname` varchar(100) NOT NULL COMMENT '应用名称',
  `controller` varchar(100) default NULL COMMENT '控制器',
  `action` varchar(100) default NULL COMMENT '动作',
  `allow` varchar(255) default NULL COMMENT '允许访问的角色',
  `deny` varchar(255) default NULL COMMENT '禁止访问的角色',
  PRIMARY KEY  (`aid`),
  KEY `controller` (`controller`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='访问控制表' AUTO_INCREMENT=251 ;

--
-- 转存表中的数据 `fangfa_acts`
--

INSERT INTO `fangfa_acts` (`aid`, `name`, `appname`, `controller`, `action`, `allow`, `deny`) VALUES
(1, '活动内容管理', 'admin', 'factivity', 'manage', 'administrator', NULL),
(2, '录入要显示的内容', 'admin', 'factivity', 'add', 'administrator', NULL),
(3, '更新内容', 'admin', 'factivity', 'edit', 'administrator', NULL),
(4, '删除活动信息', 'admin', 'factivity', 'delete', 'administrator', NULL),
(5, '活动报名信息', 'admin', 'factivity', 'manage_apply', 'administrator', NULL),
(6, '添加报名信息', 'admin', 'factivity', 'add_apply', 'administrator', NULL),
(7, '报名信息修改', 'admin', 'factivity', 'edit_apply', 'administrator', NULL),
(8, '报名信息删除', 'admin', 'factivity', 'delete_apply', 'administrator', NULL),
(9, '标签管理', 'admin', 'fad', 'manage', 'administrator', NULL),
(10, '添加广告', 'admin', 'fad', 'add', 'administrator', NULL),
(11, '编辑广告', 'admin', 'fad', 'edit', 'administrator', NULL),
(12, 'AJAX获取AD表单', 'admin', 'fad', 'ajax_getform', 'administrator', NULL),
(13, '预览', 'admin', 'fad', 'preview', 'administrator', NULL),
(14, '分类管理', 'admin', 'fask', 'category_manage', 'administrator', NULL),
(15, '列表', 'admin', 'fask', 'manage', 'administrator', NULL),
(16, '编辑', 'admin', 'fask', 'edit', 'administrator', NULL),
(17, '删除', 'admin', 'fask', 'delete', 'administrator', NULL),
(18, '更新所有缓存', 'admin', 'fcache', 'all', 'administrator', NULL),
(19, '更新app缓存以及项目临时文件', 'admin', 'fcache', 'app', 'administrator', NULL),
(20, '更新首页', 'admin', 'fcache', 'index', 'administrator', NULL),
(21, '更新参数配置文件', 'admin', 'fcache', 'sysset', 'administrator', NULL),
(22, '更新act缓存', 'admin', 'fcache', 'act', 'administrator', NULL),
(23, '更新模型缓存', 'admin', 'fcache', 'model', 'administrator', NULL),
(24, '更新模块缓存', 'admin', 'fcache', 'module', 'administrator', NULL),
(25, '更新栏目缓存', 'admin', 'fcache', 'category', 'administrator', NULL),
(26, '更新菜单缓存', 'admin', 'fcache', 'menu', 'administrator', NULL),
(27, '更新角色信息缓存', 'admin', 'fcache', 'role', 'administrator', NULL),
(28, '缓存广告信息', 'admin', 'fcache', 'ad', 'administrator', NULL),
(29, '更新关键词链接', 'admin', 'fcache', 'keylink', 'administrator', NULL),
(30, '添加栏目', 'admin', 'fcategory', 'add', 'administrator', NULL),
(31, 'AJAX获取对应模型分类', 'admin', 'fcategory', 'ajaxgetclassify', 'administrator', NULL),
(32, '获取栏目信息', 'admin', 'fcategory', 'getcategory', 'administrator', NULL),
(33, '编辑栏目分类', 'admin', 'fcategory', 'edit', 'administrator', NULL),
(34, '栏目管理', 'admin', 'fcategory', 'manage', 'administrator', NULL),
(35, '删除栏目', 'admin', 'fcategory', 'delete', 'administrator', NULL),
(36, '列表', 'admin', 'fcomment', 'manage', 'administrator', NULL),
(37, '编辑', 'admin', 'fcomment', 'edit', 'administrator', NULL),
(38, '审核', 'admin', 'fcomment', 'check', 'administrator', NULL),
(39, '过滤敏感词', 'admin', 'fcomment', 'filter', 'administrator', NULL),
(40, '删除留言', 'admin', 'fcomment', 'delete', 'administrator', NULL),
(41, '内容管理', 'admin', 'fcontent', 'manage', 'administrator', NULL),
(42, '录入要显示的内容', 'admin', 'fcontent', 'add', 'administrator', NULL),
(43, '更新内容', 'admin', 'fcontent', 'edit', 'administrator', NULL),
(44, '获取分类信息', 'admin', 'fcontent', 'getclassify', 'administrator', NULL),
(45, '彻底删除信息', 'admin', 'fcontent', 'delete', 'administrator', NULL),
(46, '数据库备份', 'admin', 'fdb', 'backup', 'administrator', NULL),
(47, '数据库恢复', 'admin', 'fdb', 'restore', 'administrator', NULL),
(48, '删除备份', 'admin', 'fdb', 'del', 'administrator', NULL),
(49, '数据库修复', 'admin', 'fdb', 'repair', 'administrator', NULL),
(50, '数据表优化', 'admin', 'fdb', 'optimize', 'administrator', NULL),
(51, '查看数据表结构', 'admin', 'fdb', 'viewinfo', 'administrator', NULL),
(52, '编辑器管理入口', 'admin', 'feditor', 'manage', 'administrator', NULL),
(53, '上传入口', 'admin', 'feditor', 'upload', 'administrator', NULL),
(54, '图片库列表', 'admin', 'ffiles', 'images', 'administrator', NULL),
(55, '模板库', 'admin', 'ffiles', 'tpl', 'administrator', NULL),
(56, '管理入口', 'admin', 'ffriendlink', 'index', 'administrator', NULL),
(57, '友情链接管理', 'admin', 'ffriendlink', 'manage', 'administrator', NULL),
(58, '添加', 'admin', 'ffriendlink', 'add', 'administrator', NULL),
(59, '编辑', 'admin', 'ffriendlink', 'edit', 'administrator', NULL),
(60, '编辑', 'admin', 'ffriendlink', '_edit_ajax', 'administrator', NULL),
(61, '删除', 'admin', 'ffriendlink', 'delete', 'administrator', NULL),
(62, '分类管理', 'admin', 'ffriendlink', 'manage_type', 'administrator', NULL),
(63, '编辑', 'admin', 'ffriendlink', 'edit_type', 'administrator', NULL),
(64, '处理友情链接类型的AJAX请求', 'admin', 'ffriendlink', '_edit_type_ajax', 'administrator', NULL),
(65, '添加分类', 'admin', 'ffriendlink', 'add_type', 'administrator', NULL),
(66, '删除分类', 'admin', 'ffriendlink', 'delete_type', 'administrator', NULL),
(67, '列表', 'admin', 'fguestbook', 'manage', 'administrator', NULL),
(68, '编辑', 'admin', 'fguestbook', 'edit', 'administrator', NULL),
(69, '审核', 'admin', 'fguestbook', 'check', 'administrator', NULL),
(70, '过滤敏感词', 'admin', 'fguestbook', 'filter', 'administrator', NULL),
(71, '删除留言', 'admin', 'fguestbook', 'delete', 'administrator', NULL),
(72, '更新主页', 'admin', 'fhtml', 'index', 'administrator', NULL),
(73, '栏目页', 'admin', 'fhtml', 'category', 'administrator', NULL),
(74, '更新详细内容页', 'admin', 'fhtml', 'show', 'administrator', NULL),
(75, '生成', 'admin', 'fhtml', 'sitemaps', 'administrator', NULL),
(76, '生成rss文件', 'admin', 'fhtml', 'rss', 'administrator', NULL),
(77, '后台框架', 'admin', 'findex', 'index', 'administrator', NULL),
(78, '管理主页', 'admin', 'findex', 'home', 'administrator', NULL),
(79, '后台导航', 'admin', 'findex', 'map', 'administrator', NULL),
(80, '系统信息', 'admin', 'findex', 'system', 'administrator', NULL),
(81, '测试', 'admin', 'findex', 'test', 'administrator', NULL),
(82, '职位列表', 'admin', 'fjob', 'manage', 'administrator', NULL),
(83, '添加职位', 'admin', 'fjob', 'add', 'administrator', NULL),
(84, '编辑职位', 'admin', 'fjob', 'edit', 'administrator', NULL),
(85, '修改状态', 'admin', 'fjob', 'check', 'administrator', NULL),
(86, '删除职位', 'admin', 'fjob', 'delete', 'administrator', NULL),
(87, '简历列表', 'admin', 'fjob', 'resume_manage', 'administrator', NULL),
(88, '查看简历', 'admin', 'fjob', 'resume_show', 'administrator', NULL),
(89, '删除简历', 'admin', 'fjob', 'resume_delete', 'administrator', NULL),
(90, '编辑简历', 'admin', 'fjob', 'resume_edit', 'administrator', NULL),
(91, '系统登录', 'admin', 'flogin', 'index', 'administrator', NULL),
(92, '注销登录', 'admin', 'flogin', 'logout', 'administrator', NULL),
(93, '验证码', 'admin', 'flogin', 'verify', 'administrator', NULL),
(94, '找回密码', 'admin', 'flogin', 'getpwd', 'administrator', NULL),
(95, '设置密码', 'admin', 'flogin', 'setpwd', 'administrator', NULL),
(96, '管理员管理', 'admin', 'fmanager', 'manage', 'administrator', NULL),
(97, '添加管理员', 'admin', 'fmanager', 'add', 'administrator', NULL),
(98, '编辑管理员', 'admin', 'fmanager', 'edit', 'administrator', NULL),
(99, '删除管理员', 'admin', 'fmanager', 'delete', 'administrator', NULL),
(100, '会员模型列表', 'admin', 'fmember', 'manage_model', 'administrator', NULL),
(101, '新增模型', 'admin', 'fmember', 'add_model', 'administrator', NULL),
(102, '字段列表', 'admin', 'fmember', 'list_field', 'administrator', NULL),
(103, '添加', 'admin', 'fmember', 'add_field', 'administrator', NULL),
(104, '编辑模型', 'admin', 'fmember', 'update_model', 'administrator', NULL),
(105, '删除模型', 'admin', 'fmember', 'del_model', 'administrator', NULL),
(106, '删除字段', 'admin', 'fmember', 'del_field', 'administrator', NULL),
(107, '启用', 'admin', 'fmember', 'status_model', 'administrator', NULL),
(108, '启用', 'admin', 'fmember', 'status_field', 'administrator', NULL),
(109, '预览模型', 'admin', 'fmember', 'preview_model', 'administrator', NULL),
(110, '导出模型', 'admin', 'fmember', 'export_model', 'administrator', NULL),
(111, '会员角色管理', 'admin', 'fmember', 'manage_group', 'administrator', NULL),
(112, '添加会员角色', 'admin', 'fmember', 'add_group', 'administrator', NULL),
(113, '编辑会员角色', 'admin', 'fmember', 'update_group', 'administrator', NULL),
(114, '删除会员角色', 'admin', 'fmember', 'delete_group', 'administrator', NULL),
(115, '启用', 'admin', 'fmember', 'status_group', 'administrator', NULL),
(116, '会员模块配置', 'admin', 'fmember', 'setting_module', 'administrator', NULL),
(117, '模型列表', 'admin', 'fmodel', 'manage', 'administrator', NULL),
(118, '字段列表', 'admin', 'fmodel', 'list_field', 'administrator', NULL),
(119, '新增模型', 'admin', 'fmodel', 'add_model', 'administrator', NULL),
(120, '编辑模型', 'admin', 'fmodel', 'update_model', 'administrator', NULL),
(121, '添加', 'admin', 'fmodel', 'add_field', 'administrator', NULL),
(122, '删除模型', 'admin', 'fmodel', 'del_model', 'administrator', NULL),
(123, '删除字段', 'admin', 'fmodel', 'del_field', 'administrator', NULL),
(124, '启用', 'admin', 'fmodel', 'status_model', 'administrator', NULL),
(125, '启用', 'admin', 'fmodel', 'status_field', 'administrator', NULL),
(126, '导出模型', 'admin', 'fmodel', 'export_model', 'administrator', NULL),
(127, '导入模型', 'admin', 'fmodel', 'import_model', 'administrator', NULL),
(128, '预览模型', 'admin', 'fmodel', 'preview_model', 'administrator', NULL),
(129, '模块管理', 'admin', 'fmodule', 'manage', 'administrator', NULL),
(130, '注册模块', 'admin', 'fmodule', 'add', 'administrator', NULL),
(131, '注册', 'admin', 'fmodule', 'edit', 'administrator', NULL),
(132, '删除模块', 'admin', 'fmodule', 'delete', 'administrator', NULL),
(133, '更新模块缓存信息', 'admin', 'fmodule', 'cache', 'administrator', NULL),
(134, '订单管理', 'admin', 'forder', 'manage', 'administrator', NULL),
(135, '修改订单', 'admin', 'forder', 'edit', 'administrator', NULL),
(136, '查看订单详情', 'admin', 'forder', 'show', 'administrator', NULL),
(137, '查看某个订单的日志记录', 'admin', 'forder', 'log', 'administrator', NULL),
(138, '模块配置', 'admin', 'forder', 'setting', 'administrator', NULL),
(139, '单页处理', 'admin', 'fpage', 'manage', 'administrator', NULL),
(140, '编辑个人资料', 'admin', 'fprofile', 'edit', 'administrator', NULL),
(141, '修改个人密码', 'admin', 'fprofile', 'pwd', 'administrator', NULL),
(142, '注销登录', 'admin', 'fprofile', 'logout', 'administrator', NULL),
(143, '模块操作列表', 'admin', 'frbac', 'manage', 'administrator', NULL),
(144, '添加模块', 'admin', 'frbac', 'add', 'administrator', NULL),
(145, '编辑模块', 'admin', 'frbac', 'edit', 'administrator', NULL),
(146, '取消模块注册', 'admin', 'frbac', 'delete', 'administrator', NULL),
(147, '角色授权', 'admin', 'frbac', 'power', 'administrator', NULL),
(148, '自动注册模块', 'admin', 'frbac', 'Autoadd', 'administrator', NULL),
(149, '角色管理', 'admin', 'frole', 'manage', 'administrator', NULL),
(150, '添加角色', 'admin', 'frole', 'add', 'administrator', NULL),
(151, '编辑角色', 'admin', 'frole', 'edit', 'administrator', NULL),
(152, '删除角色', 'admin', 'frole', 'delete', 'administrator', NULL),
(153, '启用', 'admin', 'frole', 'status', 'administrator', NULL),
(154, '栏目管理', 'admin', 'fsalenet', 'category_manage', 'administrator', NULL),
(155, '营销内容管理', 'admin', 'fsalenet', 'manage', 'administrator', NULL),
(156, '审核内容', 'admin', 'fsalenet', 'check', 'administrator', NULL),
(157, '录入要显示的内容', 'admin', 'fsalenet', 'add', 'administrator', NULL),
(158, '更新内容', 'admin', 'fsalenet', 'edit', 'administrator', NULL),
(159, '删除营销信息', 'admin', 'fsalenet', 'delete', 'administrator', NULL),
(160, '系统设置', 'admin', 'fset', 'set', 'administrator', NULL),
(161, '菜单管理', 'admin', 'fset', 'menu', 'administrator', NULL),
(162, '系统参数设置', 'admin', 'fset', 'arg', 'administrator', NULL),
(163, '关键词链接', 'admin', 'fset', 'keylink', 'administrator', NULL),
(164, 'TODO更新参数缓存', 'admin', 'fset', 'cacheset', 'administrator', NULL),
(165, '常规的添加', 'admin', 'fset', 'addData', 'administrator', NULL),
(166, '常规的删除操作', 'admin', 'fset', 'deleteData', 'administrator', NULL),
(167, '数据列表', 'admin', 'fset', 'manageData', 'administrator', NULL),
(168, '问卷列表', 'admin', 'fsurvey', 'manage', 'administrator', NULL),
(169, '添加问卷', 'admin', 'fsurvey', 'add', 'administrator', NULL),
(170, '编辑问卷', 'admin', 'fsurvey', 'edit', 'administrator', NULL),
(171, '问卷主题列表', 'admin', 'fsurvey', 'survey_manage_subject', 'administrator', NULL),
(172, '管理问题', 'admin', 'fsurvey', 'manage_question', 'administrator', NULL),
(173, '编辑问题', 'admin', 'fsurvey', 'edit_question', 'administrator', NULL),
(174, '添加问题', 'admin', 'fsurvey', 'add_question', 'administrator', NULL),
(175, '删除问题', 'admin', 'fsurvey', 'delete_question', 'administrator', NULL),
(176, '问卷主题编辑', 'admin', 'fsurvey', 'survey_edit_subject', 'administrator', NULL),
(177, '删除问卷', 'admin', 'fsurvey', 'delete', 'administrator', NULL),
(178, '重置数据', 'admin', 'fsurvey', 'reset', 'administrator', NULL),
(179, 'tag管理', 'admin', 'ftag', 'manage', 'administrator', NULL),
(180, '添加TAG', 'admin', 'ftag', 'add', 'administrator', NULL),
(181, '编辑TAG', 'admin', 'ftag', 'edit', 'administrator', NULL),
(182, '模板管理', 'admin', 'ftpl', 'manage', 'administrator', NULL),
(183, '模板编辑', 'admin', 'ftpl', 'edit', 'administrator', NULL),
(184, '删除模板', 'admin', 'ftpl', 'delete', 'administrator', NULL),
(185, '清除模板缓存', 'admin', 'ftpl', 'cache', 'administrator', NULL),
(186, '标签生成向导', 'admin', 'ftpl', 'create_tag', 'administrator', NULL),
(187, '处理模型上传字段的上传动作', 'admin', 'fupload', 'fieldupload', 'administrator', NULL),
(188, '普遍上传', 'admin', 'fupload', 'CommonUpload', 'administrator', NULL),
(189, '会员管理', 'admin', 'fuser', 'manage', 'administrator', NULL),
(190, '添加会员', 'admin', 'fuser', 'add', 'administrator', NULL),
(191, '编辑会员', 'admin', 'fuser', 'edit', 'administrator', NULL),
(192, '删除会员', 'admin', 'fuser', 'delete', 'administrator', NULL),
(193, '投票列表', 'admin', 'fvote', 'manage', 'administrator', NULL),
(194, '添加投票', 'admin', 'fvote', 'add', 'administrator', NULL),
(195, '编辑投票', 'admin', 'fvote', 'edit', 'administrator', NULL),
(196, '删除问卷', 'admin', 'fvote', 'delete', 'administrator', NULL),
(197, '查看问卷统计', 'admin', 'fvote', 'voteshow', 'administrator', NULL),
(198, '问卷列表', 'admin', 'fvote', 'survey_manage', 'administrator', NULL),
(199, '添加问卷', 'admin', 'fvote', 'survey_add', 'administrator', NULL),
(200, '编辑问卷', 'admin', 'fvote', 'survey_edit', 'administrator', NULL),
(201, '问卷主题列表', 'admin', 'fvote', 'survey_manage_subject', 'administrator', NULL),
(202, '问卷主题编辑', 'admin', 'fvote', 'survey_edit_subject', 'administrator', NULL),
(203, '重置数据', 'admin', 'fvote', 'reset', 'administrator', NULL),
(204, '数据列表', 'admin', 'fvote', 'manageData', 'administrator', NULL),
(205, '活动报名频道页', 'front', 'factivity', 'index', NULL, NULL),
(206, '活动报名列表页面', 'front', 'factivity', 'lists', NULL, NULL),
(207, '活动列表显示', 'front', 'factivity', 'show', NULL, NULL),
(208, '问答列表页', 'front', 'fask', 'index', NULL, NULL),
(209, '问答详情页', 'front', 'fask', 'show', NULL, NULL),
(210, '提交问答表单页', 'front', 'fask', 'add', NULL, NULL),
(211, '显示购物车', 'front', 'fcart', 'show', NULL, NULL),
(212, '评论展示', 'front', 'fcomment', 'show', NULL, NULL),
(213, '添加评论', 'front', 'fcomment', 'add', NULL, NULL),
(214, '过滤敏感词', 'front', 'fcomment', 'filter', NULL, NULL),
(215, '栏目页', 'front', 'fcontent', 'index', NULL, NULL),
(216, '详细内容信息', 'front', 'fcontent', 'show', NULL, NULL),
(217, 'PHP方式下载指定文件', 'front', 'fcontent', 'down', NULL, NULL),
(218, '浏览次数', 'front', 'fcontent', 'count', NULL, NULL),
(219, '发送邮件', 'front', 'femail', 'index', NULL, NULL),
(220, '留言板首页列表页', 'front', 'fguestbook', 'index', NULL, NULL),
(221, '添加留言', 'front', 'fguestbook', 'add', NULL, NULL),
(222, '过滤敏感词', 'front', 'fguestbook', 'filter', NULL, NULL),
(223, '系统首页', 'front', 'findex', 'index', NULL, NULL),
(224, '验证码', 'front', 'findex', 'verify', NULL, NULL),
(225, '用户注册', 'front', 'findex', 'register', NULL, NULL),
(226, '登入系统', 'front', 'findex', 'login', NULL, NULL),
(227, '网站地图', 'front', 'findex', 'sitemap', NULL, NULL),
(228, '链接重定向', 'front', 'findex', 'redirect', NULL, NULL),
(229, '链接重定向', 'front', 'findex', 'form', NULL, NULL),
(230, '列表頁', 'front', 'fjob', 'index', NULL, NULL),
(231, '职位详情', 'front', 'fjob', 'show', NULL, NULL),
(232, '投递简历', 'front', 'fjob', 'send', NULL, NULL),
(233, '提交购物车物品', 'front', 'forder', 'submit', NULL, NULL),
(234, '添加订单', 'front', 'forder', 'add', NULL, NULL),
(235, '确认订单', 'front', 'forder', 'confirm', NULL, NULL),
(236, '显示单页详细信息', 'front', 'fpage', 'show', NULL, NULL),
(237, '频道页', 'front', 'fsalenet', 'index', NULL, NULL),
(238, '职位详情', 'front', 'fsalenet', 'show', NULL, NULL),
(239, '站内搜索入口', 'front', 'fsearch', 'index', NULL, NULL),
(240, '站内搜索', 'front', 'fsearch', 'manage', NULL, NULL),
(241, '登录后会员中心主页', 'front', 'fuser', 'home', NULL, NULL),
(242, '编辑个人资料', 'front', 'fuser', 'edit', NULL, NULL),
(243, '用户忘记密码', 'front', 'fuser', 'forget', NULL, NULL),
(244, '注销登录', 'front', 'fuser', 'logout', NULL, NULL),
(245, '验证码', 'front', 'fverify', 'index', NULL, NULL),
(246, '投票列表页', 'front', 'fvote', 'index', NULL, NULL),
(247, '处理投票', 'front', 'fvote', 'add', NULL, NULL),
(248, '投票页', 'front', 'fvote', 'vote', NULL, NULL),
(249, '验证码', 'front', 'fvote', 'verify', NULL, NULL),
(250, '结果页', 'front', 'fvote', 'show', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_ad`
--

CREATE TABLE IF NOT EXISTS `fangfa_ad` (
  `aid` mediumint(8) unsigned NOT NULL auto_increment,
  `type` enum('flash','image','html','link','banner','banner_t') NOT NULL default 'html' COMMENT '关高类型',
  `name` varchar(60) NOT NULL default '' COMMENT '广告位名称',
  `starttime` datetime NOT NULL default '0000-00-00 00:00:00' COMMENT '开始时间',
  `endtime` datetime NOT NULL default '0000-00-00 00:00:00' COMMENT '到期时间',
  `setting` text COMMENT '广告设置',
  `expbody` text COMMENT '过期显示内容',
  `update_time` datetime default NULL,
  PRIMARY KEY  (`aid`),
  KEY `tagname` (`type`,`endtime`,`starttime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fangfa_ad`
--

INSERT INTO `fangfa_ad` (`aid`, `type`, `name`, `starttime`, `endtime`, `setting`, `expbody`, `update_time`) VALUES
(1, 'banner', '首页轮播', '2015-03-24 15:55:56', '2050-12-30 00:00:00', 'array (\n  ''width'' => '''',\n  ''height'' => '''',\n  ''bimage'' => \n  array (\n    0 => ''images/2015/03/20150324155712126.jpg'',\n    1 => ''images/2015/03/20150324155717133.jpg'',\n    2 => ''images/2015/03/20150324155721136.jpg'',\n    3 => '''',\n    4 => '''',\n  ),\n  ''blink'' => \n  array (\n    0 => '''',\n    1 => '''',\n    2 => '''',\n    3 => '''',\n    4 => '''',\n  ),\n)', NULL, '2015-03-24 15:57:23'),
(2, 'image', '微信', '2015-03-24 16:03:57', '2050-12-30 00:00:00', 'array (\n  ''imagewidth'' => '''',\n  ''imageheight'' => '''',\n  ''image'' => ''images/2015/03/20150324160457194.png'',\n  ''alt'' => '''',\n  ''link'' => '''',\n)', NULL, '2015-03-24 16:04:59'),
(3, 'image', '新浪微博', '2015-03-24 16:05:23', '2050-12-30 00:00:00', 'array (\n  ''imagewidth'' => '''',\n  ''imageheight'' => '''',\n  ''image'' => ''images/2015/03/20150324160543143.png'',\n  ''alt'' => '''',\n  ''link'' => '''',\n)', NULL, '2015-03-24 16:05:44');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_ask`
--

CREATE TABLE IF NOT EXISTS `fangfa_ask` (
  `ask_id` mediumint(9) NOT NULL auto_increment,
  `catid` mediumint(9) NOT NULL,
  `ask_category_id` mediumint(9) NOT NULL,
  `parentid` mediumint(9) NOT NULL,
  `title` text,
  `content` text,
  `good_answer` tinyint(1) default '0',
  `user_id` mediumint(9) default NULL,
  `username` varchar(255) default NULL,
  `answernum` mediumint(9) default '0',
  `ip` varchar(32) default NULL,
  `status` tinyint(4) default '1',
  `create_time` int(10) default NULL,
  `update_time` int(10) default NULL,
  PRIMARY KEY  (`ask_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问答表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_ask_category`
--

CREATE TABLE IF NOT EXISTS `fangfa_ask_category` (
  `ask_category_id` mediumint(9) NOT NULL auto_increment,
  `catid` mediumint(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentid` mediumint(9) NOT NULL default '0',
  `sort` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) default NULL,
  PRIMARY KEY  (`ask_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问答分类表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_bloguser`
--

CREATE TABLE IF NOT EXISTS `fangfa_bloguser` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `type` varchar(20) NOT NULL COMMENT '微博名称',
  `code` char(32) NOT NULL COMMENT '用于重新授权',
  `access_token` char(32) default NULL,
  `refresh_token` char(32) default NULL,
  `openid` char(32) default NULL,
  `openkey` char(32) default NULL,
  `datelimit` int(10) NOT NULL COMMENT '授权时间限制',
  `state` tinyint(1) NOT NULL default '1' COMMENT '状态（0、关闭 1、开启）',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微博用户列表' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_brcode`
--

CREATE TABLE IF NOT EXISTS `fangfa_brcode` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '二维码地址',
  `size` tinyint(1) NOT NULL default '1' COMMENT '二维码尺寸',
  `content` text COMMENT '二维码内容',
  `user_id` int(10) NOT NULL COMMENT '添加者ID',
  `username` varchar(50) default NULL COMMENT '用户名',
  `created` int(10) unsigned default NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL default '0' COMMENT '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='二维码列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_category`
--

CREATE TABLE IF NOT EXISTS `fangfa_category` (
  `catid` smallint(5) unsigned NOT NULL auto_increment,
  `modelid` tinyint(4) unsigned NOT NULL default '0' COMMENT '模型ID',
  `type` enum('normal','page','link') NOT NULL default 'normal' COMMENT '栏目类型：普通，单页，外链',
  `controller` varchar(50) NOT NULL default ' ' COMMENT '控制器名称，冗余字段',
  `parentid` tinyint(4) unsigned NOT NULL default '0' COMMENT '父栏目ID',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `ename` varchar(255) NOT NULL COMMENT '栏目别名',
  `thumb` varchar(100) default NULL COMMENT '缩略图',
  `catdir` varchar(100) default NULL COMMENT '栏目目录',
  `description` varchar(250) default NULL COMMENT '栏目说明',
  `seotitle` varchar(80) default NULL COMMENT '栏目SEO标题',
  `seokeywords` varchar(250) default NULL COMMENT '栏目SEO关键字',
  `seodescription` varchar(250) default NULL COMMENT '栏目SEO描述',
  `url` varchar(200) default NULL COMMENT '栏目链接',
  `template` varchar(200) default NULL COMMENT '栏目各页面的模板配置',
  `permissions` text COMMENT '栏目权限设置',
  `setting` text COMMENT '栏目的私有属性的配置',
  `ishtml` tinyint(1) NOT NULL default '0' COMMENT '是否静态目录',
  `islock` tinyint(1) NOT NULL default '0' COMMENT '是否锁定，锁定不能删除',
  `sort` smallint(4) unsigned NOT NULL default '1' COMMENT '栏目排序',
  `cattype` enum('cla','cat','site') NOT NULL default 'cat' COMMENT '‘cla’分类，‘cat’栏目,''site''分表',
  `topcatid` varchar(50) NOT NULL default '0' COMMENT '分类的顶级父目录，仅供分类使用',
  PRIMARY KEY  (`catid`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='栏目表' AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `fangfa_category`
--

INSERT INTO `fangfa_category` (`catid`, `modelid`, `type`, `controller`, `parentid`, `name`, `ename`, `thumb`, `catdir`, `description`, `seotitle`, `seokeywords`, `seodescription`, `url`, `template`, `permissions`, `setting`, `ishtml`, `islock`, `sort`, `cattype`, `topcatid`) VALUES
(1, 0, 'link', ' ', 0, '走进达亿', '走进达亿', '', NULL, '', NULL, NULL, NULL, 'HTTP_SERVER/comedy.html', NULL, NULL, NULL, 0, 1, 1, 'cat', '1'),
(2, 0, 'page', 'fpage', 1, '公司介绍', '公司介绍', '', NULL, '', '公司介绍 - {stitle}', '公司介绍', '公司介绍', 'comedy.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/show.html'',\n  ),\n)', 1, 1, 1, 'cat', '1'),
(3, 0, 'page', 'fpage', 1, '总经理致辞', '总经理致辞', '', NULL, '', '总经理致辞 - {stitle}', '总经理致辞', '总经理致辞', 'speech.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/show.html'',\n  ),\n)', 1, 0, 2, 'cat', '1'),
(4, 0, 'page', 'fpage', 1, '组织架构', '组织架构', '', NULL, '', '组织架构 - {stitle}', '组织架构', '组织架构', 'organization.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/show.html'',\n  ),\n)', 1, 0, 3, 'cat', '1'),
(6, 0, 'page', 'fpage', 1, '企业文化', '企业文化', '', NULL, '', '企业文化 - {stitle}', '企业文化', '企业文化', 'culture.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/show.html'',\n  ),\n)', 1, 0, 5, 'cat', '1'),
(7, 0, 'link', ' ', 0, '新闻资讯', '新闻资讯', '', NULL, '', NULL, NULL, NULL, 'HTTP_SERVER/information', NULL, NULL, NULL, 0, 0, 2, 'cat', '7'),
(8, 16, 'normal', 'fcontent', 7, '公司新闻', '公司新闻', '', 'information', '', '公司新闻 - {stitle}', '公司新闻', '公司新闻', 'information/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/cnews_list.html'',\n    ''show'' => ''content/cnews_view.html'',\n  ),\n)', 1, 1, 1, 'cat', '7'),
(9, 16, 'normal', 'fcontent', 7, '项目动态', '项目动态', '', 'project', '', '项目动态 - {stitle}', '项目动态', '项目动态', 'project/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/pnews_list.html'',\n    ''show'' => ''content/pnews_view.html'',\n  ),\n)', 1, 0, 2, 'cat', '7'),
(10, 16, 'normal', 'fcontent', 7, '公司公告', '公司公告', '', 'announcements', '', '公司公告 - {stitle}', '公司公告', '公司公告', 'announcements/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/pnews_list.html'',\n    ''show'' => ''content/pnews_view.html'',\n  ),\n)', 1, 0, 3, 'cat', '7'),
(11, 16, 'normal', 'fcontent', 7, '媒体报道', '媒体报道', '', 'report', '', '媒体报道 - {stitle}', '媒体报道', '媒体报道', 'report/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/cnews_list.html'',\n    ''show'' => ''content/cnews_view.html'',\n  ),\n)', 1, 0, 4, 'cat', '7'),
(12, 0, 'link', ' ', 0, '项目展示', '项目展示', '', NULL, '', NULL, NULL, NULL, 'pshow', NULL, NULL, NULL, 0, 0, 3, 'cat', '12'),
(13, 17, 'normal', 'fcontent', 12, '已有项目', '已有项目', '', 'pshow', '', '已有项目 - {stitle}', '已有项目', '已有项目', 'pshow/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/promodel_list.html'',\n    ''show'' => ''content/promodel_view.html'',\n  ),\n)', 1, 1, 1, 'cat', '12'),
(15, 17, 'normal', 'fcontent', 12, '规划项目', '规划项目', '', 'planned', '', '规划项目 - {stitle}', '规划项目', '规划项目', 'planned/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/promodel_list.html'',\n    ''show'' => ''content/promodel_view.html'',\n  ),\n)', 1, 0, 2, 'cat', '12'),
(16, 0, 'link', ' ', 0, '商务合作', '商务合作', '', NULL, '', NULL, NULL, NULL, 'HTTP_SERVER/cooperation.html', NULL, NULL, NULL, 0, 0, 4, 'cat', '16'),
(17, 0, 'page', 'fpage', 16, '合作共赢', '合作共赢', '', NULL, '', '合作共赢 - {stitle}', '合作共赢', '合作共赢', 'cooperation.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/cshow.html'',\n  ),\n)', 1, 1, 1, 'cat', '16'),
(18, 0, 'page', 'fpage', 16, '招商信息', '招商信息', '', NULL, '', '招商信息 - {stitle}', '招商信息', '招商信息', 'zsxx.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/cshow.html'',\n  ),\n)', 1, 0, 2, 'cat', '16'),
(21, 0, 'link', ' ', 0, '人力资源', '人力资源', '', NULL, '', NULL, NULL, NULL, 'HTTP_SERVER/rlzy.html', NULL, NULL, NULL, 0, 0, 5, 'cat', '21'),
(19, 16, 'normal', 'fcontent', 16, '招标告示', '招标告示', '', 'zbgs', '', '招标告示 - {stitle}', '招标告示', '招标告示', 'zbgs/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''content/coop_list.html'',\n    ''show'' => ''content/coop_view.html'',\n  ),\n)', 1, 0, 3, 'cat', '16'),
(20, 18, 'normal', 'fguestbook', 16, '我要合作', '我要合作', '', 'wyhz', '', '我要合作 - {stitle}', '我要合作', '我要合作', 'wyhz/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''guestbook/index.html'',\n    ''show'' => ''guestbook/submit.html'',\n  ),\n  ''islogin'' => ''0'',\n  ''isstatus'' => ''0'',\n  ''isfilter'' => ''0'',\n)', 0, 0, 4, 'cat', '16'),
(22, 0, 'page', 'fpage', 21, '人才理念', '人才理念', '', NULL, '', '人才理念 - {stitle}', '人才理念', '人才理念', 'rlzy.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/rshow.html'',\n  ),\n)', 1, 1, 1, 'cat', '21'),
(28, 9, 'normal', 'fjob', 21, '招聘职位', '招聘职位', '', 'zwzp', '', '招聘职位 - {stitle}', '招聘职位', '招聘职位', 'zwzp/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''resume_manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''resume_delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''resume_show'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''job/index.html'',\n    ''show'' => ''job/show.html'',\n    ''send'' => ''job/send.html'',\n  ),\n  ''islogin'' => ''0'',\n  ''maxsize'' => ''300'',\n  ''allow_ext'' => ''rar|zip|doc|xls|wps|et'',\n)', 1, 0, 2, 'cat', '21'),
(24, 0, 'page', 'fpage', 21, '应聘方式', '应聘方式', '', NULL, '', '应聘方式 - {stitle}', '应聘方式', '应聘方式', 'ypfs.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/rshow.html'',\n  ),\n)', 1, 0, 3, 'cat', '21'),
(25, 0, 'link', ' ', 0, '联系我们', '联系我们', '', NULL, '', NULL, NULL, NULL, 'HTTP_SERVER/lxwm.html', NULL, NULL, NULL, 0, 1, 6, 'cat', '25'),
(26, 0, 'page', 'fpage', 25, '联系我们', '联系我们', '', NULL, '', '联系我们 - {stitle}', '联系我们', '联系我们', 'lxwm.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/lshow.html'',\n  ),\n)', 1, 1, 1, 'cat', '25'),
(27, 18, 'normal', 'fguestbook', 25, '投诉建议', '投诉建议', '', 'tsjy', '', '投诉建议 - {stitle}', '投诉建议', '投诉建议', 'tsjy/', NULL, 'array (\n  ''admin'' => \n  array (\n    ''add'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''edit'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''check'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''delete'' => \n    array (\n      0 => ''administrator'',\n    ),\n    ''manage'' => \n    array (\n      0 => ''administrator'',\n    ),\n  ),\n)', 'array (\n  ''template'' => \n  array (\n    ''index'' => ''guestbook/cindex.html'',\n    ''show'' => ''guestbook/submit.html'',\n  ),\n  ''islogin'' => ''0'',\n  ''isstatus'' => ''0'',\n  ''isfilter'' => ''0'',\n)', 0, 0, 2, 'cat', '25'),
(30, 0, 'page', 'fpage', 1, '领导关怀', '', '', NULL, '', '领导关怀 - {stitle}', '领导关怀', '领导关怀', 'ldgh.html', NULL, NULL, 'array (\n  ''template'' => \n  array (\n    ''show'' => ''page/show.html'',\n  ),\n)', 1, 0, 4, 'cat', '1');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_collect`
--

CREATE TABLE IF NOT EXISTS `fangfa_collect` (
  `c_id` int(11) NOT NULL auto_increment,
  `name` varchar(250) NOT NULL COMMENT '结点名称',
  `source_lang` varchar(20) NOT NULL COMMENT '编码',
  `source_type` varchar(10) NOT NULL COMMENT '数据来源类型',
  `source_url` varchar(250) NOT NULL COMMENT '结点url',
  `profiex_url` varchar(100) NOT NULL COMMENT 'url前缀',
  `prefix_img` varchar(100) NOT NULL COMMENT '图片地址前缀',
  `html_start` varchar(250) NOT NULL COMMENT 'html开始区域',
  `html_end` varchar(250) NOT NULL COMMENT 'html结束区域',
  `have_is` varchar(250) NOT NULL COMMENT '必须包含',
  `have_not` varchar(250) NOT NULL COMMENT '不包含',
  `into_catid` int(11) NOT NULL COMMENT '导入栏目',
  `into_is` int(11) NOT NULL,
  `replace` text NOT NULL COMMENT '替换设置',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY  (`c_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_collect_page`
--

CREATE TABLE IF NOT EXISTS `fangfa_collect_page` (
  `pid` int(11) NOT NULL auto_increment,
  `c_id` int(11) default NULL COMMENT '结点编号',
  `title` varchar(200) default NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `source` varchar(100) default NULL COMMENT '文章作者',
  `link` varchar(250) default NULL COMMENT '文章链接',
  `thumb` text COMMENT '文章图片',
  `create_time` int(11) default NULL COMMENT '创建时间',
  `status` int(11) NOT NULL COMMENT '是否导入',
  PRIMARY KEY  (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_comment`
--

CREATE TABLE IF NOT EXISTS `fangfa_comment` (
  `id` smallint(5) NOT NULL auto_increment,
  `catid` smallint(5) NOT NULL COMMENT '栏目ID',
  `newsid` smallint(5) NOT NULL,
  `comment` text NOT NULL,
  `userid` int(10) unsigned default '0',
  `username` char(20) default NULL,
  `status` tinyint(1) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `create_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `hidden` (`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content`
--

CREATE TABLE IF NOT EXISTS `fangfa_content` (
  `cid` mediumint(8) unsigned NOT NULL auto_increment COMMENT '主键',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目ID',
  `title` char(80) NOT NULL default '' COMMENT '标题',
  `style` varchar(50) default NULL COMMENT '样式',
  `thumb` char(100) default NULL COMMENT '缩略图',
  `brcode` varchar(255) default NULL COMMENT '二维码',
  `attr` set('top','scroll','hot') default NULL COMMENT '文档属性',
  `description` varchar(250) default NULL COMMENT '栏目摘要',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态：0=待审,9=终审,-1=回收站',
  `sort` tinyint(4) unsigned default '1' COMMENT '排序',
  `url` char(100) default NULL COMMENT '链接',
  `template` varchar(50) default NULL COMMENT '模板名称',
  `seokeywords` char(200) default NULL COMMENT '关键字',
  `seodescription` char(255) default NULL COMMENT '描述',
  `seotitle` varchar(100) default NULL COMMENT 'SEO标题',
  `user_id` int(10) unsigned default '0' COMMENT '用户ID',
  `username` varchar(50) default NULL COMMENT '用户名',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '建立时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  PRIMARY KEY  (`cid`),
  KEY `status` (`status`,`sort`,`cid`),
  KEY `listorder` (`catid`,`status`,`sort`,`cid`),
  KEY `catid` (`catid`,`status`,`cid`),
  KEY `updatetime` (`catid`,`status`,`update_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='内容模型主表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `fangfa_content`
--

INSERT INTO `fangfa_content` (`cid`, `catid`, `title`, `style`, `thumb`, `brcode`, `attr`, `description`, `status`, `sort`, `url`, `template`, `seokeywords`, `seodescription`, `seotitle`, `user_id`, `username`, `create_time`, `update_time`) VALUES
(1, 8, '“北新国际机械城”项目二期工程奠基', NULL, 'images/2015/03/20150325211931110.png', NULL, 'top,hot', '10月15日，四川省重点项目、四川省重大产业项目———“北新国际机械城”项目二期工程奠基仪式在广汉北新国际机械城项目建设工地隆重举行，此举标志着成德绵首个大型机械设备商贸平台再迈新台阶。据悉，“北新国际机械城”项目', 9, 1, '201503/1.html', NULL, '“北新国际机械城”项目二期工程奠基', '“北新国际机械城”项目二期工程奠基', '“北新国际机械城”项目二期工程奠基 - {stitle}', 1, 'admin', 1427040000, 1427040000),
(2, 8, '地标楼盘影响城市未来', NULL, 'images/2015/03/20150325211507197.png', NULL, 'top', '成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域', 9, 2, '201503/2.html', NULL, '地标楼盘影响城市未来', '成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域', '地标楼盘影响城市未来 - {stitle}', 999999, 'developer', 1427040000, 1427040000),
(3, 9, '热烈庆祝“北新•天府大市场”一期商铺盛世开盘', NULL, 'images/2015/03/20150323165744155.jpg', NULL, '', '2014年10月25日，凝聚着北新集团全体成员不懈努力和辛勤汗水打造的“北新·天府大市场”，在位于四川省广汉市北京大道的“北新·天府大市场”营销中心举行了盛大的开盘庆典。', 9, 1, '201503/3.html', NULL, 'dsadfs', 'dsafsa', 'dsadfs - {stitle}', 999999, 'developer', 1427040000, 1427040000),
(4, 9, '打造学习型企业', NULL, 'images/2015/03/20150325214307194.png', NULL, '', '2015年3月21日上午，北新大弘集团公司中层管理人员培训在成都总部办公区拉开序幕', 9, 2, '201503/4.html', NULL, 'wwwwwwwwwww', '23538568535652321111111111111111111111111111111444444444444\r\n852852852054132654865455555555555555555555555555555555555555555555555', 'wwwwwwwwwww - {stitle}', 999999, 'developer', 1427040000, 1427040000),
(5, 13, '北新国际机械城', NULL, 'images/2015/03/20150325212612104.png', NULL, '', '成产地市场、销地市场、消费市场首个大型商贸物流平台', 9, 3, '201503/5.html', NULL, '你好', '发送给 发发发生阿飞啊啊发发阿发发发阿发阿发阿发啊发发阿发阿发按时发发发发发发阿的发发阿发啊发发发发发发发法规的郭德纲啊个大概大概的噶刚到', '你好 - {stitle}', 1, 'admin', 1427040000, 1427040000),
(10, 15, '天府大市场', NULL, 'images/2015/03/20150325213151122.png', NULL, '', '自成都市启动中调、北改战略规划以来，成都北部成为全国投资商投资的聚焦点。其中商品流通专业市场的集群发展更是造就了无数的财富神话。', 9, 1, '201503/10.html', NULL, '天府大市场', '自成都市启动中调、北改战略规划以来，成都北部成为全国投资商投资的聚焦点。其中商品流通专业市场的集群发展更是造就了无数的财富神话。', '天府大市场 - {stitle}', 1, 'admin', 1427212800, 1427212800),
(6, 13, '北新国际机械城', NULL, 'images/2015/03/20150325214202108.png', NULL, '', '成产地市场、销地市场、消费市场首个大型商贸物流平台', 9, 2, '201503/6.html', NULL, '你好好', '发发', '你好好 - {stitle}', 1, 'admin', 1427040000, 1427040000),
(7, 19, '北新国际机械城项目（一期）幕墙工程施工比选公告', NULL, 'images/2015/03/20150323180440102.jpg', NULL, '', '北新国际机械城是四川省2013年重大产业项目，广汉市2013年度重点服务业项目，广汉市2013年重点招商引资项目。项目业主为 四川北新大弘置业有限公司 ，招标人为四川北新大弘置业有限公司 ', 9, 2, '201503/7.html', NULL, 'dsafsa', 'fasfas', 'dsafsa - {stitle}', 1, 'admin', 1427040000, 1427040000),
(8, 19, '北新国际机械城项目（一期）综合楼暖通工程', NULL, 'images/2015/03/20150323180722158.jpg', NULL, '', '北新国际机械城项目（一期）综合楼暖通工程,设计、施工专业承包工程比选公告', 9, 1, '201503/8.html', NULL, 'sdassgva', 'fsaghagadgbjkldaha;hijsfpdjhkf;lhks,;glakdgmadg,a', 'sdassgva - {stitle}', 1, 'admin', 1427040000, 1427040000),
(9, 11, '北新国际机械城小“钢”铺成投资新宠', NULL, 'images/2015/03/20150325215002133.png', NULL, 'hot', '随着市区专业市场搬迁进度的加快，据不完全统计，目前成都新兴的专业市场近40个，规模达到4000余亩，包括了家居、建材、汽车汽配、钢材、百货、五金等行业', 9, 1, '201503/9.html', NULL, 'eftqqe', 'fafga', 'eftqqe - {stitle}', 999999, 'developer', 1427126400, 1427126400),
(11, 15, '临港大市场', NULL, 'images/2015/03/20150325213253183.png', NULL, NULL, '位于四川省广安市金安大道北段56号爱众大厦六楼，注册资金2000万元，专业从事市场综合体开发和运营管理。', 9, 1, '201503/11.html', NULL, '临港大市场', '位于四川省广安市金安大道北段56号爱众大厦六楼，注册资金2000万元，专业从事市场综合体开发和运营管理。', '临港大市场 - {stitle}', 1, 'admin', 1427290498, 1427290498),
(12, 15, '青神风岩景区', NULL, 'images/2015/03/20150325213551139.png', NULL, NULL, '中岩景区位于青神县城城东11公里的黄金旅游线上，隔岷江与思蒙河口相对。主景区为上、中、下(岩)，面积26平方公里，游程10华里，顶峰海拔高度为616米。', 9, 1, '201503/12.html', NULL, '青神风岩景区', '中岩景区位于青神县城城东11公里的黄金旅游线上，隔岷江与思蒙河口相对。主景区为上、中、下(岩)，面积26平方公里，游程10华里，顶峰海拔高度为616米。', '青神风岩景区 - {stitle}', 1, 'admin', 1427290664, 1427290664),
(13, 13, '北新国际机械城', NULL, 'images/2015/03/20150325214136158.png', NULL, '', '综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台。', 9, 1, '201503/13.html', NULL, '北新国际机械城', '，综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台。', '北新国际机械城 - {stitle}', 1, 'admin', 1427212800, 1427212800),
(14, 10, '刘邦成总经理带队参加“第六届中国冷链物流行业年会', NULL, '', NULL, '', '2013年12月18日至22日，由刘邦成总经理带队一行六人赴北京参加相关行业组织的大会与考察', 9, 2, '201503/14.html', NULL, '刘邦成总经理带队参加“第六届中国冷链物流行业年会', '2013年12月18日至22日，由刘邦成总经理带队一行六人赴北京参加相关行业组织的大会与考察', '刘邦成总经理带队参加“第六届中国冷链物流行业年会 - {stitle}', 999999, 'developer', 1427212800, 1427212800),
(15, 10, '我公司应邀参加“中国经贸发展高峰会暨探索中小企业投资合作之路会议”', NULL, '', NULL, '', '12月19日-12月21日，根据刘邦成总经理的指示与安排，行政人事部陈胜代表公司参加了在北京举行的“中国经贸发展高峰会暨探索中小企业投资合作之路会议”', 9, 1, '201503/15.html', NULL, '我公司应邀参加“中国经贸发展高峰会暨探索中小企业投资合作之路会议”', '12月19日-12月21日，根据刘邦成总经理的指示与安排，行政人事部陈胜代表公司参加了在北京举行的“中国经贸发展高峰会暨探索中小企业投资合作之路会议”', '我公司应邀参加“中国经贸发展高峰会暨探索中小企业投资合作之路会议” - {stitle}', 999999, 'developer', 1427212800, 1427212800),
(16, 11, '北新国际机械城 ，西南重工标杆', NULL, 'images/2015/03/20150325215205159.png', NULL, '', '成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域', 9, 2, '201503/16.html', NULL, '北新国际机械城 ，西南重工标杆', '成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域', '北新国际机械城 ，西南重工标杆 - {stitle}', 999999, 'developer', 1427212800, 1427212800),
(17, 8, '四川北新达亿投资有限公司企业简介', NULL, 'images/2015/03/20150326092146195.png', NULL, 'top', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', 9, 3, '201503/17.html', NULL, '四川北新达亿投资有限公司企业简介', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', '四川北新达亿投资有限公司企业简介 - {stitle}', 999999, 'developer', 1427299200, 1427299200),
(18, 8, '物流行业领域的需求为基础', NULL, 'images/2015/03/20150326092155159.png', NULL, 'top', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', 9, 4, '201503/18.html', NULL, '物流行业领域的需求为基础', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', '物流行业领域的需求为基础 - {stitle}', 999999, 'developer', 1427299200, 1427299200),
(19, 8, '国内物流行业瞩目和好评', NULL, 'images/2015/03/20150326092204154.png', NULL, 'top', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', 9, 5, '201503/19.html', NULL, '国内物流行业瞩目和好评', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', '国内物流行业瞩目和好评 - {stitle}', 999999, 'developer', 1427299200, 1427299200),
(20, 8, '1', NULL, '', NULL, NULL, '', -1, 1, '201503/20.html', NULL, '1', '', '1 - {stitle}', 999999, 'developer', 1427332989, 1427332989),
(21, 13, '天府大市场商贸城', NULL, 'images/2015/03/20150326092855163.png', NULL, '', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', 9, 1, '201503/21.html', NULL, '天府大市场商贸城', '四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大...', '天府大市场商贸城 - {stitle}', 999999, 'developer', 1427299200, 1427299200),
(22, 13, '天府大市场商贸城', NULL, 'images/2015/03/20150326093216108.png', NULL, NULL, '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', 9, 1, '201503/22.html', NULL, '天府大市场商贸城', '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', '天府大市场商贸城 - {stitle}', 999999, 'developer', 1427333602, 1427333602),
(23, 13, '天府大市场商贸城', NULL, 'images/2015/03/20150326093341116.png', NULL, NULL, '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', 9, 1, '201503/23.html', NULL, '天府大市场商贸城', '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', '天府大市场商贸城 - {stitle}', 999999, 'developer', 1427333645, 1427333645),
(24, 13, '天府大市场商贸城', NULL, 'images/2015/03/20150326093422190.png', NULL, '', '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', 9, 1, '201503/24.html', NULL, '天府大市场商贸城', '及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。公司始终坚持“合作、分享、共赢”的企业...', '天府大市场商贸城 - {stitle}', 1, 'admin', 1427299200, 1427299200),
(25, 8, '1', NULL, '', NULL, NULL, '', -1, 1, '201503/25.html', NULL, '1', '', '1 - {stitle}', 999999, 'developer', 1427340134, 1427340134),
(26, 13, 'aa', NULL, '', NULL, NULL, 'aa', -1, 1, '201504/26.html', NULL, 'aa', 'aa', 'aa - {stitle}', 999999, 'developer', 1429079575, 1429079575),
(27, 8, '1', NULL, '', NULL, NULL, '', -1, 1, '201504/27.html', NULL, '1', '', '1 - {stitle}', 999999, 'developer', 1429256207, 1429256207);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_article`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_article` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `resource` varchar(255) default '本地' COMMENT '文章来源',
  `classify_select` smallint(5) default '0' COMMENT '分类管理',
  `weibo` tinyint(3) default '1' COMMENT '同步到微博',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章发布模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_cnews`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_cnews` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `source` varchar(255) NOT NULL default '' COMMENT '来源',
  `wangzhi` varchar(255) NOT NULL default '' COMMENT '网址',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型扩展表之一';

--
-- 转存表中的数据 `fangfa_content_cnews`
--

INSERT INTO `fangfa_content_cnews` (`cid`, `fulltitle`, `content`, `source`, `wangzhi`) VALUES
(1, NULL, '<p style="text-align:center"><img src="/public/uploads/ueditor/images/20150325/1427289581357318.png" title="1427289581357318.png" alt="新闻2.png"/></p><p>10月15日，四川省重点项目、四川省重大产业项目———“北新国际机械城”项目二期工程奠基仪式在广汉北新国际机械城项目建设工地隆重举行，此举标志着成德绵首个大型机械设备商贸平台再迈新台阶。</p><p>据悉，“北新国际机械城”项目位于成绵高速广汉北出口处，总占地面积460亩，总建筑面积55万平方米，总投资10.3亿元。项目紧邻108大件路和北京大道，是承接天府新区、连接成德绵经济带、融入成渝经济区的重要节点和交通走廊。</p><p>“北新国际机械城”是四川省重点项目、四川省重大产业项目、广汉市重点服务业项目、广汉市重点招商引资项目，是成德绵工业制造业的商贸物流重点工程，将打造成为中国西部最具代表性的石油、重工、电气、机电机械设备商贸基地。</p><p><br/></p>', '四川北新达亿投资有限公司', 'http://bxdytz.com/'),
(2, NULL, '<p style="margin: 24px 0px 0px; padding: 0px; text-align: center; font-size: 14px; font-family: Calibri, sans-serif; color: rgb(51, 51, 51); white-space: normal; line-height: 2; background-color: rgb(255, 255, 255);"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp; &nbsp;<img src="/public/uploads/ueditor/images/20150325/1427289423494546.png" title="1427289423494546.png" alt="新闻1.png"/></span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域。从“关乎国家经济命脉”的重工产业，到与世界对接的电子信息产业；从传统优势产业，到新兴战略性产业；从技术密集、劳动力密集的制造产业，到高新技术产业无所不包，成德绵产业带已然形成一个国家级重工产业基地。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="color: rgb(0, 0, 0); font-family: 宋体; line-height: 2;">成德绵三地拥有全球领先的研发技术，拥有世界一流的质量标准，但产品价值却无法得到有效显现，无法真正做到“卖全球”。成德绵经济带上产业聚集度高，但是发展后劲不足，归根结底还是在于商贸流通不畅所致。目前成德绵制造业相关商贸物流平台，仍处于零散为市、点状分布的初级发展阶段，该区域缺乏统一管理、科学运营、能够全面整合上下游产业链的机械专业物流大平台，这正是</span><span style="color: rgb(0, 0, 0); font-family: 宋体; line-height: 2;">制约当地装备制造产业进一步发展的重要因素。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">作为四川省重点项目、四川省重大产业项目，北新国际机械城响应省政府号召，扼守成德绵产业经济发展高峰带上的核心、成德同城化发展战略桥头堡——广汉，全面整合成德绵乃至西部机械产业上下游产业链，为成德绵装备制造产业打破发展瓶颈，形成产地市场、销地市场、消费市场首个大型商贸物流平台，形成新的经济增长极，有力推动“四川首席经济带”成德绵产业带再上新台阶。</span></p><p><br/></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(3, NULL, '<p style="margin-top: 24px;margin-bottom: 0px;padding: 0px;color: rgb(51, 51, 51);font-family: Verdana, Geneva, sans-serif, 宋体;font-size: 13px;white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp;2014年10月25日，凝聚着北新集团全体成员不懈努力和辛勤汗水打造的“北新·天府大市场”，在位于四川省广汉市北京大道的“北新·天府大市场”营销中心举行了盛大的开盘庆典。</span></p><p style="margin-top: 24px;margin-bottom: 0px;padding: 0px;color: rgb(51, 51, 51);font-family: Verdana, Geneva, sans-serif, 宋体;font-size: 13px;white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体;font-size: 19px"><span style="font-size: 19px">&nbsp;&nbsp;</span><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp; 25日上午11时左右，庆典活动现场已经车水马龙、人头攒动。随着雷鸣般的掌声响起，四川北新集团董事长兼总经理刘邦成先生走上主舞台，向广大客户作致辞演讲。</span></span></p><p style="margin-top: 24px;margin-bottom: 0px;padding: 0px;color: rgb(51, 51, 51);font-family: Verdana, Geneva, sans-serif, 宋体;font-size: 13px;white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp; 刘邦成总经理表示，“北新·天府大市场”项目从选地、拿地、批建，以及项目正式启动开工到现在即将来临的开盘，其中经历了很多，也付出了很多……今天，大批的朋友们即将成为“北新·天府大市场”的主人，而这个选择无可挑剔！因为北新集团始终坚持与投资者共赢、与商家共赢的理念，且在目前的产业地产市场上，无论是地段、模式，还是规模、质量，“北新·天府大市场”都是真正的NO·1！</span></p><p><span style="font-size: 14px; color: rgb(0, 0, 0);">&nbsp;</span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(4, NULL, '<p><br/></p><p style="text-align: center;"><span style="font-size: 14px; color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);"><img src="/public/uploads/ueditor/images/20150325/1427291083112973.png" title="1427291083112973.png" alt="学习.png"/>&nbsp; &nbsp; &nbsp;</span></span></p><p><span style="font-size: 14px; color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">2015年3月21日上午，北新大弘集团公司中层管理人员培训在成都总部办公区拉开序幕。中旭股份公司的余知航老师受邀到我公司授课。此次培训主题为“管理”。在这次培训中，大家感到受益良多，不仅收获了一些管理知识，而且得到了很多人生启迪。</span><br style="color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 19px; line-height: 37.3333320617676px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">9时许，在一片如潮的掌声中，北新大弘集团公司总裁刘邦成应邀作动员讲话。刘总激情洋溢、大家风范的讲话感染了现场所有同仁，激发了他们的学习热情，也唤起了他们提升自我的意识。现场沉闷的气氛顿时一扫而空。</span><br style="color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 19px; line-height: 37.3333320617676px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随后，余老师围绕“结果管理”，从“管控结果的四要素”“做出结果的三种思维”等方面娓娓道来。深入浅</span></span><span style="color: rgb(0, 0, 0); font-size: 14px;"><span style="color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">出的讲解使在座同仁领悟了“管理改变的是制度而不是人性” 、“勿用人性对冲制度” 、“没有坏人，只有坏制度”、“站在支付报酬者的角度考虑结果” 、“优秀员工是廉价的，而平庸员工却是昂贵的”、“人人都可做到低标准，人人必须做到严要求” 、“以结果为中心，以需求为中心” 、“结果提前，自我退后”等意味深长的道理。其间余老师还分享了一些深刻而又生动的案例，并进行了现场良性互动。北新同仁一边若有所思地聆听着，一边认真地记录发人深省的语句，沉浸在余老师那抑扬顿挫的讲解中......</span><br style="color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 19px; line-height: 37.3333320617676px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="color: rgb(0, 0, 0); font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style="color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">&nbsp; 为</span><span style="color: rgb(0, 0, 0); font-size: 14px;"><span style="font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">期半天的培训不知不觉地结束了，北新同仁们意犹未尽地走出了会议室。“对‘管理’有了更多理性认识......”“听君一节课，胜读十年书！”他们言语间</span><span style="font-family: Verdana, Geneva, sans-serif, 宋体; line-height: 37.3333320617676px; background-color: rgb(255, 255, 255);">透出兴奋。此次极具针对性的专题培训使北新同仁乐在其中，学在其中，悟在其中。</span></span></span></p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(7, NULL, '<p><br/></p><p>&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">一、本次比选项目：<br/>北新国际机械城是四川省2013年重大产业项目，广汉市2013年度重点服务业项目，广汉市2013年重点招商引资项目。项目业主为 四川北新大弘置业有限公司 ，招标人为四川北新大弘置业有限公司 。因工程建设需求，我公司拟对“北新国际机械城项目（一期）”幕墙工程设计、施工进行公开比选。<br/>1、工程概况及比选范围：<br/>①、建设地点：项目位于成都第二绕城高速以北，北新开发区成绵高速广汉北出口处，紧邻108大件路和北京大道。<br/>②、工程规模：建筑面积约77873.32平方米。<br/>③、计划工期： 60日历天，并应满足总承包商的总工期进度及区域进度要求。<br/>④、北新国际机械城项目（一期）幕墙工程范围：外墙石材幕墙、玻璃幕墙工程，详见招标文件。<br/>⑤、标段划分：共划分1标段。<br/>2、比选单位资格要求：<br/>①、比选申请人具有独立企业法人资格；<br/>②、幕墙专业设计乙级或以上资质，幕墙施工专业承包贰级或以上资质；<br/>③、负责该项目的项目经理必须持有贰级建造师（含以上）资格证，并具有类似工程业绩；<br/>④、有效的安全生产许可证；<br/>⑤、具备良好的信誉及财务状况。<br/>二、报名方法及时间<br/>1、本次比选项目报名时间：公告之日起至2013年4月3日<br/>2、报名时请提供以下资料：营业执照复印件、资质证书、组织机构代码证、安全生产许可证、单位介绍信、法定代表人授权书原件及被授权人身份证复印件。<br/>地址：成都市人民南路四段19号威斯顿联邦大厦2108室<br/>联系部门：成本控制部<br/>联系人: 陈部长<br/>联系电话：028-8528684</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">注：本公告同时在《四川建设网》发布</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;四川北新大弘置业有限公司<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;2013年3月28日</p><p><br/></p>', '', ''),
(8, NULL, '<p style="text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">北新国际机械城项目（一期）综合楼暖通工程<br/>设计、施工专业承包工程比选公告</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">一、本次比选项目：<br/>北新国际机械城是四川省2013年重大产业项目，广汉市2013年度重点服务业项目，广汉市2013年重点招商引资项目。项目业主为 四川北新大弘置业有限公司 ，招标人为 四川北新大弘置业有限公司 。因工程建设需求，我公司拟对“北新国际机械城项目（一期）”综合楼暖通工程设计、施工专业承包工程进行公开比选。<br/>1、工程概况及比选范围：<br/>①、建设地点：成都第二绕城高速以北，北新开发区成绵高速广汉北出口处，紧邻108大件路和北京大道。<br/>②、工程规模：建筑面积约4267.2平方米。<br/>③、计划工期： 45日历天，并应满足总承包商的总工期进度及区域进度要求。<br/>④、北新国际机械城项目（一期）综合楼暖通工程招标范围：中央空调安装工程设计与施工，详见邀标文件。<br/>⑤、标段划分：共划分1标段。<br/>2、比选单位资格要求：<br/>①、比选申请人具有独立企业法人资格；<br/>②、机电安装工程专业承包壹级资质；<br/>③、机电安装工程设计乙级资质；<br/>④、负责该项目的项目经理必须持有壹级建造师资格证，并具有类似工程业绩；<br/>⑤、有效的安全生产许可证；<br/>⑥、具备良好的信誉及财务状况；<br/>⑦、在建或已完类似业绩2个；<br/>⑧、支持设计、施工联合体投标。<br/>二、报名方法及时间<br/>1、本次比选项目报名时间：公告之日起至2013年7月5日（除国家法定节假日外）<br/>2、本次开标时间：2013年7月16日<br/>3、资格预审时请提供以下资料：营业执照复印件、资质证书、组织机械代码证、安全生产许可证、单位介绍信、法安代表人授权书原件及被授权人身份证复印件。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">地址：成都市人民南路四段19号威斯顿联邦大厦2108室<br/>联系部门：成本控制部<br/>联系电话：028-85268684</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);">注：本公告在《四川建设网》发布</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif, 宋体; font-size: 13px; line-height: 23.3999996185303px; white-space: normal; background-color: rgb(255, 255, 255);"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四川北新大弘置业有限公司<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2013年7月1日</p><p>&nbsp;<br/></p><p>&nbsp;</p>', '', ''),
(9, NULL, '<p><br/></p><p>&nbsp;</p><p>&nbsp;</p><p style=";padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体;font-size: 19px">&nbsp; &nbsp;</span><span style="color: rgb(0, 0, 0); font-size: 14px;"><span style="color: rgb(0, 0, 0); font-family: 宋体;">过去成都专业市场的布局让人感到头疼，原有的专业市场位置太靠近市中心，交通的不便和规模的有限严重制约了其发展。随着市区专业市场搬迁进度的加快，据不完全统计，目前成都新兴的专业市场近</span><span style="color: rgb(0, 0, 0);">40</span><span style="color: rgb(0, 0, 0); font-family: 宋体;">个，规模达到</span><span style="color: rgb(0, 0, 0);">4000</span><span style="color: rgb(0, 0, 0); font-family: 宋体;">余亩，包括了家居、建材、汽车汽配、钢材、百货、五金等行业。未来几年，成都市场升级外迁将带来巨大财富机遇，这意味着，未来几年上百个市场，数千亿财富的流向将会产生大挪移。显然，无论是对于商家、投资客，抑或是整个城市而言，专业市场的外迁都将起到非凡的影响力。</span></span></p><p style=";padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="color: rgb(0, 0, 0); font-size: 14px;">&nbsp;</span></p><p style=";padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体;font-size: 19px">&nbsp;&nbsp;&nbsp;</span><span style="font-size: 14px; color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: 宋体;"> 广汉，位于成都北沿线，已经成为近郊商业的重要一极。成德绵产业同城化启动后，广汉当仁不让成为了首轮“红利”的享有者。作为成都“半小时经济圈”成员，广汉成为重工产业转移最好的承接地、投资创业最佳目的地。截止目前，广汉承接产业转移的招商引资工作已突破</span>400<span style="font-size: 14px; font-family: 宋体;">亿。</span></span></p><p style=";padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-size: 14px; color: rgb(0, 0, 0);">&nbsp;</span></p><p style=";padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp; 北新国际机械城地处广汉门户位置，是中国示范性商贸物流集群，也是成德绵产业带上的标杆项目，北新国际机械城建成后，将完善成德绵经济带产业链条，形成产业竞争综合实力，成为国家级战略产业基地示范区。</span></p><p><br/></p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(14, NULL, '<p>&nbsp;</p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;text-indent: 37px;background-color: rgb(255, 255, 255)"><span style="font-size: 14px; font-family: 宋体; color: rgb(0, 0, 0);">2013年12月18日至22日，由刘邦成总经理带队一行六人赴北京参加相关行业组织的大会与考察。在刘邦成总经理的指示与安排下，公司总工吴小奇、成控部副经理陈红梅、总经理秘书王松三人参加了由中国冷链物流联盟主办的“第六届中国冷链物流行业年会”。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;text-indent: 37px;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">年会以“跨界冷链与冷链跨越”为主题，回顾冷链物流产业发展历程，总结发展经验，盘点发展问题，展望发展趋势，全面研究分析</span><span style="font-size: 14px; color: rgb(0, 0, 0); font-family: 宋体;">了跨界冷链带来的模式创新、市场冲击、竞争能力及整合能力的变局和冷链企业如何跨越单纯的冷链储运业务等新命题，提出向综合性、多元化冷链物流企业方向发展的预测。</span></p><p><br/></p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(15, NULL, '<p>&nbsp;</p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;text-indent: 37px;background-color: rgb(255, 255, 255)"><span style="font-size: 14px; font-family: 宋体; color: rgb(0, 0, 0);">12月19日-12月21日，根据刘邦成总经理的指示与安排，行政人事部陈胜代表公司参加了在北京举行的“中国经贸发展高峰会暨探索中小企业投资合作之路会议”。此次会议由中国经济贸易促进会主办，四川鹏华企业集团、三地农民合作社协办，北京中贸蕊雨文化发展有限公司及北京中贸宏扬企业管理中心共同承办。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;text-indent: 37px;background-color: rgb(255, 255, 255)"><span style="font-size: 14px; color: rgb(0, 0, 0); font-family: 宋体;">本次会议的学术报告主要分为“金融投资、探索非洲·西亚投资之路、探索东南亚投资之路及探索农业发展与投资之路”等方面。报告对中国当前经济和政策发展状况进行了研究探讨；对中小企业对外投资进行了分析说明。“走出去”成为众多中小企业实现企业转型和产业升级的机会。“中国经贸发展高峰会暨探索中小企业投资合作之路会议”的举办，对我公司的发展有积极的借鉴作用。</span></p><p><br/></p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(16, NULL, '<p>&nbsp;</p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp; &nbsp;成德绵重工产业带是四川乃至整个西部地区产业实力最强、产业水平最高、产业集聚规模最大的区域。从“关乎国家经济命脉”的重工产业，到与世界对接的电子信息产业；从传统优势产业，到新兴战略性产业；从技术密集、劳动力密集的制造产业，到高新技术产业无所不包，成德绵产业带已然形成一个国家级重工产业基地。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp; 成德绵三地拥有全球领先的研发技术，拥有世界一流的质量标准，但产品价值却无法得到有效显现，无法真正做到“卖全球”。成德绵经济带上产业聚集度高，但是发展后劲不足，归根结底还是在于商贸流通不畅所致。目前成德绵制造业相关商贸物流平台，仍处于零散为市、点状分布的初级发展阶段，该区域缺乏统一管理、科学运营、能够全面整合上下游产业链的机械专业物流大平台，这正是制约当地装备制造产业进一步发展的重要因素。</span></p><p style="margin: 24px 0 0;padding: 0px;text-align: justify;font-size: 14px;font-family: Calibri, sans-serif;color: rgb(51, 51, 51);white-space: normal;line-height: 2;background-color: rgb(255, 255, 255)"><span style="font-family: 宋体;font-size: 19px">&nbsp;&nbsp;&nbsp; <span style="font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);">作为四川省重点项目、四川省重大产业项目，北新国际机械城响应省政府号召，扼守成德绵产业经济发展高峰带上的核心、成德同城化发展战略桥头堡——广汉，全面整合成德绵乃至西部机械产业上下游产业链，为成德绵装备制造产业打破发展瓶颈，形成产地市场、销地市场、消费市场首个大型商贸物流平台，形成新的经济增长极，有力推动“四川首席经济带”成德绵产业带再上新台阶。</span></span></p><p><br/></p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(17, NULL, '<p>四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p><br/></p><p>公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展” 的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(18, NULL, '<p>四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p>公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p>&nbsp;<br/></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(19, NULL, '<p style="white-space: normal;">四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p>&nbsp;<br/></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '本站', 'http://bxdytz.com/'),
(20, NULL, '', '', ''),
(25, NULL, '', '', ''),
(27, NULL, '', '本站', 'http://bxdytz.com/');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_count`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_count` (
  `cid` mediumint(8) unsigned NOT NULL COMMENT '主表ID',
  `hits` mediumint(8) unsigned NOT NULL default '0' COMMENT '浏览量',
  `comments` smallint(5) unsigned NOT NULL default '0' COMMENT '评论数',
  `comments_checked` smallint(5) unsigned NOT NULL default '0' COMMENT '已回复评论数',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型统计表';

--
-- 转存表中的数据 `fangfa_content_count`
--

INSERT INTO `fangfa_content_count` (`cid`, `hits`, `comments`, `comments_checked`) VALUES
(1, 0, 0, 0),
(2, 0, 0, 0),
(3, 0, 0, 0),
(4, 0, 0, 0),
(5, 0, 0, 0),
(6, 0, 0, 0),
(7, 0, 0, 0),
(8, 0, 0, 0),
(9, 0, 0, 0),
(10, 0, 0, 0),
(11, 0, 0, 0),
(12, 0, 0, 0),
(13, 0, 0, 0),
(14, 0, 0, 0),
(15, 0, 0, 0),
(16, 0, 0, 0),
(17, 0, 0, 0),
(18, 0, 0, 0),
(19, 0, 0, 0),
(20, 0, 0, 0),
(21, 0, 0, 0),
(22, 0, 0, 0),
(23, 0, 0, 0),
(24, 0, 0, 0),
(25, 0, 0, 0),
(26, 0, 0, 0),
(27, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_download`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_download` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `downfile` varchar(250) default NULL COMMENT '文件下载',
  `type` char(10) default 'pdf' COMMENT '文件类型',
  `filesize` varchar(255) default '未知' COMMENT '文件大小',
  `version` varchar(255) default NULL COMMENT '版本号',
  `language` varchar(10) default '简体中文' COMMENT '软件语言',
  `systems` varchar(255) default 'Win2000/WinXP/Win2003' COMMENT '软件平台',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件下载模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_magazine`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_magazine` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `resource` varchar(255) default '本地' COMMENT '文章来源',
  `classify_select` smallint(5) default '0' COMMENT '分类管理',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报刊模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_picture`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_picture` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `big_pic` char(100) default NULL COMMENT '显示图片',
  `images` text COMMENT '组图',
  `weibo` tinyint(3) default '1' COMMENT '同步到微博',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片欣赏模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_product`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_product` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `big_pic` char(100) default NULL COMMENT '显示图片',
  `images` text COMMENT '产品组图',
  `size` varchar(255) default NULL COMMENT '产品型号',
  `unit` char(10) default '个' COMMENT '产品单位',
  `market_price` varchar(255) default NULL COMMENT '市场价格',
  `price` varchar(255) default NULL COMMENT '优惠价',
  `weibo` tinyint(3) default '1' COMMENT '同步到微博',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品展示模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_promodel`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_promodel` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `start_Time` int(10) default NULL COMMENT '开工时间',
  `pretty_Time` int(10) default NULL COMMENT '竣工时间',
  `structure` int(11) NOT NULL,
  `cost` varchar(255) NOT NULL default '' COMMENT '工程估价',
  `cate` varchar(255) NOT NULL default '' COMMENT '建筑类别',
  `phase` varchar(255) NOT NULL default '' COMMENT '项目阶段',
  `paddress` varchar(255) NOT NULL default '' COMMENT '项目地址',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型扩展表之一';

--
-- 转存表中的数据 `fangfa_content_promodel`
--

INSERT INTO `fangfa_content_promodel` (`cid`, `fulltitle`, `content`, `start_Time`, `pretty_Time`, `structure`, `cost`, `cate`, `phase`, `paddress`) VALUES
(5, NULL, '<p><span style="font-family: arial, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);">北新国际机械城作为中国汽摩机械、重工机械、电气机械、机电机械、石油机械商贸基地，综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台</span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', 1427126400, 1426003200, 1234, '1234万', '商业地产', '已完成', '成都第二绕城高速以北的广汉市'),
(6, NULL, '<p><span style="font-family: arial, sans-serif; font-size: 14px; line-height: 28px; background-color: rgb(255, 255, 255);">北新国际机械城作为中国汽摩机械、重工机械、电气机械、机电机械、石油机械商贸基地，综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台</span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', 1426003200, 1426176000, 1345, '1254', '飞洒发', '法司法', '发'),
(10, NULL, '<p>&nbsp;<span style="color: rgb(51, 51, 51); font-family: Arial, 宋体, SimSun, HELVETICA, &#39;Hiragino Sans GB&#39;; font-size: 14px; line-height: 26px; text-indent: 28px; background-color: rgb(255, 255, 255);">自成都市启动中调、北改战略规划以来，成都北部成为全国投资商投资的聚焦点。其中商品流通专业市场的集群发展更是造就了无数的财富神话。2014年5月26日，四川省重点项目领导小组办公室颁发川重办【2014】14号文件，确定北新天府大市场为四川省重点项目，再掀成都北部专业市场投资热潮。市场还未开盘，就已接受上万商家咨询，售楼现产更是人满为患。这个集生产、销售、冷藏配送于一体的西部农产品批发航母是怎样来吸引投资者目光的呢？带着疑问，我们一起去了解这个位于成都北门的新兴市场。</span></p><p>&nbsp;</p>', 1394380800, 1427212800, 2000, '40000', '商业地产', '再建项目', '成都北大门'),
(11, NULL, '<p>&nbsp;</p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; line-height: 26px; font-size: 14px; color: rgb(51, 51, 51); font-family: 微软雅黑; white-space: normal; text-indent: 30pt; background-color: rgb(255, 255, 255);"><span style="font-family: 仿宋_GB2312; text-indent: 30pt; line-height: 1.5;">公司秉承“独树一帜、越位创新”的企业理念和“服务永无止境、责任成就价值”的经营信条。</span></p><p style="margin-top: 0px; margin-bottom: 10px; padding: 0px; line-height: 26px; font-size: 14px; color: rgb(51, 51, 51); font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 仿宋_GB2312;">&nbsp; &nbsp; &nbsp;&nbsp;</span><span style="font-size: 15pt; font-family: 仿宋_GB2312;"><span style="font-size: 14px;">公司目前设置九部二室，即行政人事部、开发部、招商营销部、成本控制部、财务部、工程技术部、统计部、预算部、预决算审计部、法律办公室、采购招标办公室。</span></span></p><p style="margin-top: 0px; margin-bottom: 10px; margin-left: 0cm; padding: 0px; line-height: 26px; font-size: 14px; color: rgb(51, 51, 51); font-family: 微软雅黑; white-space: normal; text-indent: 30pt; background-color: rgb(255, 255, 255);"><span style="font-size: 15pt; line-height: 30px; font-family: 仿宋_GB2312;"><span style="font-size: 14px;">公司目前在四川省广安市枣山物流商贸园区开发建设的“临港大市场”项目，是在成渝两地深化合作、成渝经济圈高速发展的背景下，依托广安各县市农产品生产基地以及“川东门户”这一得天独厚的资源区位优势，以全新的现代物流服务理念，高规格打造的集农产品冷链仓储配送、电子商务平台和期货中心、农产品展示交易、无公害检验检疫等多功能于一体的新型流通业态，是广安唯一一家大型农产品一级批发市场。</span></span></p><p><br/></p>', 1395676800, 1427212800, 2000, '4000', '商业地产', '规划项目', '四川省广安市金安大道北段'),
(12, NULL, '<p>&nbsp;</p><p style="margin-top: 0px; margin-bottom: 12px; padding: 0px; line-height: 28px; font-family: arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">中岩景区位于青神县城城东11公里的黄金旅游线上，隔岷江与思蒙河口相对。主景区为上、中、下(岩)，面积26平方公里，游程10华里，顶峰海拔高度为616米。景区蜿蜒起伏十里许，青峰冥壑、流泉响石、风光绚丽、景色怡人，适于常年旅游，是成都──青神──乐山──峨眉水陆旅游环线上一颗璀璨的明珠。</p><p style="margin-top: 0px; margin-bottom: 12px; padding: 0px; line-height: 28px; font-family: arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">始创于东晋，彰显于唐宋的古中岩，早期为著名佛教圣地，是十六罗汉之第五罗汉“诺巨那尊者”道场。其佛法弘大，与<a target="_blank" href="http://baike.haosou.com/doc/1878902.html" style="color: rgb(19, 110, 194); text-decoration: none;">峨眉山</a>齐名，“岩壑胜景，不减峨山”，故有“先有中岩，后有峨山”之说。在古代盛行水运时，有“先游中岩，后游峨山”之说。</p><p style="margin-top: 0px; margin-bottom: 12px; padding: 0px; line-height: 28px; font-family: arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">景区内主要有临江下寺、东坡唤鱼、平台伏虎、佛洞云穿、长廊千佛、卧佛石窟、仙床凌虚、玉泉流杯、石刻碑林、灵岩石笋、翠微远眺、清溪涧道等景观。景区内有<a target="_blank" href="http://baike.haosou.com/doc/5042135.html" style="color: rgb(19, 110, 194); text-decoration: none;">国家一级保护植物</a>桫椤、银杏等名贵树木和多种珍稀野生动物。使中岩成为融宗教、人文、自然景观为一体，集山、水、林、泉成一色的东坡初恋地。</p><p><br/></p>', 1363708800, 1427212800, 2000, '8000', '旅游地产', '规划建设中', '青神县'),
(13, NULL, '<p>&nbsp;</p><p style="margin-top: 0px; margin-bottom: 12px; padding: 0px; line-height: 28px; font-family: arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">北新国际机械城作为中国汽摩机械、重工机械、电气机械、机电机械、石油机械商贸基地，综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台。</p><p style="margin-top: 0px; margin-bottom: 12px; padding: 0px; line-height: 28px; font-family: arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);">项目位于成都第二绕城高速以北的广汉市，北新开发区成绵高速广汉北出口处，紧邻108大件路和北京大道，项目总占地460逾亩，总建筑面积55万平方米。是承接天府新区、连接成德绵经济带、融入成渝经济区的重要节点和交通走廊。</p><p><br/></p><p>&nbsp;</p><p>&nbsp;</p>', 1362844800, 1421683200, 2000, '8000', '商业地产', '已完成', '成都二绕广汉市'),
(21, NULL, '<p>四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p>公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p>公司重点项目介绍：</p><p>公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p>项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p><br/></p><p style="white-space: normal;">及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p style="white-space: normal;">公司重点项目介绍：</p><p style="white-space: normal;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p style="white-space: normal;">项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p><br/></p><p style="white-space: normal;">及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p style="white-space: normal;">公司重点项目介绍：</p><p style="white-space: normal;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p style="white-space: normal;">项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p>&nbsp;<br/></p>', 1364227200, 1382716800, 1000, '100', '建筑类别', '已完成', '成都市武侯区'),
(22, NULL, '<p style="white-space: normal;">及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p style="white-space: normal;">公司重点项目介绍：</p><p style="white-space: normal;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p style="white-space: normal;">项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p>&nbsp;<br/></p>', 1395072000, 1401206400, 500, '45', '建筑类别', '已完成', '项目地址'),
(23, NULL, '<p style="white-space: normal;">及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p style="white-space: normal;">公司重点项目介绍：</p><p style="white-space: normal;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p style="white-space: normal;">项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p>&nbsp;<br/></p>', 1364227200, 1393862400, 1000, '100', '建筑类别', '已完成', '成都市武侯区'),
(24, NULL, '<p style="white-space: normal;">及管理的物流企业。公司注册资本为人民币2000万元，现有员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。</p><p style="white-space: normal;">公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展”&nbsp;的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p style="white-space: normal;">公司重点项目介绍：</p><p style="white-space: normal;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。</p><p style="white-space: normal;">项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。</p><p><br/></p><br/>', 1393862400, 1427299200, 1000, '100', '建筑类别', '已完成', '成都市武侯区'),
(26, NULL, '<p>&nbsp;aa</p>', NULL, NULL, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_tag`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_tag` (
  `tagid` smallint(5) NOT NULL COMMENT 'tagID',
  `keyid` varchar(20) NOT NULL COMMENT '其他表的ID',
  PRIMARY KEY  (`tagid`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tag与其他内容的中间表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_content_video`
--

CREATE TABLE IF NOT EXISTS `fangfa_content_video` (
  `cid` int(10) unsigned NOT NULL COMMENT '主表ID',
  `fulltitle` varchar(60) default NULL COMMENT '完整标题',
  `content` mediumtext COMMENT '详细内容',
  `video` varchar(250) default NULL COMMENT '视频地址',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频播放模型扩展表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_friendlink`
--

CREATE TABLE IF NOT EXISTS `fangfa_friendlink` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `type_id` mediumint(9) default NULL,
  `type_name` varchar(255) default NULL,
  `style` varchar(50) NOT NULL COMMENT '链接样式',
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `logo` varchar(255) default NULL COMMENT 'logo链接',
  `notes` text COMMENT '链接的提示文字',
  `user_id` int(10) NOT NULL COMMENT '添加者ID',
  `username` varchar(50) default NULL COMMENT '用户名',
  `sort` smallint(5) unsigned NOT NULL default '0' COMMENT '排序',
  `created` int(10) unsigned default NULL COMMENT '添加时间',
  `status` tinyint(1) NOT NULL default '0' COMMENT '1',
  PRIMARY KEY  (`id`),
  KEY `typeid` (`sort`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fangfa_friendlink`
--

INSERT INTO `fangfa_friendlink` (`id`, `type_id`, `type_name`, `style`, `name`, `url`, `logo`, `notes`, `user_id`, `username`, `sort`, `created`, `status`) VALUES
(1, 1, '文字链接', '', '集团公司', 'http://www.fangfacms.com', '', '', 999999, 'developer', 0, 1427185145, 1),
(2, 1, '文字链接', '', '大宏置业', 'http://www.chinazhida.com/', '', '', 999999, 'developer', 0, 1427185176, 1),
(3, 2, '图片链接', '', '集团公司', 'http://www.fangfacms.com', '', '', 999999, 'developer', 0, 1427185668, 1),
(4, 2, '图片链接', '', '百度', 'http://www.baidu.com', '', '', 999999, 'developer', 0, 1427185699, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_friendlink_type`
--

CREATE TABLE IF NOT EXISTS `fangfa_friendlink_type` (
  `type_id` mediumint(9) NOT NULL auto_increment,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fangfa_friendlink_type`
--

INSERT INTO `fangfa_friendlink_type` (`type_id`, `type_name`) VALUES
(1, '文字链接'),
(2, '图片链接');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_guestbook`
--

CREATE TABLE IF NOT EXISTS `fangfa_guestbook` (
  `id` smallint(5) NOT NULL auto_increment,
  `catid` smallint(5) NOT NULL COMMENT '栏目ID',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `reply` text NOT NULL,
  `userid` int(10) unsigned default '0',
  `username` char(20) NOT NULL,
  `email` varchar(100) default NULL,
  `qq` char(15) default NULL,
  `homepage` char(25) default NULL,
  `status` tinyint(1) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `replyer` char(20) NOT NULL,
  `replytime` int(10) unsigned NOT NULL default '0',
  `sheng` varchar(32) default NULL,
  `shi` varchar(32) default NULL,
  `address` varchar(255) default NULL,
  `telphone` int(11) default NULL,
  `tag` int(1) unsigned default '0' COMMENT '0:合作;1:投诉;2:建议',
  PRIMARY KEY  (`id`),
  KEY `hidden` (`status`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言板' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fangfa_guestbook`
--

INSERT INTO `fangfa_guestbook` (`id`, `catid`, `title`, `content`, `reply`, `userid`, `username`, `email`, `qq`, `homepage`, `status`, `ip`, `addtime`, `replyer`, `replytime`, `sheng`, `shi`, `address`, `telphone`, `tag`) VALUES
(1, 20, '121', '213123', '', 0, 'dsa', NULL, NULL, NULL, 1, '127.0.0.1', 1427173097, '', 0, NULL, NULL, NULL, NULL, 0),
(2, 20, '方法111', '短发是飞洒ff', '', 0, 'jianhu', NULL, NULL, NULL, 1, '127.0.0.1', 1427175360, 'developer', 1427175660, '天津', '和平区', '长江齐浩南', 123456789, 0),
(3, 27, 'fadfgasdba', 'agagadgfdsafagda', '', 0, 'admin', NULL, NULL, NULL, 1, '127.0.0.1', 1427182320, 'developer', 1427188740, '北京', '东城区', 'sdafsa', 12465, 1),
(4, 27, 'fasfa', 'afasf', '', 0, 'sdas', NULL, NULL, NULL, 1, '171.221.175.80', 1427244646, '', 0, '天津', '和平区', 'fdasfsa', 13265454, 1),
(5, 27, 'fasfs', 'fasfa', '', 0, 'faf', NULL, NULL, NULL, 1, '171.221.175.80', 1427244697, '', 0, '天津', '和平区', 'fsaf', 13265454, 2),
(6, 20, '啊啊啊', '啊啊啊', '', 0, '啊啊啊', NULL, NULL, NULL, 1, '171.221.175.80', 1427353329, '', 0, '四川', '成都', 'ww', 2147483647, 0),
(7, 20, 'aqsdasdasd', 'asdasdasdads', '', 0, 'asdasd', NULL, NULL, NULL, 1, '182.150.24.56', 1428977160, '', 0, '辽宁', '鞍山', 'asdasdasdasd', 123123123, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_job`
--

CREATE TABLE IF NOT EXISTS `fangfa_job` (
  `id` int(11) NOT NULL auto_increment,
  `catid` mediumint(9) default NULL,
  `user_id` mediumint(9) default NULL,
  `username` varchar(255) default NULL,
  `title` varchar(30) NOT NULL default '' COMMENT '职位名称',
  `guerdon` varchar(30) NOT NULL default '' COMMENT '薪酬待遇',
  `department` varchar(30) NOT NULL default '' COMMENT '所属部门',
  `user_sex` varchar(5) NOT NULL default '' COMMENT '性别要求',
  `user_age` varchar(20) NOT NULL default '' COMMENT '年龄要求',
  `job_number` int(10) NOT NULL default '0' COMMENT '招聘人数',
  `degree` varchar(30) NOT NULL default '' COMMENT '学历要求',
  `end_time` int(10) NOT NULL COMMENT '到期时间',
  `place` varchar(30) NOT NULL default '' COMMENT '工作地点',
  `experience` varchar(30) NOT NULL default '' COMMENT '职业经验',
  `notes` text NOT NULL COMMENT '职位说明',
  `linkman` varchar(20) NOT NULL default '' COMMENT '招聘主管',
  `im` varchar(60) NOT NULL default '' COMMENT 'QQ或MSN',
  `email` varchar(60) NOT NULL default '' COMMENT '招聘邮箱',
  `tel` varchar(20) NOT NULL default '' COMMENT '招聘电话',
  `address` varchar(200) NOT NULL default '' COMMENT '面试地址',
  `filename` varchar(60) NOT NULL default '' COMMENT '空白简历',
  `sort` mediumint(9) NOT NULL default '1',
  `status` tinyint(1) NOT NULL default '0',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='招聘职位表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fangfa_job`
--

INSERT INTO `fangfa_job` (`id`, `catid`, `user_id`, `username`, `title`, `guerdon`, `department`, `user_sex`, `user_age`, `job_number`, `degree`, `end_time`, `place`, `experience`, `notes`, `linkman`, `im`, `email`, `tel`, `address`, `filename`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 28, 1, 'admin', '财务经理/主管', '面议', '财务部', '', '', 10, '本科', 1427644800, '成都', '3年以上', '<p><span style="font-size: 14px; color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">工作职责：</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">1、负责公司会计核算、费用报销审核、税务管理；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">2、财务报表制作与财务分析；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">3、负责指导制定预算、监控预算执行；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">4、负责集团财务制定的执行；</span></span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; color: rgb(0, 0, 0);"><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">任职资格：</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">1、大专及以上学历，从事会计核算3年工作经验；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">2、熟悉EXCEL及主流财务操作软件，熟悉金蝶软件优先；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">3、持中级会计从业资格证书优先；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">4、持C1驾照优先；</span><br style="font-size: 12px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);"/><span style="font-size: 14px; font-family: 宋体, &#39;Courier New&#39;; line-height: 18px; background-color: rgb(255, 255, 255);">5、工作地点巴中清江，提供住宿，不接受者勿投递</span></span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '', '', '', '', '不限', '', 1, 1, 1427177390, 1427292708),
(2, 28, 1, 'admin', '行政人事主管', '面议', '行政部', '', '', 1, '本科以上', 1427644800, '成都', '4年以上', '<p style="font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-size: 14px; color: rgb(0, 0, 0);"><strong>工作内容：</strong></span></p><p style="font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-size: 14px; color: rgb(0, 0, 0);">1.负责行政管理工作（公文撰写，档案管理，资质办理，员工后勤服务工作；）&nbsp;<br/>2.负责人事管理工作（招聘工作，处理员工社保，员工关系）&nbsp; <br/>3.负责总助工作，总经理政策执行与落实，集团对接事宜</span></p><p style="font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-size: 14px; color: rgb(0, 0, 0);"><strong>任职要求：</strong></span></p><p style="font-size: 12px; margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 18px; font-family: 宋体, &#39;Courier New&#39;; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-size: 14px; color: rgb(0, 0, 0);">1.2年以上100以上公司行政人事工作经验，尤其擅长行政版块工作；&nbsp;<br/>2.具备优秀的亲和力，沟通与协调能力，主动性，分析思考能力，关注细节；&nbsp;<br/>3.具备管理潜质，心态开放，愿意向总经理助理岗位发展；&nbsp;<br/>4.有担当，创业型公司，愿意共同发展；</span></p><p>&nbsp;<br/></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '', '', '', '', '不限', '', 1, 1, 1427180088, 1427334987);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_job_apply`
--

CREATE TABLE IF NOT EXISTS `fangfa_job_apply` (
  `id` int(11) NOT NULL auto_increment,
  `job_id` int(11) NOT NULL default '0',
  `job_title` varchar(255) default '' COMMENT '应聘职位',
  `user_name` varchar(255) NOT NULL default '' COMMENT '姓名',
  `user_sex` varchar(32) default '' COMMENT '性别',
  `user_age` varchar(3) default '0' COMMENT '年龄',
  `user_card` varchar(64) default '' COMMENT '身份证',
  `user_phone` varchar(64) default '0' COMMENT '联系电话',
  `user_im` varchar(64) default '' COMMENT 'QQ',
  `user_email` varchar(64) default '' COMMENT '邮箱',
  `user_address` varchar(255) default '' COMMENT '地址',
  `end_time` varchar(255) default '' COMMENT '到岗时间',
  `user_education` varchar(255) default '' COMMENT '学历',
  `education_training` text COMMENT '填写您的教育培训经历',
  `work_experience` text COMMENT '填写您的工作经历',
  `filename` varchar(255) default NULL COMMENT '简历',
  `status` varchar(255) NOT NULL default '未阅',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_keylink`
--

CREATE TABLE IF NOT EXISTS `fangfa_keylink` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `word` char(40) NOT NULL COMMENT '关键字',
  `url` char(100) NOT NULL COMMENT '链接',
  `sort` smallint(5) unsigned NOT NULL default '1' COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键字链接' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_magazine`
--

CREATE TABLE IF NOT EXISTS `fangfa_magazine` (
  `id` int(11) NOT NULL auto_increment COMMENT '编号',
  `catid` int(11) NOT NULL COMMENT '栏目编号',
  `parentid` int(11) NOT NULL COMMENT '父级编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `description` varchar(200) default NULL COMMENT '简介',
  `images` varchar(200) NOT NULL COMMENT '封面',
  `img_map` text NOT NULL COMMENT '图片地图',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `sort` int(11) NOT NULL default '1' COMMENT '排序',
  `content_id` varchar(50) NOT NULL COMMENT '新闻编号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报刊模型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_menu`
--

CREATE TABLE IF NOT EXISTS `fangfa_menu` (
  `menuid` smallint(5) unsigned NOT NULL auto_increment,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `name` char(20) default NULL COMMENT '菜单名称',
  `url` char(100) default NULL COMMENT '菜单链接',
  `target` char(15) NOT NULL default 'mainFrame' COMMENT '打开窗口',
  `rolenames` char(100) default NULL COMMENT '可浏览的用户角色',
  `isopen` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否打开',
  `sort` smallint(5) unsigned NOT NULL default '1' COMMENT '排序',
  `keyid` varchar(20) default NULL COMMENT '唯一key，供程序使用',
  `issystem` tinyint(1) NOT NULL default '0' COMMENT '是否系统菜单，系统菜单不能删除',
  PRIMARY KEY  (`menuid`),
  KEY `parentid` (`parentid`,`sort`,`menuid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='菜单表' AUTO_INCREMENT=116 ;

--
-- 转存表中的数据 `fangfa_menu`
--

INSERT INTO `fangfa_menu` (`menuid`, `parentid`, `name`, `url`, `target`, `rolenames`, `isopen`, `sort`, `keyid`, `issystem`) VALUES
(1, 0, '后台顶部菜单', '', '_self', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 1),
(2, 0, '会员中心', '', '_self', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 1),
(3, 0, '会员中心快捷菜单', '', '_self', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 1),
(4, 1, '内容管理', '', 'left', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(5, 1, '模块管理', '', 'left', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(6, 1, '用户管理', '', 'left', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(7, 1, '栏目管理', '', 'left', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(8, 1, '系统设置', '', 'left', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(9, 1, '模板管理', '', 'left', '', 1, 1, NULL, 0),
(10, 1, '附表管理', '', 'left', 'array (\n  0 => ''banmanage'',\n)', 1, 4, NULL, 0),
(11, 6, '会员管理', '?m=fuser&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(12, 6, '管理员管理', '?m=fmanager&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(13, 6, '个人信息', '?m=fprofile&a=pwd', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(14, 7, '添加栏目', '?m=fcategory&a=add', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(15, 7, '管理栏目', '?m=fcategory&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(16, 7, '管理分类', '?m=fcategory&a=manage&cattype=cla', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(17, 7, '更新栏目缓存', '?m=fcache&a=category', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(18, 8, '网站配置', '?m=fset&a=set&selected=1', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(19, 8, '相关设置', '?m=fset&a=menu&do=manage', 'mainFrame', '', 1, 1, NULL, 0),
(20, 8, '系统工具', '?m=findex&a=system', 'mainFrame', '', 0, 1, NULL, 0),
(21, 8, '模型管理', '?m=fmodel&a=manage&sidetable=1', 'mainFrame', '', 0, 1, NULL, 0),
(22, 8, '模块管理', '?m=fmodule&a=manage', 'mainFrame', '', 0, 1, NULL, 0),
(23, 8, '数据库管理', '?m=fdb&a=backup', 'mainFrame', '', 0, 1, NULL, 0),
(24, 8, '操作注册管理', '?m=frbac&a=manage', 'mainFrame', '', 0, 1, NULL, 0),
(25, 9, '模板管理', '?m=ftpl&a=manage', 'mainFrame', '', 1, 1, NULL, 0),
(26, 9, '标签向导', '?m=ftpl&a=create_tag', 'mainFrame', '', 1, 1, NULL, 0),
(27, 9, '更新模板缓存', '?m=ftpl&a=cache', 'mainFrame', '', 1, 1, NULL, 0),
(28, 11, '添加会员', '?m=fuser&a=add&moduleid=2', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(29, 11, '管理会员', '?m=fuser&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(30, 11, '会员角色管理', '?m=fmember&a=manage_group&moduleid=2', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(31, 11, '会员模型管理', '?m=fmember&a=manage_model&moduleid=2', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(32, 11, '会员模块配置', '?m=fmember&a=setting_module', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(33, 12, '添加管理员', '?m=fmanager&a=add&modelid=6', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(34, 12, '管理员管理', '?m=fmanager&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(35, 12, '添加角色', '?m=frole&a=add&modelid=6', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(36, 12, '管理角色', '?m=frole&a=manage&modelid=6', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(37, 13, '修改资料', '?m=fprofile&a=edit', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(38, 13, '修改密码', '?m=fprofile&a=pwd', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(39, 18, '基本信息', '?m=fset&a=set&selected=1', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(40, 18, '网站设置', '?m=fset&a=set&selected=2', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(41, 18, '邮件设置', '?m=fset&a=set&selected=3', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(42, 18, '附件设置', '?m=fset&a=set&selected=4', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(43, 18, 'FTP设置', '?m=fset&a=set&selected=5', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(44, 18, '撰写设置', '?m=fset&a=set&selected=6', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 1, 1, NULL, 0),
(45, 19, '菜单管理', '?m=fset&a=menu&do=manage', 'mainFrame', '', 1, 1, NULL, 0),
(46, 19, 'TAG管理', '?m=ftag&a=manage', 'mainFrame', '', 1, 1, NULL, 0),
(47, 19, '参数管理', '?m=fset&a=arg&do=manage', 'mainFrame', '', 1, 1, NULL, 0),
(48, 19, '页面带连接词设置', '?m=fset&a=keylink&do=manage', 'mainFrame', '', 1, 1, NULL, 0),
(49, 19, 'Baibu/Google地图', '?m=fhtml&a=sitemaps', 'mainFrame', '', 1, 1, NULL, 0),
(50, 20, '运行环境诊断', '?m=findex&a=system', 'mainFrame', '', 0, 1, NULL, 0),
(51, 21, '添加模型', '?m=fmodel&a=add_model', 'mainFrame', '', 0, 1, NULL, 0),
(52, 21, '管理模型', '?m=fmodel&a=manage&sidetable=1', 'mainFrame', '', 0, 1, NULL, 0),
(53, 22, '注册模块', '?m=fmodule&a=add', 'mainFrame', '', 0, 1, NULL, 0),
(54, 22, '管理模块', '?m=fmodule&a=manage', 'mainFrame', '', 0, 1, NULL, 0),
(55, 23, '数据库备份', '?m=fdb&a=backup', 'mainFrame', '', 0, 1, NULL, 0),
(56, 23, '数据库恢复', '?m=fdb&a=restore', 'mainFrame', '', 0, 1, NULL, 0),
(57, 24, '后台操作注册管理', '?m=frbac&a=manage&appname=admin', 'mainFrame', '', 0, 1, NULL, 0),
(58, 24, '会员操作注册管理', '?m=frbac&a=manage&appname=front', 'mainFrame', '', 0, 1, NULL, 0),
(59, 5, '广告管理', '?m=fad&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(60, 5, '友情链接', '?m=ffriendlink&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(61, 5, '订单管理', '?m=forder&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(62, 5, '评论管理', '?m=fcomment&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(63, 59, '添加广告', '?m=fad&a=add', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(64, 59, '管理广告', '?m=fad&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(65, 5, '采集管理', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(66, 65, '节点管理', '?m=fcollect&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(67, 21, '副表模型', '?m=fmodel&a=manage&sidetable=2', 'mainFrame', 'array (\n  0 => ''member'',\n  1 => ''banmanage'',\n)', 0, 1, NULL, 0),
(68, 5, '跟单专用工具', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n  1 => ''member'',\n)', 0, 1, NULL, 0),
(69, 68, '测试数据添加', '?m=fplugin&a=testdata', 'mainFrame', 'array (\n  0 => ''administrator'',\n  1 => ''member'',\n)', 0, 1, NULL, 0),
(70, 5, '二维码', '?m=fbrcode&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(71, 70, '二维码生成器', '?m=fbrcode&a=manage', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(72, 70, '批量生成二维码', '?m=fbrcode&a=batch', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, NULL, 0),
(73, 1, '手机站', '#', 'left', '', 1, 1, NULL, 0),
(74, 73, '栏目管理', '#', 'mainFrame', '', 0, 1, NULL, 0),
(75, 74, '管理手机栏目', 'admin.php?m=fmobilemenu&a=menumanage', 'mainFrame', '', 0, 1, NULL, 0),
(76, 74, '添加栏目', '?m=fmobilemenu&a=add', 'mainFrame', '', 0, 1, NULL, 0),
(82, 74, '手机模版批量生成', '?m=fmobile&a=huancun', 'mainFrame', '', 0, 1, NULL, 0),
(77, 73, '手机站广告管理', '#', 'mainFrame', '', 0, 1, NULL, 0),
(78, 77, '添加手机广告', '?m=fmobilead&a=add', 'mainFrame', '', 0, 1, NULL, 0),
(79, 77, '管理手机广告', '?m=fmobilead&a=manage', 'mainFrame', '', 0, 1, NULL, 0),
(80, 73, '模版管理', '#', 'mainFrame', '', 0, 1, NULL, 0),
(81, 80, '模版设置', '?m=fmobile&a=setting', 'mainFrame', '', 0, 1, NULL, 0),
(83, 1, '微博管理', '#', 'left', 'array (\n  0 => ''member'',\n)', 0, 1, NULL, 0),
(84, 83, '微博转发', '?m=fblog&a=manage', 'mainFrame', 'array (\n  0 => ''member'',\n)', 0, 1, NULL, 0),
(85, 83, '微博帐号管理', '?m=fblog&a=usermanage', 'mainFrame', 'array (\n  0 => ''member'',\n)', 0, 1, NULL, 0),
(86, 4, '走进达亿', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_1', 0),
(87, 86, '公司介绍', '?m=fpage&a=manage&catid=2', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_2', 0),
(88, 86, '总经理致辞', '?m=fpage&a=manage&catid=3', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_3', 0),
(89, 86, '组织架构', '?m=fpage&a=manage&catid=4', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_4', 0),
(91, 86, '企业文化', '?m=fpage&a=manage&catid=6', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_6', 0),
(92, 4, '新闻资讯', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_7', 0),
(93, 92, '公司新闻', '?m=fcontent&a=manage&catid=8', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_8', 0),
(94, 92, '项目动态', '?m=fcontent&a=manage&catid=9', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_9', 0),
(95, 92, '公司公告', '?m=fcontent&a=manage&catid=10', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_10', 0),
(96, 92, '媒体报道', '?m=fcontent&a=manage&catid=11', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_11', 0),
(97, 4, '项目展示', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_12', 0),
(98, 97, '已有项目', '?m=fcontent&a=manage&catid=13', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_13', 0),
(100, 97, '规划项目', '?m=fcontent&a=manage&catid=15', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_15', 0),
(101, 4, '商务合作', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_16', 0),
(102, 101, '合作共赢', '?m=fpage&a=manage&catid=17', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_17', 0),
(103, 101, '招商信息', '?m=fpage&a=manage&catid=18', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_18', 0),
(104, 101, '招标告示', '?m=fcontent&a=manage&catid=19', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_19', 0),
(105, 101, '我要合作', '?m=fguestbook&a=manage&catid=20', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_20', 0),
(106, 4, '人力资源', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_21', 0),
(107, 106, '人才理念', '?m=fpage&a=manage&catid=22', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_22', 0),
(113, 106, '招聘职位', '?m=fjob&a=manage&catid=28', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_28', 0),
(109, 106, '应聘方式', '?m=fpage&a=manage&catid=24', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_24', 0),
(110, 4, '联系我们', '#', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_25', 0),
(111, 110, '联系我们', '?m=fpage&a=manage&catid=26', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_26', 0),
(112, 110, '投诉建议', '?m=fguestbook&a=manage&catid=27', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_27', 0),
(115, 86, '领导关怀', '?m=fpage&a=manage&catid=30', 'mainFrame', 'array (\n  0 => ''administrator'',\n)', 0, 1, 'cat_30', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_mobilead`
--

CREATE TABLE IF NOT EXISTS `fangfa_mobilead` (
  `aid` int(11) unsigned NOT NULL auto_increment COMMENT '手机广告位ID',
  `name` varchar(60) NOT NULL,
  `classes` tinyint(3) NOT NULL COMMENT '1是图片 2是文字 ',
  `notes` text NOT NULL,
  `url` varchar(50) default NULL,
  `create_time` int(11) NOT NULL,
  `out_time` int(11) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_mobilemenu`
--

CREATE TABLE IF NOT EXISTS `fangfa_mobilemenu` (
  `id` tinyint(5) unsigned NOT NULL auto_increment COMMENT '手机栏目id',
  `catid` tinyint(5) NOT NULL COMMENT '挂靠栏目id',
  `name` varchar(32) NOT NULL COMMENT '手机栏目名称',
  `url` varchar(64) NOT NULL,
  `catdir` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '手机栏目描述',
  `setting` mediumtext NOT NULL COMMENT '模版设置',
  `sort` tinyint(3) NOT NULL default '1' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(3) NOT NULL COMMENT '状态',
  PRIMARY KEY  (`id`),
  KEY `create_time` (`create_time`),
  KEY `status` (`status`),
  KEY `sort` (`sort`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_model`
--

CREATE TABLE IF NOT EXISTS `fangfa_model` (
  `modelid` smallint(4) unsigned NOT NULL auto_increment COMMENT '模型ID',
  `name` varchar(30) NOT NULL COMMENT '模型名称',
  `description` varchar(200) NOT NULL COMMENT '模型描述',
  `exttable` varchar(20) default NULL COMMENT '模型扩展表名',
  `tablename` varchar(64) default NULL COMMENT '完整表名',
  `moduleid` smallint(4) NOT NULL COMMENT '所属模块ID',
  `status` enum('0','1') NOT NULL default '0' COMMENT '1=启用、0=禁用',
  `extendable` enum('0','1') NOT NULL default '1' COMMENT '是否扩展模型',
  PRIMARY KEY  (`modelid`),
  UNIQUE KEY `tablename` (`tablename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型注册表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `fangfa_model`
--

INSERT INTO `fangfa_model` (`modelid`, `name`, `description`, `exttable`, `tablename`, `moduleid`, `status`, `extendable`) VALUES
(1, '文章发布', '文章类型的栏目可以采用此模型', 'article', 'content_article', 1, '1', '1'),
(2, '产品展示', '产品类型的栏目可以使用此模型', 'product', 'content_product', 1, '1', '1'),
(3, '图片欣赏', '图片展示类型的栏目可以使用此模型', 'picture', 'content_picture', 1, '1', '1'),
(4, '文件下载', '文件下载类型栏目可以使用此模型', 'download', 'content_download', 1, '1', '1'),
(5, '视频播放', '视频播放的栏目可选择此模型', 'video', 'content_video', 1, '1', '1'),
(6, '系统管理员', '系统管理员模型', 'manager', 'user_manager', 2, '1', '1'),
(7, '个人会员', '个人会员模型', 'person', 'user_person', 2, '1', '1'),
(8, '在线留言', '提交留言和显示留言列表', 'guestbook', 'guestbook', 3, '1', '0'),
(9, '人才招聘', '职位列表、职位详情、提交简历', 'job', 'job', 4, '1', '0'),
(10, '营销网络', '营销网络', 'salenet', 'salenet', 5, '1', '0'),
(11, '在线投票', '投票调查', 'vote_subject', 'vote_subject', 6, '1', '0'),
(12, '在线问答', '问答模块', 'ask', 'ask', 7, '1', '0'),
(13, '活动报名', '活动报名', 'activity', 'activity', 8, '1', '0'),
(14, '电子报刊', '电子报刊', 'magazine', 'content_magazine', 9, '1', '1'),
(15, '电子杂志', '电子杂志', 'press', 'press', 10, '1', '1'),
(16, '新闻模板', '', 'cnews', 'content_cnews', 1, '1', '1'),
(17, '项目模型', '', 'promodel', 'content_promodel', 1, '1', '1'),
(18, '新留言板', '', 'board', 'guestbook_board', 3, '1', '0');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_model_field`
--

CREATE TABLE IF NOT EXISTS `fangfa_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL auto_increment,
  `modelid` tinyint(4) unsigned NOT NULL COMMENT '所属模型ID',
  `field` varchar(20) NOT NULL COMMENT '数据库字段名',
  `name` varchar(30) NOT NULL COMMENT '字段表单显示名称',
  `tips` text NOT NULL COMMENT '提示信息',
  `css` varchar(50) default NULL COMMENT '元素的css样式名称',
  `parent_css` varchar(50) default NULL COMMENT '父容器css',
  `minlength` int(10) unsigned default NULL COMMENT '最小长度',
  `maxlength` int(10) unsigned default NULL COMMENT '最大长度',
  `required` enum('0','1') NOT NULL default '0' COMMENT '必填?',
  `pattern` varchar(255) default NULL COMMENT '正则验证表达式',
  `errortips` varchar(255) default NULL COMMENT '表单错误提示',
  `formtype` varchar(20) default NULL COMMENT '表单类型',
  `setting` text COMMENT '配置',
  `dbname` varchar(64) default NULL COMMENT '挂靠副表表名',
  `dbkey` varchar(32) default NULL COMMENT '挂靠副表显示值',
  `dbvalue` varchar(32) default NULL COMMENT '挂靠副表实际值',
  `formattribute` varchar(255) default NULL COMMENT '表单元素属性',
  `systype` tinyint(1) unsigned NOT NULL default '0' COMMENT '0=自定义字段、1=主表默认字段、2=主键字段',
  `sort` mediumint(8) unsigned NOT NULL default '1' COMMENT '排序',
  `status` enum('0','1') NOT NULL default '1' COMMENT '1=启用、0=禁用',
  `card` smallint(1) default '1' COMMENT '所属选项卡',
  `listshow` tinyint(1) NOT NULL default '0' COMMENT '是否在列表中显示',
  PRIMARY KEY  (`fieldid`),
  KEY `modelid` (`modelid`,`status`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型字段表' AUTO_INCREMENT=230 ;

--
-- 转存表中的数据 `fangfa_model_field`
--

INSERT INTO `fangfa_model_field` (`fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `parent_css`, `minlength`, `maxlength`, `required`, `pattern`, `errortips`, `formtype`, `setting`, `dbname`, `dbkey`, `dbvalue`, `formattribute`, `systype`, `sort`, `status`, `card`, `listshow`) VALUES
(1, 1, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(2, 1, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', NULL, NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(3, 1, 'classify_select', '分类管理', '分类目录', NULL, NULL, 0, 0, '0', NULL, '', 'select', 'NULL', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(4, 1, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(5, 1, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(6, 1, 'resource', '文章来源', '信息的来源，如新浪网', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''35'',\n  ''defaultvalue'' => ''本站'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(7, 1, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\r\n  ''size'' => ''50'',\r\n  ''defaultvalue'' => '''',\r\n  ''upload_maxsize'' => ''512'',\r\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\r\n  ''isthumb'' => ''0'',\r\n  ''thumb_width'' => ''150'',\r\n  ''thumb_height'' => ''150'',\r\n  ''iswatermark'' => ''0'',\r\n  ''water_path'' => ''images/download.gif'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(8, 1, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(9, 1, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 1, '1', 1, 0),
(10, 1, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(11, 1, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''550'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''0'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(12, 1, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(13, 1, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(14, 1, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(15, 1, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(16, 1, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(17, 1, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(18, 1, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(19, 1, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(20, 1, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(21, 1, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(22, 1, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(23, 2, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(24, 2, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', NULL, NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(25, 2, 'title', '产品名称', '字数长度在1~60个字间', 'input', NULL, 1, 60, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(26, 2, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(27, 2, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''512'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(28, 2, 'big_pic', '显示图片', '在单个页面中显示的大图，图片上传后会自动生成缩略图', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\r\n  ''size'' => ''50'',\r\n  ''defaultvalue'' => '''',\r\n  ''upload_maxsize'' => ''2048'',\r\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\r\n  ''isthumb'' => ''1'',\r\n  ''thumb_width'' => ''150'',\r\n  ''thumb_height'' => ''150'',\r\n  ''iswatermark'' => ''1'',\r\n  ''water_path'' => ''images/watermark.png'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(29, 2, 'images', '产品组图', '产品图片', NULL, NULL, 0, 255, '0', NULL, '', 'images', 'array (\n  ''upload_maxsize'' => ''20480'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(30, 2, 'size', '产品型号', '产品型号', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''30'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(31, 2, 'unit', '产品单位', '产品单位', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''个|个\r\n件|件\r\n台|台\r\n条|条\r\n张|张\r\n本|本\r\n只|只\r\n箱|箱\r\n瓶|瓶\r\n吨|吨\r\nKg|Kg\r\nm|m'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''个'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(32, 2, 'market_price', '市场价', '产品的市场价格', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''4'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(33, 2, 'price', '优惠价', '我们的优惠价格', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''4'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(34, 2, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(35, 2, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 1, '1', 1, 0),
(36, 2, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(37, 2, 'content', '详细介绍', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\n  ''toolbar'' => ''advanced'',\n  ''width'' => ''550'',\n  ''height'' => ''250'',\n  ''keywork-link'' => ''0'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(38, 2, 'status', '状态', '默认发布或暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(39, 2, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(40, 2, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 100, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(41, 2, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''6'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(42, 2, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''6'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(43, 2, 'url', '链接地址', '默认自动生成，不包括".html"后缀', 'input', NULL, 0, 0, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(44, 2, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 0, '0', NULL, '', 'input', 'array (\r\n  ''size'' => ''6'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(45, 2, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 200, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(46, 2, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(47, 2, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(48, 2, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(49, 3, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(50, 3, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', '', NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(51, 3, 'title', '图片名称', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '网站名称在1~60个字间', 'title', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(52, 3, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(53, 3, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\r\n  ''size'' => ''50'',\r\n  ''defaultvalue'' => '''',\r\n  ''upload_maxsize'' => ''512'',\r\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\r\n  ''isthumb'' => ''0'',\r\n  ''thumb_width'' => ''150'',\r\n  ''thumb_height'' => ''150'',\r\n  ''iswatermark'' => ''0'',\r\n  ''water_path'' => ''images/watermark.png'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(54, 3, 'big_pic', '显示图片', '在页面中显示的单个大图，图片上传后会自动生成缩略图', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''2048'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''1'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''1'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(55, 3, 'images', '组图', '', NULL, NULL, 0, 255, '0', NULL, '', 'images', 'array (\n  ''upload_maxsize'' => ''20480'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(56, 3, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(57, 3, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 1, '1', 1, 0),
(58, 3, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(59, 3, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''550'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''0'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(60, 3, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(61, 3, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(62, 3, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(63, 3, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''1'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(64, 3, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(65, 3, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(66, 3, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(67, 3, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(68, 3, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(69, 3, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(70, 3, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(71, 4, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(72, 4, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', '', NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(73, 4, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(74, 4, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(75, 4, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''512'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(76, 4, 'downfile', '文件下载', '', 'input', NULL, 0, 0, '0', NULL, '', 'download', 'array (\n  ''upload_maxsize'' => ''10000'',\n  ''upload_allowext'' => ''zip|rar|doc|docx|xls|ppt|txt'',\n  ''size_input'' => ''info[filesize]'',\n  ''downloadtype'' => ''1'',\n  ''permissions'' => \n  array (\n    0 => ''administrator'',\n    1 => ''guest'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(77, 4, 'type', '文件类型', '请选择文件的类型', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''rar|rar\r\npdf|pdf\r\ndoc|doc\r\nexcel|excel\r\nexe|exe\r\n其他|其他'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''rar'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(78, 4, 'filesize', '文件大小', '', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => ''未知'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, 'onfocus=&quot;if(this.value==''未知'') this.value='''';&quot; onblur=&quot;if(this.value=='''') this.value=''未知'';&quot;', 1, 1, '1', 1, 0),
(79, 4, 'version', '版本号', '', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(80, 4, 'language', '软件语言', '', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''VARCHAR'',\n  ''defaultvalue'' => ''简体中文'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(81, 4, 'systems', '软件平台', '软件运行平台', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => ''Win2000/WinXP/Win2003'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(82, 4, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(83, 4, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 1, '1', 1, 0),
(84, 4, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(85, 4, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''550'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''0'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(86, 4, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(87, 4, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(88, 4, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(89, 4, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(90, 4, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(91, 4, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(92, 4, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(93, 4, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(94, 4, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(95, 4, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(96, 4, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(97, 5, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(98, 5, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', NULL, NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(99, 5, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(100, 5, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(101, 5, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''512'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(102, 5, 'video', '视频地址', '视频地址，原始名称和实际名称用“|”进行分割开。', 'input', NULL, 0, 0, '0', NULL, '', 'video', 'array (\n  ''size'' => ''50'',\n  ''width'' => ''500'',\n  ''height'' => ''400'',\n  ''upload_maxsize'' => ''10000'',\n  ''upload_allowext'' => ''swf|flv|wmv|mp4'',\n  ''downloadtype'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(103, 5, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(104, 5, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 1, '1', 1, 0),
(105, 5, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(106, 5, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''550'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''0'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(107, 5, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(108, 5, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 0, '0', NULL, '', 'tag', 'array (\n  ''size'' => ''30'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(109, 5, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(110, 5, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(111, 5, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(112, 5, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(113, 5, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(114, 5, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(115, 5, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(116, 5, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(117, 5, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(118, 6, 'user_id', '用户ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(119, 6, 'username', '管理员名', '管理员的登录名称，5~20个字符，只能包含字母和数字，不能与其他管理员名重复', 'input', NULL, 5, 20, '1', NULL, '【管理员名】必须且不能与其他管理员名重复，只能包含字母和数字', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(120, 6, 'password', '管理员密码', '管理员密码，5~20个字符', 'input', NULL, 5, 20, '1', NULL, '【管理员密码】必填，5~20个字符', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(121, 6, 'repassword', '确认密码', '再次输入密码，防止输入错误', 'input', NULL, 5, 20, '1', NULL, '【确认密码】必填且两次输入的密码应一致', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(122, 6, 'nickname', '昵称', '管理员的昵称', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\r\n  ''size'' => ''20'',\r\n  ''defaultvalue'' => '''',\r\n  ''ispassword'' => ''0'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(123, 6, 'email', '电子邮件', '自助找回密码唯一方式，不可改', 'input email', NULL, 8, 64, '1', NULL, '【电子邮件】必须填写正确且没有被使用', 'input', 'array (\n  ''size'' => ''40'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(124, 6, 'remark', '备注', '', 'textarea', NULL, 0, 0, '0', NULL, '', 'textarea', 'array (\n  ''rows'' => ''4'',\n  ''cols'' => ''50'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(125, 6, 'status', '状态', '锁定管理员无法进行任何授权操作', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''正常|1\r\n锁定|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(126, 6, 'realname', '真实姓名', '', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(127, 6, 'sex', '性别', '', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''男|1\r\n女|2'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(128, 7, 'user_id', '用户ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(129, 7, 'username', '会员名', '会员的登录名称，5~20个字符，只能包含字母和数字，不能与其他会员名重复', 'input', NULL, 5, 20, '1', NULL, '【会员名】必须且不能与其他会员名重复，只能包含字母和数字', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(130, 7, 'password', '会员密码', '会员密码，5~20个字符', 'input', NULL, 5, 20, '1', NULL, '【会员密码】必填，5~20个字符', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(131, 7, 'repassword', '确认密码', '再次输入密码，防止输入错误', 'input', NULL, 5, 20, '1', NULL, '【确认密码】必填且两次输入的密码应一致', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(132, 7, 'nickname', '昵称', '会员的昵称', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\r\n  ''size'' => ''20'',\r\n  ''defaultvalue'' => '''',\r\n  ''ispassword'' => ''0'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(133, 7, 'email', '电子邮件', '自助找回密码唯一方式，不可改', 'input email', NULL, 8, 64, '1', NULL, '【电子邮件】必须填写正确且没有被使用', 'input', 'array (\n  ''size'' => ''40'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(134, 7, 'remark', '备注', '', 'textarea', NULL, 0, 0, '0', NULL, '', 'textarea', 'array (\n  ''rows'' => ''4'',\n  ''cols'' => ''50'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(135, 7, 'status', '状态', '锁定会员无法进行任何授权操作', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''正常|1\r\n锁定|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(136, 7, 'realname', '真实姓名', '', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(137, 7, 'sex', '性别', '', NULL, NULL, 0, 255, '0', NULL, '', 'box', 'array (\n  ''option'' => ''男|1\r\n女|2'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''CHAR'',\n  ''defaultvalue'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(138, 14, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 16, '1', 2, 0),
(139, 14, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(140, 14, 'content', '正文内容', '主体详细内容', '', '', 0, 0, '0', '', '', 'editor', 'array (\n  ''toolbar'' => ''advanced'',\n  ''width'' => ''550'',\n  ''height'' => ''250'',\n  ''keywork-link'' => ''0'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 8, '1', 1, 0),
(141, 14, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 10, '1', 1, 0),
(142, 14, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 5, '1', 1, 0),
(143, 14, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 7, '1', 1, 0),
(144, 14, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 7, '1', 1, 0),
(145, 14, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', '', 0, 255, '0', '', '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''512'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''1'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/download.gif'',\n)', NULL, NULL, NULL, '', 1, 4, '1', 1, 0),
(146, 14, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 3, '1', 1, 0),
(147, 14, 'resource', '文章来源', '信息的来源，如新浪网', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''35'',\n  ''defaultvalue'' => ''本站'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 6, '1', 1, 0),
(148, 14, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(149, 14, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(150, 14, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 12, '0', 2, 0),
(151, 14, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 8, '0', 1, 0),
(152, 14, 'classify_select', '分类管理', '分类目录', NULL, NULL, 0, 0, '0', NULL, '', 'select', 'NULL', NULL, NULL, NULL, NULL, 1, 11, '0', 1, 0),
(153, 14, 'cid', 'ID', '', '', '', 0, 0, '0', '', '', 'id', NULL, NULL, NULL, NULL, '', 2, 1, '1', 1, 0),
(154, 14, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', '', '', 0, 0, '1', '', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 2, '1', 1, 0),
(155, 14, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 18, '1', 2, 0),
(156, 14, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 17, '1', 2, 0),
(157, 14, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 20, '1', 2, 0),
(158, 14, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 21, '1', 2, 0),
(159, 14, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 22, '1', 2, 0),
(160, 15, 'pid', 'ID', '', '', '', 0, 0, '0', '', '', 'id', NULL, NULL, NULL, NULL, '', 2, 1, '1', 1, 0),
(161, 15, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', '', '', 0, 0, '1', '', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 2, '1', 1, 0),
(162, 15, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 3, '1', 1, 0),
(163, 15, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', '', 0, 255, '0', '', '', 'thumb', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''512'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''1'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/download.gif'',\n)', NULL, NULL, NULL, '', 1, 4, '1', 1, 0),
(164, 15, 'resource', '文章来源', '信息的来源，如新浪网', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''35'',\n  ''defaultvalue'' => ''本站'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 6, '1', 1, 0),
(165, 15, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 5, '1', 1, 0),
(166, 15, 'brcode', '二维码图片', '自动生成二维码图片', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 7, '1', 1, 0),
(167, 15, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 7, '1', 1, 0),
(168, 15, 'content', '正文内容', '主体详细内容', '', '', 0, 0, '0', '', '', 'editor', 'array (\n  ''toolbar'' => ''advanced'',\n  ''width'' => ''550'',\n  ''height'' => ''250'',\n  ''keywork-link'' => ''0'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 8, '1', 1, 0),
(169, 15, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 12, '0', 2, 0),
(170, 15, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 10, '1', 1, 0),
(171, 15, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(172, 15, 'classify_select', '分类管理', '分类目录', NULL, NULL, 0, 0, '0', NULL, '', 'select', 'NULL', NULL, NULL, NULL, NULL, 1, 11, '0', 1, 0),
(173, 15, 'create_time', '添加时间', '默认当前时间', '', '', 0, 50, '0', '', '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, '', 1, 21, '1', 2, 0),
(174, 15, 'update_time', '更新时间', '默认最后更新时间', '', '', 0, 50, '0', '', '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, '', 1, 22, '1', 2, 0),
(175, 15, 'up', '封面图片', 'flash封面图片', 'input', '', 0, 255, '0', '', '', 'thumb', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, '', 0, 4, '1', 1, 0),
(176, 15, 'down', '封底图片', 'flash封底图片', 'input', '', 0, 0, '0', '', '', 'thumb', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''0'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, '', 0, 4, '1', 1, 0),
(177, 15, 'music', '背景音乐', 'flash背景音乐', 'input', '', 0, 0, '0', '', '', 'file', 'array (\n  ''size'' => ''50'',\n  ''upload_maxsize'' => ''5048'',\n  ''upload_allowext'' => ''mp3|wma'',\n  ''downloadtype'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 4, '1', 1, 0),
(178, 15, 'images', '内容图片', 'flash的内容图片', '', '', 0, 255, '0', '', '', 'images', 'array (\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isthumb'' => ''1'',\n  ''thumb_width'' => ''150'',\n  ''thumb_height'' => ''150'',\n  ''iswatermark'' => ''0'',\n  ''water_path'' => ''images/watermark.png'',\n)', NULL, NULL, NULL, '', 0, 4, '1', 1, 0),
(179, 15, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', '', 0, 250, '0', '', '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 10, '1', 2, 0),
(180, 15, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', '', 0, 255, '0', '', '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 1, 9, '1', 2, 0),
(181, 15, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', '', 0, 250, '0', '', '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 1, 11, '1', 2, 0),
(182, 15, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 11, '1', 2, 0),
(183, 16, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(184, 16, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', NULL, NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(185, 16, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0);
INSERT INTO `fangfa_model_field` (`fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `parent_css`, `minlength`, `maxlength`, `required`, `pattern`, `errortips`, `formtype`, `setting`, `dbname`, `dbkey`, `dbvalue`, `formattribute`, `systype`, `sort`, `status`, `card`, `listshow`) VALUES
(186, 16, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(187, 16, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\r\n  ''size'' => ''50'',\r\n  ''defaultvalue'' => '''',\r\n  ''upload_maxsize'' => ''512'',\r\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\r\n  ''isthumb'' => ''0'',\r\n  ''thumb_width'' => ''150'',\r\n  ''thumb_height'' => ''150'',\r\n  ''iswatermark'' => ''0'',\r\n  ''water_path'' => ''images/download.gif'',\r\n)', NULL, NULL, NULL, NULL, 1, 2, '1', 1, 0),
(188, 16, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', NULL, '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 3, '1', 1, 0),
(189, 16, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 7, '1', 1, 0),
(190, 16, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''750'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 8, '1', 1, 0),
(191, 16, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 9, '1', 1, 0),
(192, 16, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(193, 16, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(194, 16, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(195, 16, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(196, 16, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 6, '1', 2, 0),
(197, 16, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(198, 16, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(199, 16, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(200, 16, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(201, 16, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(202, 17, 'cid', 'ID', '', NULL, NULL, NULL, NULL, '0', NULL, '', 'id', '', NULL, NULL, NULL, NULL, 2, 1, '1', 1, 0),
(203, 17, 'catid', '所属栏目', '选择到发布到的栏目，默认当前栏目', NULL, NULL, 0, 0, '1', NULL, '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(204, 17, 'title', '标题', '字数长度在1~60个字间', 'input', NULL, 0, 255, '1', NULL, '标题在1~60个字间', 'title', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(205, 17, 'style', '字型与颜色', '可以选择标题在页面上显示的颜色和字型，未定义则是页面默认定义', NULL, NULL, 0, 0, '0', NULL, '', 'style', 'array (\n  ''style'' => \n  array (\n    ''color'' => '''',\n  ),\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 1, 0),
(206, 17, 'thumb', '缩略图', '可从本机上传或者从站内选择', 'input', NULL, 0, 255, '0', NULL, '', 'thumb', 'array (\r\n  ''size'' => ''50'',\r\n  ''defaultvalue'' => '''',\r\n  ''upload_maxsize'' => ''512'',\r\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\r\n  ''isthumb'' => ''0'',\r\n  ''thumb_width'' => ''150'',\r\n  ''thumb_height'' => ''150'',\r\n  ''iswatermark'' => ''0'',\r\n  ''water_path'' => ''images/download.gif'',\r\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 1, 0),
(207, 17, 'attr', '文档属性', '', NULL, NULL, 0, 0, '0', '', '', 'attr', 'array (\n  ''show'' => \n  array (\n    0 => ''top'',\n    1 => ''hot'',\n    2 => ''scroll'',\n  ),\n)', NULL, NULL, NULL, '', 1, 1, '0', 1, 0),
(208, 17, 'description', '摘要', '默认可以自动截取前200字作为摘要', 'textarea', NULL, 0, 200, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 2, '1', 1, 0),
(209, 17, 'content', '正文内容', '主体详细内容', NULL, NULL, 0, 0, '0', NULL, '', 'editor', 'array (\r\n  ''toolbar'' => ''advanced'',\r\n  ''width'' => ''750'',\r\n  ''height'' => ''250'',\r\n  ''keywork-link'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', NULL, NULL, NULL, NULL, 1, 3, '1', 1, 0),
(210, 17, 'status', '状态', '默认发布，也可以暂时不发布', NULL, NULL, 0, 255, '1', NULL, '', 'box', 'array (\n  ''option'' => ''发布|9\r\n待审|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''TINYINT'',\n  ''defaultvalue'' => ''9'',\n)', NULL, NULL, NULL, NULL, 1, 4, '1', 1, 0),
(211, 17, 'tag', 'TAG', '以空格隔开，输出会有自动提示', 'input', NULL, 0, 255, '0', NULL, '请正确填写【TAG】', 'tag', 'array (\n  ''size'' => ''60'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(212, 17, 'seotitle', 'SEO标题', '默认同标题，也可自定义', 'input', NULL, 0, 255, '0', NULL, '不能超过100个字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(213, 17, 'seokeywords', 'SEO关键字', '默认同TAG，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过200个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(214, 17, 'seodescription', 'SEO描述', '默认同摘要，也可自定义', 'textarea', NULL, 0, 250, '0', NULL, '不能超过250个字', 'textarea', 'array (\n  ''rows'' => ''5'',\n  ''cols'' => ''60'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(215, 17, 'url', '链接地址', '默认自动生成，不包括".html"后缀，不可改', 'input', NULL, 0, 255, '0', NULL, '不能是纯数字', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(216, 17, 'sort', '排序', '默认为 1，越小越靠前', 'input', NULL, 0, 255, '0', NULL, '', 'input', 'array (\n  ''size'' => ''6'',\n  ''defaultvalue'' => ''1'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(217, 17, 'template', '模板', '默认使用栏目模板，也可以从模板库中选择', 'input', NULL, 0, 255, '0', NULL, '', 'template', 'array (\n  ''size'' => ''50'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(218, 17, 'fulltitle', '完整标题', '默认同标题', 'input', NULL, 0, 100, '0', NULL, '在1~100个字间', 'input', 'array (\n  ''size'' => ''60'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, NULL, 1, 1, '0', 2, 0),
(219, 17, 'create_time', '添加时间', '默认当前时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(220, 17, 'update_time', '更新时间', '默认最后更新时间', NULL, NULL, 0, 50, '0', NULL, '格式错误', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, NULL, 1, 1, '1', 2, 0),
(221, 17, 'start_Time', '开工时间', '', '', '', 0, 0, '0', '', '', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(222, 17, 'pretty_Time', '竣工时间', '', '', '', 0, 0, '0', '', '', 'datetime', 'array (\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''1'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(223, 17, 'structure', '建筑面积', '输入格式为:1234.00', '', '', 0, 0, '0', '', '', 'number', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''0'',\n  ''decimaldigits'' => ''-1'',\n  ''defaultvalue'' => '''',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(224, 17, 'cost', '工程估价', '格式为:1234.00万（带上单位）', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(225, 17, 'cate', '建筑类别', '', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(226, 17, 'phase', '项目阶段', '', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''20'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(227, 17, 'paddress', '项目地址', '', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 1, '0', 1, 0),
(228, 16, 'source', '来源', '', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => ''本站'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 4, '1', 1, 0),
(229, 16, 'wangzhi', '网址', '', '', '', 0, 255, '0', '', '', 'input', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => ''http://bxdytz.com/'',\n  ''ispassword'' => ''0'',\n)', NULL, NULL, NULL, '', 0, 5, '1', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_module`
--

CREATE TABLE IF NOT EXISTS `fangfa_module` (
  `moduleid` smallint(4) NOT NULL auto_increment,
  `controller` varchar(50) NOT NULL COMMENT '控制器名称',
  `name` varchar(20) NOT NULL COMMENT '模块名称',
  `tablename` varchar(50) default NULL COMMENT '模块主记录数据表名称',
  `description` varchar(200) default NULL COMMENT '描述',
  `sort` smallint(4) NOT NULL default '1' COMMENT '排序',
  `status` enum('0','1') NOT NULL default '0' COMMENT '状态 0=禁用 1=启用',
  `extendable` enum('0','1') NOT NULL default '0' COMMENT '是否可扩展',
  `issystem` enum('0','1') NOT NULL default '0' COMMENT '是否固定模块',
  `ishtml` tinyint(1) NOT NULL default '0' COMMENT '是否可静态',
  PRIMARY KEY  (`moduleid`),
  UNIQUE KEY `action` (`controller`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台模块表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `fangfa_module`
--

INSERT INTO `fangfa_module` (`moduleid`, `controller`, `name`, `tablename`, `description`, `sort`, `status`, `extendable`, `issystem`, `ishtml`) VALUES
(1, 'fcontent', '内容展示', 'content', '内容展示', 1, '1', '1', '1', 1),
(2, 'fuser', '用户管理', 'user', '前台会员及后台管理员管理', 2, '1', '1', '1', 1),
(3, 'fguestbook', '留言板', 'guestbook', '留言板', 3, '1', '0', '0', 0),
(4, 'fjob', '人才招聘', 'job', '人才招聘', 4, '1', '0', '0', 1),
(5, 'fsalenet', '营销网络', 'salenet', '营销网络、介绍公司营销网络分布。', 5, '1', '0', '0', 1),
(6, 'fvote', '投票调查', 'vote_subject', '投票调查', 6, '1', '0', '0', 1),
(7, 'fask', '在线问答', 'ask', '问答模块', 7, '1', '0', '0', 0),
(8, 'factivity', '活动报名', 'activity', '活动报名模块', 8, '1', '0', '0', 0),
(9, 'fmagazine', '电子报刊', 'magazine', '电子报刊', 9, '1', '1', '0', 0),
(10, 'fpress', '电子杂志', 'press', '电子杂志', 10, '1', '1', '0', 0),
(11, 'fsidetable', '副表挂靠', 'sidetable', '单表挂靠功能', 11, '1', '1', '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_order`
--

CREATE TABLE IF NOT EXISTS `fangfa_order` (
  `orderid` int(10) unsigned NOT NULL auto_increment,
  `ordernum` char(20) NOT NULL COMMENT '订单号',
  `keyid` int(32) NOT NULL COMMENT '额外标识符',
  `ordername` text NOT NULL COMMENT '订单名称',
  `price` decimal(8,2) unsigned NOT NULL default '0.00' COMMENT '单价',
  `number` smallint(5) unsigned NOT NULL default '0' COMMENT '订购总数量',
  `total` float default NULL COMMENT '总价',
  `linkman` char(20) NOT NULL COMMENT '联系人',
  `telephone` char(20) NOT NULL COMMENT '联系电话',
  `mobile` char(15) NOT NULL COMMENT '手机号码',
  `address` char(200) NOT NULL COMMENT '邮寄地址',
  `postcode` int(6) default NULL COMMENT '邮编',
  `message` char(255) default NULL COMMENT '买家留言',
  `remark` char(255) default NULL COMMENT '备注',
  `userid` mediumint(8) unsigned default '0' COMMENT '用户ID',
  `username` char(20) default NULL COMMENT '用户名',
  `ip` char(15) NOT NULL COMMENT '订购IP',
  `status` tinyint(1) unsigned NOT NULL default '0' COMMENT '-1=待确认、0=待付款订单、1=已付款订单、2=已发货订单、 9=交易成功订单、 -9=交易关闭订单',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '下单时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY  (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_order_log`
--

CREATE TABLE IF NOT EXISTS `fangfa_order_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `orderid` int(10) unsigned default '0' COMMENT '订单ID',
  `laststatus` char(2) default '' COMMENT '操作前订单状态',
  `status` char(2) default '' COMMENT '操作后订单状态',
  `note` char(255) NOT NULL COMMENT '操作记录',
  `userid` mediumint(8) unsigned default '0' COMMENT '操作员ID',
  `username` char(20) default NULL COMMENT '操作员用户名',
  `ip` char(15) NOT NULL COMMENT '操作IP',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '记录时间',
  PRIMARY KEY  (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单操作日志记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_page`
--

CREATE TABLE IF NOT EXISTS `fangfa_page` (
  `pageid` smallint(5) NOT NULL auto_increment COMMENT '主键ID',
  `catid` smallint(4) unsigned default NULL COMMENT '所属栏目',
  `user_id` int(11) NOT NULL COMMENT '内容管理者ID',
  `username` varchar(50) NOT NULL COMMENT '内容发布者用户名',
  `content` mediumtext COMMENT '单页详细内容',
  `create_time` int(11) default NULL COMMENT '创建时间',
  `update_time` int(10) unsigned default NULL COMMENT '更新时间',
  PRIMARY KEY  (`pageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='单页面表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fangfa_page`
--

INSERT INTO `fangfa_page` (`pageid`, `catid`, `user_id`, `username`, `content`, `create_time`, `update_time`) VALUES
(1, 2, 999999, 'developer', '<p>&nbsp;四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有 员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。 近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。 公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展” 的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业 自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！</p><p>公司重点项目介绍：</p><p>公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。</p><p>公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。</p><p>公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。<br/></p><p>公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。<br/></p><p>&nbsp;</p><p><br/></p>', 1427094678, 1427362900),
(2, 3, 1, 'admin', '<p><br/>&nbsp; &nbsp; 一年峥嵘岁月，事业初成。北新一役首捷，青神风景凭添。依智慧左右逢源，据义利纵横驰骋。一年来，我们以‘团结、拼搏、务实、高效’为企业宗旨，以‘创办一流企业，开发一流产品’为企业目标，以 ‘爱司如爱家、肝胆相照、荣辱与共、奋力拼搏、共创辉煌’为企业精神。从公司成立到项目立项，再到如期开工，如期售房。仅仅一年时间，速度惊人，初战告捷。<br/>&nbsp;&nbsp;&nbsp; 一年来，我们公司从最初只有几个人发展到现在有12个部门，七十多名员工，规模不断扩大，员工队伍日益壮大。全体员工同心同德、勤奋努力，公司得以稳步发展，蒸蒸日上。<br/>&nbsp;&nbsp;&nbsp;&nbsp;公司的发展离不开人才，好的公司，有发展潜力的公司，也能孕育出更多的人才，给人才的成长创造条件和机遇。北新大弘从万千人中发现了适合我公司发展的人才，把大家聚到了一起，大家也在各自的岗位上实现着自我价值，坚守自己的职责，与北新大弘一起求奋进，求发展，共创美好明天！ 一年时间，沧海也可变桑田。好些年轻人进公司时还是初入职场不久的愣头青，现在已经是部门副经理了，成为能独挡一面的工作能手。一年时间，能够带给人很大的进步和变化，只要我们有一颗善于学习和进取的心。<br/>&nbsp;&nbsp;&nbsp;&nbsp;公司的发展凝聚了我们北新大弘所有员工的心血和汗水。为了保证施工如期按质完成，不管严寒酷暑，风吹雨打，你们都把工作放在第一位。对于北新大弘来说，我们积累下来的最大财富不是我们在行业的美誉度，不是销售额，也不是拥有强大的资金，而是我们拥有了一支能共同面对困难和挑战，不断进取、不断成长、不断创新的团队，还有就是我们的合作伙伴对我们的高度信任和支持，所有的这一切，都来源于全体员工的共同努力。我发自内心地感谢大家，正是有你们的全心全意、任劳任怨、积极进取、兢兢业业、艰苦奋斗，公司才能取得今天的成就！<br/>&nbsp;&nbsp;&nbsp;&nbsp;按照公司近几年的战略规划，过去的一年是难忘而精彩的，而在未来的日子里我们必将迎来更多的精彩和挑战。把北新大弘打造成‘集团化企业’是我们的战略目标。这一目标是宏伟的，他的实现将需要我们全体同仁的共同努力。<br/>&nbsp;&nbsp;&nbsp;&nbsp;太阳已经升起，天空一片明亮。万马奔腾，心归一处。这是精诚团结的力量，这是一心一意的共鸣，这就是我们北新大弘的今天！<br/>&nbsp;&nbsp;&nbsp;&nbsp;祝愿大家在北新大弘的每一天都幸福、快乐！祝愿每一个人在北新大弘都能有最大的进步和成长！</p><p>&nbsp;</p>', 1427095048, 1427270278),
(3, 4, 1, 'admin', '<p><img src="/public/uploads/ueditor/images/20150325/1427270313866529.png" title="1427270313866529.png" alt="1.png"/></p><p>&nbsp;</p>', 1427095054, 1427270424),
(8, 18, 1, 'admin', '<p style="text-indent: 2em;">北新国际机械城作为中国汽摩机械、重工机械、电气机械、机电机械、石油机械商贸基地，综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，形成产地市场、销地市场、消费市场首个大型商贸物流平台。</p><p style="text-indent: 2em;">项目位于成都第二绕城高速以北的广汉市，北新开发区成绵高速广汉北出口处，紧邻108大件路和北京大道，项目总占地460逾亩，总建筑面积55万平方米。是承接天府新区、连接成德绵经济带、融入成渝经济区的重要节点和交通走廊。<br/></p><p style="text-indent: 2em;">北新国际机械城是四川省2013年重点项目，四川省2013年重大产业项目，广汉市2013年度重点服务业项目，广汉市2013年度重点招商引资项目，是成德绵工业制造业的商贸物流重点工程。项目集采购中心、仓储物流中心、B2B电子商务中心、会展中心、政务中心等5大中心于一城，融合批发、物流、仓储、会展、商务、政务、金融等7大功能于一体，成为中国西部乃至全国、全球影响深远的标志性机械商贸集群。作为中国汽摩机械、重工机械、电气机械、机电机械、石油机械商贸基地，北新国际机械城综合国际国内制造商、经销商、采购商、市场等方面实际需求，全面整合成德绵乃至西部机械产业上下游产业链，汇聚世界500强以及全国12万余家中小企业的6万种汽车、汽配、机械、五金机电商品，吸引上万家企业与经营商家进场经营，每天吸引数万人次的客流，成为集销售、会展、租赁、维修、配套、服务于一体的国际化、规模化机械专业市场。</p><p style="text-indent: 2em;">1、快捷交通最大程度节省物流成本</p><p style="text-indent: 2em;">紧邻第二绕城高速、成绵高速进出口，紧邻成绵乐城际客运专线广汉站，北京大道、108国道、宝成铁路北新干线、成青快速通道纵横交错，毗邻青白江集装箱物流发展区，经绕城可直通成乐、成渝、成南、成雅、成灌等高速公路。</p><p style="text-indent: 2em;">2、规模升级，带动市场繁荣</p><p style="text-indent: 2em;">15万平方米汽摩博览采购中心、8万平方米五金机电交易市场、10万平方米重工机械博览中心，上万家商企同场经营“一站式”采购服务。</p><p style="text-indent: 2em;">3、完善配套，保障市场繁荣</p><p style="text-indent: 2em;">具备专业、完善的物流和仓储配套。 高端新品会展中心、高档商务写字楼、星级酒店等先进商业配套设施，为未来国际化商贸模式提供硬件支持，真正与国际接轨。</p><p style="text-indent: 2em;">4、卓越服务，促进市场发展</p><p style="text-indent: 2em;">引进现代物流、商务、研发、金融、咨询、信息、通讯、会展等与市场经营密切相关的服务机构。与职能部门、行业协会和相关机构建立战略合作，安排商家与采购商进行B2B洽谈。</p><p style="text-indent: 2em;">5、强势推广，塑造市场品牌</p><p style="text-indent: 2em;">斥资千万塑造品牌，与国内知名主流媒体建立合作联盟，强强联手，确保市场快速做旺并持续旺场。</p><p style="text-indent: 2em;">6、缔造“365天永不落幕的博览会”</p><p style="text-indent: 2em;">打破传统博览会时间、区域的限制，提供海量、时</p><p><br/></p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p><br/></p>', 1427291841, 1429612125),
(5, 17, 1, 'admin', '<p style="text-indent: 2em;">四川北新达亿投资有限公司是一家专业从事商贸物流项目开发建设及配套基础设施建设、运营及管理的物流企业。公司注册资本为人民币2000万元，现有 员工100多人。公司在商业物流供应链整合、投资开发及运营管理方面拥有专业的人才团队和丰富的运作经验，在川内拥有良好的市场资源和较高的企业知名度。</p><p style="text-indent: 2em;">近年来，在川内已经顺利建成并运营多个大型商贸物流项目，受到国内物流行业瞩目和好评。 公司始终坚持“合作、分享、共赢”的企业理念；坚持“客户至上，诚信经营，规范管理，协调发展” 的经营宗旨；坚持“立存久远，做大做强”的企业愿景；坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业 自身负责的企业使命和社会责任，以物流行业领域的需求为基础，以公司的优质服务水平和自身实力为保障，为中国现代物流的创新发展而不懈努力！<br/></p><p style="text-indent: 2em;">公司重点项目介绍：<br/></p><p style="text-indent: 2em;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。</p><p style="text-indent: 2em;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。</p><p style="text-indent: 2em;">公司在建项目---“北新国际商贸冷链物流城”，是四川省重点建设项目。项目地址位于成绵高速广汉北出口300米处，北京大道左侧。占地 920亩，项目分三期建设。主要建设内容为食品、农产品冷链交易配送区及冷链仓储配套设施、农特产品博览区、B2B电子商务平台、政务金融中心等。 项目是在成都第二绕城高速和成绵高速复线通车；德阳、广汉全面融入成都一体化发展背景下，以成都1000多万人为消费市场，以四川省为主乃至全国丰富优质 的农产品资源为基础，以成都数千家大型超市、单位团购配送为网络依托广汉紧临成都大都市的独特区位优势，高规格打造的以农产品物流配送为主导功能，集农产 品展示交易、电子交易、冷链物流、集疏中转、分选包装、无公害检验检测等多种服务于一体的新型流通业态。 项目通过搭建农产品物流配送平台，为农产品生产加工企业和商贸流通企业服务，汇聚大型龙头企业，形成大产业、大商贸、大物流、大品牌的发展格局，构筑西南 地区理念最先进、功能最健全、服务最完善、优势最突出的全能型农产品物流中心，打造“成都乃至西南地区农产品配送基地”，最终实现服务政府、服务产业、服 务企业、服务农民的“四服务”核心价值。&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p><br/></p><p style="text-indent: 2em;">&nbsp;</p><p><br/></p>', 1427103488, 1429611720),
(6, 22, 1, 'admin', '<p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">核心理念：让想干事的人有机会，能干事的人有舞台，干成事的人有地位有待遇。唯才是举，真才必用。</p><p style="text-indent: 2em;">一是德才兼备原则。选拔和使用人才按照全面衡量，德才兼备的要求，坚持有德无才是庸人，有才无德是小人，德才不可偏废。</p><p style="text-indent: 2em;">二是“效果论”原则。在用才上，我们不看学历看能力，不看文凭看水平，无论是什么身份，什么学历，什么年龄，只要干得好，干得比其他人出色，业绩突出，就大胆启用，委以重任。目前，公司技术人员和中层管理人员平均年龄都在35岁左右，车间主任平均年龄在30岁左右。这些人虽然年龄不大，有的学历也不是很高，但有能力、有干劲、有业绩。我们坚持的“效果论”用人机制，使一大批德才兼备的人才脱颖而出，成为企业发展的栋梁。</p><p style="text-indent: 2em;">三是实践第一的原则。“试玉要烧三日满，辨才须待七年期”。历年来，凡到时风集团工作的各类专业人才，我们都先安排到车间生产一线，让其在实践中锻炼提高，然后通过公开考试，择优选拔。</p><p style="text-indent: 2em;">四是优胜劣汰的原则。在选用人才上，我们实现了由“伯乐相马”向“赛场选马”的转变，谁干得最好，我们就作为人才加以重用；否则，只能被淘汰出局。</p><p style="text-indent: 2em;">五是“人人是人才”的原则。在人才使用上，消除模式化和神秘化，做到因人而宜，量才适用。只要在合适的岗位上发挥出最大程度的才智，就是一定意义的人才。我们按照这个原则，根据每个员工的水平、特长、阅历、性格等，将其安排到相对适宜的岗位上，做到了人尽其才，才尽其能，促进了企业持续、快速、高效发展。&nbsp;</p><p><br/></p><p><br/></p><p style="text-indent: 2em;">&nbsp;</p><p><br/></p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p><br/></p>', 1427176335, 1429612176),
(7, 24, 1, 'admin', '<p style="text-indent: 2em;">1、符合岗位要求者直接到总公司面试，面试地址；成都市高新区天府软件园C区2栋5楼，面试时间：周一至周五 2:00-5:00；</p><p style="text-indent: 2em;">2、在线投递简历“姓名+岗位”命名在线投递，再电话咨询面试事宜，联系电话：028-85063666-827（分机号）；</p><p><br/></p><p style="text-indent: 2em;">&nbsp;<br/></p><p style="white-space: normal; text-indent: 2em;">&nbsp;</p><p><br/></p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p><p style="text-indent: 2em;">&nbsp;</p>', 1427176463, 1429612208);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_press`
--

CREATE TABLE IF NOT EXISTS `fangfa_press` (
  `pid` int(11) NOT NULL auto_increment COMMENT '主键ID',
  `sort` int(11) NOT NULL COMMENT '排序',
  `title` varchar(11) NOT NULL COMMENT '标题',
  `attr` varchar(20) NOT NULL COMMENT '属性',
  `thumb` varchar(45) NOT NULL COMMENT '缩略图',
  `description` varchar(255) NOT NULL COMMENT '简介',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `seotitle` varchar(100) NOT NULL,
  `seokeywords` varchar(200) NOT NULL,
  `seodescription` varchar(200) NOT NULL,
  `url` varchar(45) NOT NULL COMMENT '链接',
  `status` int(11) NOT NULL COMMENT '状态',
  `catid` int(11) NOT NULL COMMENT '栏目编号',
  `up` varchar(200) default NULL COMMENT '封面图片',
  `down` varchar(200) default NULL COMMENT '封底图片',
  `music` varchar(250) default NULL COMMENT '背景音乐',
  `images` text COMMENT '内容图片',
  `brcode` varchar(255) default NULL COMMENT '二维码图片',
  PRIMARY KEY  (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电子杂志主表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_province`
--

CREATE TABLE IF NOT EXISTS `fangfa_province` (
  `id` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `keys` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fangfa_province`
--

INSERT INTO `fangfa_province` (`id`, `name`, `keys`) VALUES
(1, '北京市', 'B'),
(2, '天津市', 'T'),
(3, '上海市', 'S'),
(4, '重庆市', 'C'),
(5, '河北省', 'H'),
(6, '山西省', 'S'),
(7, '台湾省', 'T'),
(8, '辽宁省', 'L'),
(9, '吉林省', 'J'),
(10, '黑龙江省', 'H'),
(11, '江苏省', 'J'),
(12, '浙江省', 'Z'),
(13, '安徽省', 'A'),
(14, '福建省', 'F'),
(15, '江西省', 'J'),
(16, '山东省', 'S'),
(17, '河南省', 'H'),
(18, '湖北省', 'H'),
(19, '湖南省', 'H'),
(20, '广东省', 'G'),
(21, '甘肃省', 'G'),
(22, '四川省', 'S'),
(24, '贵州省', 'G'),
(25, '海南省', 'H'),
(26, '云南省', 'Y'),
(27, '青海省', 'Q'),
(28, '陕西省', 'S'),
(29, '广西壮族自治区', 'G'),
(30, '西藏自治区', 'X'),
(31, '宁夏回族自治区', 'N'),
(32, '新疆维吾尔自治区', 'X'),
(33, '内蒙古自治区', 'N'),
(34, '澳门特别行政区', 'A'),
(35, '香港特别行政区', 'X');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_role`
--

CREATE TABLE IF NOT EXISTS `fangfa_role` (
  `role_id` smallint(4) unsigned NOT NULL auto_increment,
  `modelid` tinyint(4) unsigned NOT NULL default '0' COMMENT '会员模型ID',
  `name` varchar(20) NOT NULL COMMENT '角色名',
  `nickname` varchar(20) NOT NULL COMMENT '角色别名',
  `status` tinyint(1) unsigned default '1' COMMENT '状态',
  `remark` varchar(255) default NULL COMMENT '备注',
  `isadmin` tinyint(1) unsigned default '0' COMMENT '是否为管理员',
  PRIMARY KEY  (`role_id`),
  UNIQUE KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fangfa_role`
--

INSERT INTO `fangfa_role` (`role_id`, `modelid`, `name`, `nickname`, `status`, `remark`, `isadmin`) VALUES
(1, 6, 'administrator', '超级管理员', 1, '超级管理员', 1),
(2, 7, 'member', '普通会员', 1, '普通会员', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_role_user`
--

CREATE TABLE IF NOT EXISTS `fangfa_role_user` (
  `role_id` smallint(4) unsigned NOT NULL COMMENT '角色ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  KEY `role_id_index` (`role_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户-角色关联表';

--
-- 转存表中的数据 `fangfa_role_user`
--

INSERT INTO `fangfa_role_user` (`role_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_salenet`
--

CREATE TABLE IF NOT EXISTS `fangfa_salenet` (
  `sid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '' COMMENT '标题',
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `province` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `scatid` smallint(6) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目ID',
  `type` int(1) NOT NULL default '1' COMMENT '类型（1为国内，2为国外）',
  `content` longtext NOT NULL COMMENT '页面内容',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `update_at` int(11) NOT NULL COMMENT '最近更新时间',
  `status` tinyint(11) NOT NULL default '0' COMMENT '是否通过审核',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `url` char(100) NOT NULL COMMENT '链接',
  `template` varchar(50) default NULL COMMENT '模板名称',
  `sort` tinyint(4) unsigned NOT NULL default '1' COMMENT '排序',
  PRIMARY KEY  (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='营销网络' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_scategory`
--

CREATE TABLE IF NOT EXISTS `fangfa_scategory` (
  `scategoryid` mediumint(9) NOT NULL auto_increment,
  `catid` mediumint(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentid` mediumint(9) NOT NULL default '0',
  `sort` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  `create_time` int(10) NOT NULL,
  `update_time` int(10) default NULL,
  PRIMARY KEY  (`scategoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类的地区表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_session`
--

CREATE TABLE IF NOT EXISTS `fangfa_session` (
  `sid` char(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL COMMENT '过期时间',
  `value` varchar(255) default NULL COMMENT 'SESSION值',
  PRIMARY KEY  (`sid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='session表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_setting`
--

CREATE TABLE IF NOT EXISTS `fangfa_setting` (
  `var` varchar(60) NOT NULL COMMENT '变量名',
  `value` text NOT NULL COMMENT '变量值',
  `key` varchar(20) NOT NULL default 'custom' COMMENT '标识',
  `type` tinyint(1) NOT NULL default '1' COMMENT '参数类型',
  `remark` varchar(50) default NULL COMMENT '备注',
  PRIMARY KEY  (`var`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='参数配置';

--
-- 转存表中的数据 `fangfa_setting`
--

INSERT INTO `fangfa_setting` (`var`, `value`, `key`, `type`, `remark`) VALUES
('url_html_suffix', '.html', 'sysset', 1, 'url后缀'),
('pagesize', '20', 'sysset', 1, '分页中每页记录数'),
('create_html', '', 'sysset', 1, '网站是否生成HTML实体文件'),
('site_title_separator', '-', 'sysset', 1, '网站标题关键字之间的分隔符'),
('siteurl', 'http://www.fangfa.net', 'sysset', 1, '网站URL地址，不包括最后的“/”'),
('seotitle', '北新达亿投资', 'sysset', 1, '网站seotitle'),
('seokeywords', '北新达亿投资', 'sysset', 1, '网站seokeywords'),
('seodescription', '北新达亿投资', 'sysset', 1, '网站seodescription'),
('copyright', 'Copyright © 2015 四川北新达亿投资有限公司', 'sysset', 1, '版权信息'),
('icpno', '蜀ICP备09052756号-1', 'sysset', 1, '备案号'),
('companyname', '-四川北新达亿投资有限公司2', 'sysset', 1, '公司名称'),
('companylinkman', '-', 'sysset', 1, '公司联系人'),
('companytel', '028-13465456', 'sysset', 1, '联系电话'),
('companyfax', '-', 'sysset', 1, '传真'),
('companyemail', '028-', 'sysset', 1, '公司邮箱'),
('companyaddress', '- 四川北新达亿投资有限公司1', 'sysset', 1, '公司地址'),
('mail_type', '1', 'sysset', 1, '系统发送邮件的方式：1=SMTP，2=通过mail函数发送，3=通过SOCKET连接SMTP服务器发'),
('mail_server', 'smtp.qq.com', 'sysset', 1, 'SMTP服务器地址'),
('mail_port', '25', 'sysset', 1, 'SMTP服务器服务端口'),
('mail_user', 'admin', 'sysset', 1, '使用SMTP服务发送邮件时的用户名'),
('mail_password', 'admin666', 'sysset', 1, '使用SMTP服务发送邮件时的密码'),
('upload_attachment_allowext', 'doc|docx|xls|ppt|wps|zip|rar|txt', 'sysset', 1, '允许上传的附件类型'),
('upload_maxsize', '1024', 'sysset', 1, '默认允许上传的文件大小'),
('upload_images_allowext', 'jpg|jpeg|gif|bmp|png', 'sysset', 1, '允许的上传的图片类型'),
('upload_dir', 'public/uploads/', 'sysset', 1, '文件或者图片上传路径'),
('upload_url', 'uploads/', 'sysset', 1, '文件或者图片上传目录'),
('upload_thumb_isthumb', '0', 'sysset', 1, '是否生成缩略图'),
('upload_thumb_width', '150', 'sysset', 1, '全局缩略图宽度'),
('upload_thumb_height', '150', 'sysset', 1, '全局缩略图高度'),
('upload_water_iswatermark', '0', 'sysset', 1, '上传的图片是否加水印'),
('watermark_minwidth', '100', 'sysset', 1, '添加水印的图片最小宽度'),
('watermark_minheight', '100', 'sysset', 1, '添加水印的图片最小高度'),
('upload_water_path', 'images/watermark.png', 'sysset', 1, '水印图片的路径'),
('upload_water_trans', '50', 'sysset', 1, '水印图片透明度'),
('watermark_quality', '90', 'sysset', 1, '水印图片质量'),
('upload_water_place', '9', 'sysset', 1, '水印添加位置'),
('upload_file_rule', 'times', 'sysset', 1, '文件名生成规则、对编辑器不起作用'),
('editor_type', 'ueditor', 'sysset', 1, '编辑器类型'),
('auto_ping', '0', 'sysset', 1, '是否发布内容后自动ping'),
('ping_sites', 'http://blogsearch.google.com/ping/RPC2', 'sysset', 1, 'Ping地址'),
('filter_word', '去死|贱人|我操|我日|反党|反共|共产党|法轮功|强奸|黑社会|疆独|藏独|K粉|冰毒|枪支|共铲党', 'sysset', 1, '敏感词，使用“|”隔开'),
('user_open_register', '0', 'user', 1, '是否开放用户注册'),
('user_default_role_id', '2', 'user', 1, '前台用户注册的默认角色ID'),
('user_need_active', '0', 'user', 1, '前台注册用户是否需要激活'),
('user_passport_on', '0', 'user', 1, '是否开启UC同步'),
('user_auth_cookie_key', '', 'user', 1, '解密用户端cookie使用的密钥'),
('is_brcode', '1', 'sysset', 1, '启用二维码功能'),
('brcode_size', '4', 'sysset', 1, '二维码图片大小'),
('is_cut', '0', 'sysset', 1, '启用图片裁剪功能'),
('cut_size', '475', 'sysset', 1, '图片裁剪缩放比例'),
('is_comment', '0', 'sysset', 1, '启用评论功能');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_tag`
--

CREATE TABLE IF NOT EXISTS `fangfa_tag` (
  `tagid` int(11) NOT NULL auto_increment COMMENT 'tagID',
  `name` varchar(10) NOT NULL COMMENT 'tag值',
  `count` tinyint(4) NOT NULL default '0' COMMENT '使用统计',
  `hits` int(11) NOT NULL default '0' COMMENT 'tag点击量',
  PRIMARY KEY  (`tagid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tag表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_template`
--

CREATE TABLE IF NOT EXISTS `fangfa_template` (
  `path` char(50) NOT NULL COMMENT '相对主题的路径',
  `name` char(20) default NULL COMMENT '模板名称',
  `note` char(200) default NULL COMMENT '模板说明',
  PRIMARY KEY  (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模板表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_user`
--

CREATE TABLE IF NOT EXISTS `fangfa_user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `nickname` varchar(50) default NULL COMMENT '昵称',
  `remark` varchar(255) default NULL COMMENT '备注',
  `status` tinyint(1) default '1' COMMENT '状态',
  `verify` varchar(32) default NULL COMMENT '验证串',
  `isadmin` tinyint(1) unsigned default '0' COMMENT '是否为管理员',
  `last_login_time` int(11) unsigned default '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) default NULL COMMENT '最后登录ip',
  `login_count` mediumint(8) unsigned default '0' COMMENT '登录统计',
  `create_time` int(11) unsigned NOT NULL COMMENT '记录创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_index` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fangfa_user`
--

INSERT INTO `fangfa_user` (`user_id`, `username`, `password`, `email`, `nickname`, `remark`, `status`, `verify`, `isadmin`, `last_login_time`, `last_login_ip`, `login_count`, `create_time`, `update_time`) VALUES
(1, 'admin', '7fef6171469e80d32c0559f88b377245', 'aaa@qq.com', '超级管理员', NULL, 1, NULL, 1, 1429757371, '171.221.175.80', 13, 1427087654, 1427087654);

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_user_manager`
--

CREATE TABLE IF NOT EXISTS `fangfa_user_manager` (
  `user_id` int(10) NOT NULL default '0' COMMENT '用户ID',
  `realname` varchar(255) NOT NULL default '' COMMENT '真实姓名',
  `sex` char(10) default '1' COMMENT '性别',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户模型扩展表之一';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_user_person`
--

CREATE TABLE IF NOT EXISTS `fangfa_user_person` (
  `user_id` int(10) NOT NULL default '0' COMMENT '用户ID',
  `realname` varchar(255) NOT NULL default '' COMMENT '真实姓名',
  `sex` char(10) default '1' COMMENT '性别',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户模型扩展表之一';

--
-- 转存表中的数据 `fangfa_user_person`
--

INSERT INTO `fangfa_user_person` (`user_id`, `realname`, `sex`) VALUES
(1, '', '1');

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_vote_data`
--

CREATE TABLE IF NOT EXISTS `fangfa_vote_data` (
  `user_id` mediumint(8) unsigned default '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL default '0',
  `time` int(10) unsigned NOT NULL default '0' COMMENT '投票时间',
  `ip` char(15) NOT NULL COMMENT '投票ip',
  `data` text NOT NULL COMMENT '投票值',
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`user_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票数据表';

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_vote_option`
--

CREATE TABLE IF NOT EXISTS `fangfa_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL auto_increment,
  `subjectid` mediumint(8) unsigned NOT NULL default '0',
  `option` varchar(255) NOT NULL COMMENT '选项值',
  `image` varchar(100) NOT NULL COMMENT '选项附加图',
  `sort` tinyint(2) unsigned NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY  (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票选项表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_vote_subject`
--

CREATE TABLE IF NOT EXISTS `fangfa_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL auto_increment,
  `catid` mediumint(9) NOT NULL,
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL default '0' COMMENT '0投票，1问卷',
  `ischeckbox` tinyint(1) unsigned NOT NULL default '0' COMMENT '0单选 1多选',
  `credit` smallint(5) unsigned NOT NULL default '0' COMMENT '会员奖励分数',
  `create_time` int(10) unsigned NOT NULL default '0',
  `update_time` int(10) NOT NULL,
  `fromdate` date NOT NULL default '0000-00-00',
  `todate` date NOT NULL default '0000-00-00',
  `interval` int(10) unsigned NOT NULL default '0' COMMENT '投票时间间隔',
  `status` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否显示',
  `parentid` mediumint(8) unsigned NOT NULL default '0',
  `description` text NOT NULL COMMENT '描述',
  `sort` smallint(5) unsigned NOT NULL default '0' COMMENT '排序',
  `enablecheckcode` tinyint(1) unsigned NOT NULL default '0' COMMENT '否是启用验证码',
  `allowguest` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否允许游客投票',
  `groupidsvote` char(100) NOT NULL COMMENT '允许投票的用户组',
  `groupidsview` char(100) NOT NULL COMMENT '允许查看结果的用户组',
  `maxval` tinyint(2) unsigned NOT NULL default '0' COMMENT '多选最多选择',
  `minval` tinyint(1) unsigned NOT NULL default '1' COMMENT '多选最少选择',
  `userid` mediumint(8) unsigned NOT NULL default '0' COMMENT '创建人ID',
  `allowview` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否允许查看结果',
  `optionnumber` tinyint(3) unsigned NOT NULL default '0' COMMENT '选项数量',
  `votenumber` mediumint(8) unsigned NOT NULL default '0' COMMENT '总投票数',
  PRIMARY KEY  (`subjectid`),
  KEY `enabled` (`status`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投票标题表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fangfa_widget`
--

CREATE TABLE IF NOT EXISTS `fangfa_widget` (
  `wid` tinyint(4) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL COMMENT '挂件名称',
  `appname` varchar(20) NOT NULL COMMENT '挂件所属应用',
  `controller` varchar(30) NOT NULL COMMENT '挂件所属控制器',
  `action` varchar(20) NOT NULL COMMENT '挂件应用的动作',
  `block` varchar(100) default NULL COMMENT '要显示的区块',
  `status` enum('0','1') NOT NULL default '0' COMMENT '1=启用、0=禁用',
  `sort` smallint(4) NOT NULL default '1' COMMENT '排序',
  PRIMARY KEY  (`wid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='挂件列表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fangfa_widget`
--

INSERT INTO `fangfa_widget` (`wid`, `name`, `appname`, `controller`, `action`, `block`, `status`, `sort`) VALUES
(1, '基本信息', 'admin', 'fset', 'set', 'system', '1', 1),
(2, '网站设置', 'admin', 'fset', 'set', 'website', '1', 2),
(3, '邮件设置', 'admin', 'fset', 'set', 'mail', '1', 3),
(4, '附件设置', 'admin', 'fset', 'set', 'attachment', '1', 4),
(5, 'FTP设置', 'admin', 'fset', 'set', 'ftp', '1', 5),
(6, '撰写设置', 'admin', 'fset', 'set', 'write', '1', 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
