<?php
// +----------------------------------------------------------------------
// | FangFa Net [ http://www.fangfa.net ]
// +----------------------------------------------------------------------
// | File: alias.php
// +----------------------------------------------------------------------
// | Date: 2010-5-6
// +----------------------------------------------------------------------
// | Author: fangfa <1364119331@qq.com>
// +----------------------------------------------------------------------
// | 文件描述: 定制项目需要加载的文件
// +----------------------------------------------------------------------



// 别名定义、此类文件可以实现自动加载，不需要手动导入
alias_import(array(
    'Model'         =>   THINK_PATH.'Lib/Think/Core/Model.class.php',
    'Db'                   =>   THINK_PATH.'Lib/Think/Db/Db.class.php',
    'Cache'              =>    THINK_PATH.'Lib/Think/Util/Cache.class.php',
    'Debug'              =>    THINK_PATH.'Lib/Think/Util/Debug.class.php',
    'ViewModel'          =>    THINK_PATH.'Lib/Think/Core/Model/ViewModel.class.php',
    'AdvModel'          =>    THINK_PATH.'Lib/Think/Core/Model/AdvModel.class.php',
    'RelationModel'     =>    THINK_PATH.'Lib/Think/Core/Model/RelationModel.class.php',
	'Page'				=> THINK_PATH.'Lib/ORG/Util/Page.class.php',	//默认载入分页类
	'Html'				=> INCLUDE_PATH . 'Html.class.php',
    )
);
?>