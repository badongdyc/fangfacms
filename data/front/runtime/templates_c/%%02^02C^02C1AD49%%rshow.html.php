<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:55
         compiled from page/rshow.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'page/rshow.html', 10, false),array('function', 'ffposition', 'page/rshow.html', 18, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<!--新闻资讯 开始-->
<div class="announce-box">
          <div class="announce-img"><img src="__PUBLIC__/temp/contact.jpg" alt=""/></div>
		  <div class="announce recruite wrapper">
		      <div class="banner-title"><h1>RECRUIT</h1><h3>人力资源</h3></div>
				<div class="conNaw">
					 <ul>
					 <?php echo smarty_function_ffcategory(array('catid' => $this->_tpl_vars['cat']['parentid'],'to' => 'dd'), $this);?>

					 <?php $_from = $this->_tpl_vars['dd']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
					  <li <?php if ($this->_tpl_vars['cat']['catid'] == $this->_tpl_vars['i']['catid']): ?> class="current" <?php endif; ?>><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
					 <?php endforeach; endif; unset($_from); ?>
					 </ul>
				</div>
				<div class="position">
				   <span>当前位置 :</span><a href="__ROOT__">首页 /</a><a href="__ROOT__/rlzy"> 人力资源 /</a>
				   <?php echo smarty_function_ffposition(array('a_class' => 'last'), $this);?>

			 </div>
			 	<div class="into-text">
				   <div class="slide">
		<?php echo $this->_tpl_vars['data']['content']; ?>

					 
				  </div>
				</div>
		  </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>