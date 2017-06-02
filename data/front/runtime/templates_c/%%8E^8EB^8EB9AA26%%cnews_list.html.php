<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:52
         compiled from content/cnews_list.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'content/cnews_list.html', 13, false),array('function', 'ffposition', 'content/cnews_list.html', 21, false),array('function', 'fflist', 'content/cnews_list.html', 25, false),array('function', 'ffpagelist', 'content/cnews_list.html', 40, false),array('modifier', 'truncate', 'content/cnews_list.html', 28, false),array('modifier', 'date_format', 'content/cnews_list.html', 43, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<style>
a{color:#888;}
li:hover a{color:#fff;}
</style>
<!--新闻资讯 开始-->
<div class="announce-box">
          <div class="announce-img"><img src="__PUBLIC__/temp/contact.jpg" alt=""/></div>
		  <div class="announce wrapper">
		      <div class="banner-title"><h1>NEWS</h1><h3>新闻资讯</h3></div>
				<div class="conNaw">
					 <ul>
					 <?php echo smarty_function_ffcategory(array('catid' => $this->_tpl_vars['cat']['parentid'],'to' => 'dat'), $this);?>

					 <?php $_from = $this->_tpl_vars['dat']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
						  <li <?php if ($this->_tpl_vars['cat']['catid'] == $this->_tpl_vars['i']['catid']): ?> class="current" <?php endif; ?>><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
						  <?php endforeach; endif; unset($_from); ?>
						
					 </ul>
				</div>
				<div class="position">
				   <span>当前位置 :</span><a href=__ROOT__">首页 /</a><a href="__ROOT__/information"> 新闻资讯  /</a><?php echo smarty_function_ffposition(array('a_class' => 'last'), $this);?>

			 </div>
			    <div class="news-bg">
				     <div class="new-info">
				     	<?php echo smarty_function_fflist(array('catid' => $this->_tpl_vars['cat']['catid'],'order' => "sort asc,update_time desc",'attr' => 'hot','pagesize' => 1,'to' => 'dd'), $this);?>

				     	<?php if ($this->_tpl_vars['dd']): ?>
					       <div class="new-left fl">
						        <h4><a href="<?php echo $this->_tpl_vars['dd']['0']['url']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['dd']['0']['title'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '20', "") : smarty_modifier_truncate($_tmp, '20', "")); ?>
</a></h4>
								<p><?php echo ((is_array($_tmp=$this->_tpl_vars['dd']['0']['description'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '150', "…") : smarty_modifier_truncate($_tmp, '150', "…")); ?>
</p>
								<a class="check-detail" href="<?php echo $this->_tpl_vars['dd']['0']['url']; ?>
"><span class="fl">查看详情</span><b class="details fr">&gt;</b></a>
						   </div> 
						   <div class="new-img fr">
						      <a href="href="<?php echo $this->_tpl_vars['dd']['0']['url']; ?>
""><img src="<?php echo $this->_tpl_vars['dd']['0']['thumb']; ?>
" alt="<?php echo $this->_tpl_vars['dd']['0']['title']; ?>
"/></a>
						   </div>
						   <?php endif; ?>
					 </div>   
				</div>
				
				<ul class="news-list">
				<?php echo smarty_function_ffpagelist(array('order' => "sort ASC,update_time desc",'pagesize' => 10,'to' => 'd'), $this);?>

				<?php $_from = $this->_tpl_vars['d']['info']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
				     <li>
					     <time><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['update_time'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y.%m.%d") : smarty_modifier_date_format($_tmp, "%Y.%m.%d")); ?>
</time>
						 <div class="newsImg"><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><img src="<?php echo $this->_tpl_vars['i']['thumb']; ?>
" alt="<?php echo $this->_tpl_vars['i']['title']; ?>
"/></a></div>
						  <div class="new-left fr">
						        <h4><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['title'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '30', "") : smarty_modifier_truncate($_tmp, '30', "")); ?>
</a></h4>
								<p><?php echo ((is_array($_tmp=$this->_tpl_vars['dd']['0']['description'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '82', "…") : smarty_modifier_truncate($_tmp, '82', "…")); ?>
</p>
								<a class="check-detail" href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><span class="fl">查看详情</span><b class="details fr">&gt;</b></a>
						   </div> 
					 </li>
				<?php endforeach; endif; unset($_from); ?>
					 
				</ul>
				<?php echo $this->_tpl_vars['d']['pages']; ?>

		  </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>