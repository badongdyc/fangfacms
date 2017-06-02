<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:53
         compiled from content/promodel_list.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffposition', 'content/promodel_list.html', 14, false),array('function', 'ffcategory', 'content/promodel_list.html', 20, false),array('function', 'ffpagelist', 'content/promodel_list.html', 29, false),array('modifier', 'truncate', 'content/promodel_list.html', 33, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<style>
a{color:#888;}
li:hover a{color:#fff;}
</style>

<!--走进达亿 开始-->
<div class="into-box">
   <div class="conbackground"><img src="__PUBLIC__/images/project_view.jpg" alt=""/></div>
    <div class="into wrapper">
	   <div class="contile1">
	      <div class="banner-title"><h1>PROJECT</h1><h3>项目展示 </h3></div>
			 <div class="position">
				   <span>当前位置 :</span><a href="__ROOT__">首页 /</a><a href="__ROOT/pshow"> 项目展示 /</a><?php echo smarty_function_ffposition(array('a_class' => 'now'), $this);?>

			 </div>
		</div>
		<div class="content-box project">
		    <div class="conNaw">
			     <ul>
			     <?php echo smarty_function_ffcategory(array('catid' => $this->_tpl_vars['cat']['parentid'],'to' => 'd'), $this);?>

			     <?php $_from = $this->_tpl_vars['d']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
				      <li <?php if ($this->_tpl_vars['cat']['catid'] == $this->_tpl_vars['i']['catid']): ?>class="current" <?php endif; ?>><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo $this->_tpl_vars['i']['name']; ?>
</a></li>
				     <?php endforeach; endif; unset($_from); ?>
					  
				 </ul>
			</div>
			<div class="item">
			   <ul class="clearfix item-list">
			   <?php echo smarty_function_ffpagelist(array('pagesize' => 6,'order' => "sort asc,update_time desc",'to' => 'dt'), $this);?>

			   <?php $_from = $this->_tpl_vars['dt']['info']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
			       <li>
				        <div class="item-img"><a href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><img src="<?php echo $this->_tpl_vars['i']['thumb']; ?>
" alt="<?php echo $this->_tpl_vars['i']['title']; ?>
"/></a></div>
						<a class="titile" href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['title'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '15', "") : smarty_modifier_truncate($_tmp, '15', "")); ?>
</a>
						<span class="text"><?php echo ((is_array($_tmp=$this->_tpl_vars['i']['description'])) ? $this->_run_mod_handler('truncate', true, $_tmp, '40', "…") : smarty_modifier_truncate($_tmp, '40', "…")); ?>
</span>
					    <a class="check-detail" href="<?php echo $this->_tpl_vars['i']['url']; ?>
"><span class="fl">查看详情</span><b class="details fr">&gt;</b></a>
				   </li>
				   <?php endforeach; endif; unset($_from); ?>
				  
			   </ul>
			<?php echo $this->_tpl_vars['dt']['pages']; ?>

			</div>
		</div>
	</div>
</div>
<script src="__PUBLIC__/js/jquery.nicescroll.min.js"></script>
    <script>
        $(document).ready(
                function() {
                    $(".content-box .into-text .slide").niceScroll({cursorcolor:"#f3d599"});
                }
        );
    </script>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>