<?php
return array (
  'Factivity' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => 
        array (
        ),
        'deny' => 
        array (
        ),
      ),
      'lists' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fask' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'add' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fcart' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fcomment' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'show' => 
      array (
        'allow' => 
        array (
          0 => 'administrator',
        ),
        'deny' => 
        array (
        ),
      ),
      'add' => 
      array (
        'allow' => 
        array (
          0 => 'administrator',
        ),
        'deny' => 
        array (
        ),
      ),
      'filter' => 
      array (
        'allow' => 
        array (
          0 => 'administrator',
        ),
        'deny' => 
        array (
        ),
      ),
    ),
  ),
  'Fcontent' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'down' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'count' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Femail' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fguestbook' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'add' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'filter' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Findex' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'verify' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'register' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'login' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'sitemap' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'redirect' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'form' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fjob' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'send' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Forder' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'submit' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'add' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'confirm' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fpage' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fsalenet' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fsearch' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'manage' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fuser' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'home' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'edit' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'forget' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'logout' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fverify' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
  'Fvote' => 
  array (
    'allow' => 'RBAC_HAS_ROLE',
    'actions' => 
    array (
      'index' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'add' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'vote' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'verify' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
      'show' => 
      array (
        'allow' => NULL,
        'deny' => NULL,
      ),
    ),
  ),
);
?>