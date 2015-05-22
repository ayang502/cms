<?php
$pc_hash = "htUyeW";
define('CMSURL', 'http://mingfu.phpcms.cn/');
define ('USERNAME', 'root');
define ('PASSWD', '123123');
define ('TABLE', 'cms');
define ('COOKIE_JAR', "/tmp/cookie.jar");


define ('LOGINURL', CMSURL . 'index.php?m=admin&c=index&a=login&pc_hash='.$pc_hash);
define ('ADDSITEURL', CMSURL . '?m=admin&c=site&a=add');
define ('EDITSITEURL', CMSURL . '?m=admin&c=site&a=edit');
define ('ADDMODULEURL', CMSURL . '?m=content&c=sitemodel&a=add&pc_hash='.$pc_hash);
