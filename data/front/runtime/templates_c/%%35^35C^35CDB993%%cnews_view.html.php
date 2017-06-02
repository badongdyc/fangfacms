<?php /* Smarty version 2.6.26, created on 2017-06-02 18:47:36
         compiled from content/cnews_view.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'content/cnews_view.html', 8, false),array('function', 'ffposition', 'content/cnews_view.html', 16, false),array('modifier', 'date_format', 'content/cnews_view.html', 21, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/header.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div class="announce-box">
          <div class="announce-img"><img src="__PUBLIC__/temp/contact.jpg" alt=""/></div>
		  <div class="announce wrapper">
		      <div class="banner-title"><h1>NEWS</h1><h3><?php echo $this->_tpl_vars['cat']['name']; ?>
</h3></div>
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
			  <div class="new-detail">
			         <div class="details-title">
			           <h4><?php echo $this->_tpl_vars['data']['title']; ?>
</h4>
					   <span>发布时间：<?php echo ((is_array($_tmp=$this->_tpl_vars['data']['update_time'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y-%m-%d") : smarty_modifier_date_format($_tmp, "%Y-%m-%d")); ?>

                        &nbsp;&nbsp;来源：<?php if ($this->_tpl_vars['data']['source']): ?><?php echo $this->_tpl_vars['data']['source']; ?>
<?php else: ?>本站<?php endif; ?>&nbsp;&nbsp;网址：<a href="<?php echo $this->_tpl_vars['data']['wangzhi']; ?>
" style="color: blue;" target="_blank"><?php echo $this->_tpl_vars['data']['wangzhi']; ?>
</a>
                       </span>

                     </div>
					 <div class="detais-text" style="border-bottom:1px solid #f0f2f4;">
					      <p> <?php echo $this->_tpl_vars['data']['content']; ?>
</p>
						  
					 </div>
			   </div>
			   <div class="nextPage clearfix">
			         <div class="nextLefe">
                         <div class="first-page">
                             <?php if ($this->_tpl_vars['data']['pre_title'] != '没有了'): ?>
                             <span>上一篇：</span><a href="<?php echo $this->_tpl_vars['data']['pre_url']; ?>
"><?php echo $this->_tpl_vars['data']['pre_title']; ?>
</a>
                             <?php endif; ?>
                         </div>
					       <div class="first-page">
					       	 <?php if ($this->_tpl_vars['data']['next_title'] != '没有了'): ?>
						       <span>下一篇：</span><a href="<?php echo $this->_tpl_vars['data']['next_url']; ?>
"><?php echo $this->_tpl_vars['data']['next_title']; ?>
</a>
						           <?php endif; ?>
						   </div>

					 </div>
					 <a href="javascript:history.go(-1);" class="back">返回</a>
			   </div>
		  </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "system/footer.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>