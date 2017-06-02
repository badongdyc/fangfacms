<?php /* Smarty version 2.6.26, created on 2017-06-02 18:44:49
         compiled from system/footer.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ffcategory', 'system/footer.html', 6, false),array('function', 'fflink', 'system/footer.html', 27, false),array('function', 'ffad', 'system/footer.html', 37, false),array('function', 'ffset', 'system/footer.html', 43, false),)), $this); ?>
<!--项目展示 结束-->
<!---footer-box 开始-->
<div class="footer-box">
      <div class="footer wrapper">
	        <div class="footer-list fl">
	        <?php echo smarty_function_ffcategory(array('catid' => 0,'to' => 'data'), $this);?>

	        	<?php $_from = $this->_tpl_vars['data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>
			    <dl>
				   <dt><?php echo $this->_tpl_vars['i']['name']; ?>
</dt>
				   
				   <dd>
				   <?php echo smarty_function_ffcategory(array('catid' => $this->_tpl_vars['i']['catid'],'to' => 'bt'), $this);?>

				   <?php $_from = $this->_tpl_vars['bt']['child']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tt']):
?>
				   <a href="<?php echo $this->_tpl_vars['tt']['url']; ?>
"><?php echo $this->_tpl_vars['tt']['name']; ?>
</a>
				   <?php endforeach; endif; unset($_from); ?>			       
				   </dd> 
				</dl>
				<?php endforeach; endif; unset($_from); ?>
				
			</div>
			<div class="footer-right fr">
			    <div class="down-list">
				   <div class="select clearfix">
						<div class="show-box fr">
						   <span>集团公司</span>
							  <ul class="text-down">
							  <?php echo smarty_function_fflink(array('pagesize' => 6,'to' => 'ddd','type_id' => 2), $this);?>

						<?php $_from = $this->_tpl_vars['ddd']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['iii']):
?>
						     <li><a href="<?php echo $this->_tpl_vars['iii']['url']; ?>
" target="_blank" style="display:block;color:#033333;"><?php echo $this->_tpl_vars['iii']['name']; ?>
</a></li>
						     <?php endforeach; endif; unset($_from); ?>
							
				             </ul>
						  </div>
					   </div>
			    </div>
				<div class="qr-code clearfix">
				     <span class="weixin"><img src="__PUBLIC__/uploads/<?php echo smarty_function_ffad(array('aid' => 2), $this);?>
" class="eq1" alt=""/></span>
					 <span class="xinlang"><img src="__PUBLIC__/uploads/<?php echo smarty_function_ffad(array('aid' => 3), $this);?>
" class="eq2" alt=""/></span>
				</div>
		   </div>	
	  </div>
	  <div class="footer-botoom wrapper">
	         <div class="copyright fl"><a href="__ROOT__"><?php echo smarty_function_ffset(array('var' => 'copyright'), $this);?>
</a>
			                           <a href="__ROOT__">版权所有</a>
									   <a target="_blank" href="http://www.miibeian.gov.cn"><?php echo smarty_function_ffset(array('var' => 'icpno'), $this);?>
</a>
									   <a target="_blank" href="http://www.fangfa.net">技术支持：方法数码</a>
			 </div>
			 <div class="connection fr">
			        <div class="frideshop">
					     <span>友情链接</span>
						<ul>
						<?php echo smarty_function_fflink(array('pagesize' => 6,'to' => 'ddd','type_id' => 1), $this);?>

						<?php $_from = $this->_tpl_vars['ddd']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['iii']):
?>
						     <li><a href="<?php echo $this->_tpl_vars['iii']['url']; ?>
" target="_blank" style="display:block;color:#033333;"><?php echo $this->_tpl_vars['iii']['name']; ?>
</a></li>
						     <?php endforeach; endif; unset($_from); ?>
						
						</ul>
					</div>
			 </div>
	  </div>
</div>
<!---footer-box 结束-->
</body>
</html>