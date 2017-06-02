<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:54
         compiled from page/cshow.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'page/cshow.html', 8, false),array('function', 'ffposition', 'page/cshow.html', 16, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div class="announce-box">
          <div class="announce-img"><img src="__PUBLIC__/temp/contact.jpg" alt="<?php echo $this->_tpl_vars['cat']['name']; ?>
"/></div>
		  <div class="announce wrapper">
		     <div class="banner-title"><h1>COOPERATE</h1><h3>商务合作</h3></div>
				<div class="conNaw">
					 <ul>
						  <?php echo smarty_function_ffcategory(array('catid' => $this->_tpl_vars['cat']['parentid'],'to' => 'dd'), $this);?>

					 <?php $_from = $this->_tpl_vars['dd']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
						  <li  <?php if ($this->_tpl_vars['cat']['catid'] == $this->_tpl_vars['i']['catid']): ?> class="current" <?php endif; ?>><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
						  <?php endforeach; endif; unset($_from); ?>
						  
					 </ul>
				</div>
				<div class="position">
				     <span>当前位置 :</span><a href="__ROOT__">首页 /</a><a href="__ROOT__/cooperation"> 商务合作 /</a><?php echo smarty_function_ffposition(array('a_class' => 'last'), $this);?>

				   </div>
                 <div class="cooperate-text">
				     <p><?php echo $this->_tpl_vars['data']['content']; ?>
</p>
				 </div>
		  </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>