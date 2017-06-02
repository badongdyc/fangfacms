<?php /* Smarty version 2.6.26, created on 2017-06-02 18:47:10
         compiled from system/header.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'system/header.html', 43, false),array('modifier', 'in_array', 'system/header.html', 45, false),)), $this); ?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<!-- 防止IE8,7进入怪异模式 -->
    <meta http-equiv="Content-Type" content="IE=Edge" />
    <!-- 设置编码 -->
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="<?php echo $this->_tpl_vars['seo']['seokeywords']; ?>
">
    <meta name="description" content="<?php echo $this->_tpl_vars['seo']['seodescription']; ?>
">
    <!-- External CSS -->
    <link href="__PUBLIC__/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="__PUBLIC__/css/public.css" rel="stylesheet" type="text/css" />
    <link href="__PUBLIC__/css/master.css" rel="stylesheet" type="text/css" />
    <!-- JavaScript -->
    <script src="__PUBLIC__/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="__PUBLIC__/js/common.js"></script>
    <!--[if lt IE 9]>
         <script  src="__PUBLIC__/js/jquery.html5shiv.js" type="text/javascript"></script>
     <![endif]-->
    <!--[if lt IE 7]>
        <script src="__PUBLIC__/js/jquery.fixie6" type="text/javascript" ></script>
    <![endif]-->
    <!--[if lte IE 6]>
        <script type="text/javascript" src="__PUBLIC__/js/jquery.DD_belatedPNG_0.0.8a.js" charset="utf-8"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix("*");
        </script>
    <![endif]-->
<title><?php echo $this->_tpl_vars['seo']['seotitle']; ?>
</title>
</head>

<body>
<!--header-box 开始-->
<div class="header-box">
    <div class="header-bg"><img src="__PUBLIC__/images/header_bg.jpg" alt=""/></div>
      <div class="header wrapper">
	       <div class="logo fl"><a href="http://www.stdyc.com"><img src="__PUBLIC__/images/logo.jpg" alt=""/></a></div>
		   <div class="naw fl">
		       <ul class="clearfix">
			        <li <?php if ($this->_tpl_vars['cat']['catid'] == 0): ?>class="on"<?php endif; ?>><a href="http://www.stdyc.com">首页</a></li>
			        <?php echo smarty_function_ffcategory(array('catid' => 0,'to' => 'data'), $this);?>

			        <?php $_from = $this->_tpl_vars['data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
					<li <?php if (((is_array($_tmp=$this->_tpl_vars['cat']['catid'])) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['i']['childrenidarr_self']) : in_array($_tmp, $this->_tpl_vars['i']['childrenidarr_self']))): ?> class="on" <?php endif; ?>><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
" ><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
					<?php endforeach; endif; unset($_from); ?>
				
			   </ul>
		   </div>
	  </div>
</div>