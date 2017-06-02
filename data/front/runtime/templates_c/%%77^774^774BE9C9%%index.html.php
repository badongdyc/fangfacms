<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:49
         compiled from index.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffad', 'index.html', 8, false),array('function', 'fflist', 'index.html', 23, false),array('function', 'ffcategory', 'index.html', 57, false),array('modifier', 'truncate', 'index.html', 37, false),array('modifier', 'date_format', 'index.html', 48, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<!--header-box 结束-->
<!--banner 开始-->
 <div class="banner" id="banner" >
	<!-- <a href="#" class="d1"><img src="__PUBLIC__/temp/banner1.jpg" alt=""/></a>
	<a href="#" class="d1"><img src="__PUBLIC__/temp/banner2.jpg" alt=""/></a>
	<a href="#" class="d1"><img src="__PUBLIC__/temp/banner3.jpg" alt=""/></a> -->
	<?php echo smarty_function_ffad(array('aid' => 1), $this);?>

	<div class="d2" id="banner_id">
		<ul class="clearfix">
		     <li class="nuw"></li>
			 <li></li>
			 <li></li>
		</ul>
	</div>
</div>
<!--banner 结束-->
<!--项目展示 开始-->
<div class="project-box">
     <div class="project wrapper clearfix">
	        <div class="project-show fl">
			       <a href="__ROOT__/pshow" class="show"></a>
			       <?php echo smarty_function_fflist(array('catid' => 13,'pagesize' => 1,'order' => "sort asc,update_time desc",'to' => 'd'), $this);?>

			      
				  <div class="show-img"><img src="<?php echo $this->_tpl_vars['d']['0']['thumb']; ?>
" alt="<?php echo $this->_tpl_vars['d']['0']['title']; ?>
"/></div>
				  <a class="check-detail" href="<?php echo $this->_tpl_vars['d']['0']['url']; ?>
"><span class="fl">查看详情</span><b class="details fr">&gt;</b></a>
			</div>
			<div class="company-news fl">
			    <a class="check-detail" href="__ROOT__/information"> <b class="details fl">+</b><span class="fr">公司新闻</span></a>
				<?php echo smarty_function_fflist(array('catid' => 8,'order' => "sort asc,update_time desc",'attr' => 'top','pagesize' => 1,'to' => 'd'), $this);?>

				<style>
                    .news-text a:hover h3{color:#b0251e; }
				</style>
				<div class="news">
				    <div class="news-img fl"><a href="<?php echo $this->_tpl_vars['d']['0']['url']; ?>
"><img src="<?php echo $this->_tpl_vars['d']['0']['thumb']; ?>
" alt="<?php echo $this->_tpl_vars['d']['0']['title']; ?>
"/></a></div>
					<div class="news-text fr">
					     <a href="<?php echo $this->_tpl_vars['d']['0']['url']; ?>
"><h3><?php echo ((is_array($_tmp=$this->_tpl_vars['d']['0']['title'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '20', "…") : smarty_modifier_truncate($_tmp, '20', "…")); ?>
</h3></a>
						 <span style="word-break:break-all;"><?php echo ((is_array($_tmp=$this->_tpl_vars['d']['0']['description'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '36', "…") : smarty_modifier_truncate($_tmp, '36', "…")); ?>
</span>
					</div>
				</div>
			<style>
                .new-list a:hover span{color:#b0251e;}
			</style>
			    <ul class="new-list">
			    <?php echo smarty_function_fflist(array('catid' => 8,'order' => "sort asc,update_time desc",'attr' => 'top','pagesize' => 5,'to' => 'd'), $this);?>

				<?php $_from = $this->_tpl_vars['d']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['i']):
?>
				<?php if ($this->_tpl_vars['k'] != 0): ?>
				     <li><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><span><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['title'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '20', "…") : smarty_modifier_truncate($_tmp, '20', "…")); ?>
</span><b><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['update_time'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y-%m-%d") : smarty_modifier_date_format($_tmp, "%Y-%m-%d")); ?>
</b></a></li>
				 <?php endif; ?>
				 <?php endforeach; endif; unset($_from); ?> 
					
				</ul>
			</div>
			<div class="cooperate fr">
			    <h3>商务合作 | cooperation</h3>
				<ul class="cooper-list">
				<?php echo smarty_function_ffcategory(array('catid' => 16,'to' => 'tfd'), $this);?>

				<?php $_from = $this->_tpl_vars['tfd']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ii']):
?>
				     <li><a href="<?php echo $this->_tpl_vars['ii']['url']; ?>
"><?php echo $this->_tpl_vars['ii']['name']; ?>
</a></li>
				    <?php endforeach; endif; unset($_from); ?>
					
				</ul>
			</div>
	 </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>