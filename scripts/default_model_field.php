<?php
return
array (
  0 => 
  array (
    'fieldid' => '1',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'catid',
    'name' => '栏目',
    'tips' => '',
    'css' => '',
    'minlength' => '1',
    'maxlength' => '6',
    'pattern' => '/^[0-9]{1,6}$/',
    'errortips' => '请选择栏目',
    'formtype' => 'catid',
    'setting' => 'array (
  \'defaultvalue\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '-99',
    'unsetroleids' => '-99',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '1',
    'isadd' => '1',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '1',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  1 => 
  array (
    'fieldid' => '2',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'typeid',
    'name' => '类别',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'typeid',
    'setting' => 'array (
  \'minnumber\' => \'\',
  \'defaultvalue\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '1',
    'isadd' => '1',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '2',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  2 => 
  array (
    'fieldid' => '3',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'title',
    'name' => '标题',
    'tips' => '',
    'css' => 'inputtitle',
    'minlength' => '1',
    'maxlength' => '80',
    'pattern' => '',
    'errortips' => '请输入标题',
    'formtype' => 'title',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '1',
    'isadd' => '1',
    'isfulltext' => '1',
    'isposition' => '1',
    'listorder' => '4',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  3 => 
  array (
    'fieldid' => '5',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'keywords',
    'name' => '关键词',
    'tips' => '多关键词之间用空格或者“,”隔开',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '40',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'keyword',
    'setting' => 'array (
  \'size\' => \'100\',
  \'defaultvalue\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '-99',
    'unsetroleids' => '-99',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '1',
    'isadd' => '1',
    'isfulltext' => '1',
    'isposition' => '0',
    'listorder' => '7',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  4 => 
  array (
    'fieldid' => '6',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'description',
    'name' => '摘要',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '255',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'textarea',
    'setting' => 'array (
  \'width\' => \'98\',
  \'height\' => \'46\',
  \'defaultvalue\' => \'\',
  \'enablehtml\' => \'0\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '1',
    'isfulltext' => '1',
    'isposition' => '1',
    'listorder' => '10',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  5 => 
  array (
    'fieldid' => '7',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'updatetime',
    'name' => '更新时间',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'datetime',
    'setting' => 'array (
  \'dateformat\' => \'int\',
  \'format\' => \'Y-m-d H:i:s\',
  \'defaulttype\' => \'1\',
  \'defaultvalue\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '1',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '12',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  6 => 
  array (
    'fieldid' => '8',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'content',
    'name' => '内容',
    'tips' => '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要
<label><input type=\'checkbox\' name=\'auto_thumb\' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片
</div>',
    'css' => '',
    'minlength' => '1',
    'maxlength' => '999999',
    'pattern' => '',
    'errortips' => '内容不能为空',
    'formtype' => 'editor',
    'setting' => 'array (
  \'toolbar\' => \'full\',
  \'defaultvalue\' => \'\',
  \'enablekeylink\' => \'1\',
  \'replacenum\' => \'2\',
  \'link_mode\' => \'0\',
  \'enablesaveimage\' => \'1\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '0',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '1',
    'isfulltext' => '1',
    'isposition' => '0',
    'listorder' => '13',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  7 => 
  array (
    'fieldid' => '11',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'inputtime',
    'name' => '发布时间',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'datetime',
    'setting' => 'array (
  \'fieldtype\' => \'int\',
  \'format\' => \'Y-m-d H:i:s\',
  \'defaulttype\' => \'0\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '0',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '1',
    'listorder' => '17',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  8 => 
  array (
    'fieldid' => '13',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'url',
    'name' => 'URL',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '100',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'text',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '1',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '50',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  9 => 
  array (
    'fieldid' => '14',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'listorder',
    'name' => '排序',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '6',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'number',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '1',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '51',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  10 => 
  array (
    'fieldid' => '15',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'status',
    'name' => '状态',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '2',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'box',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '1',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '55',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  11 => 
  array (
    'fieldid' => '16',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'template',
    'name' => '内容页模板',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '30',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'template',
    'setting' => 'array (
  \'size\' => \'\',
  \'defaultvalue\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '-99',
    'unsetroleids' => '-99',
    'iscore' => '0',
    'issystem' => '0',
    'isunique' => '0',
    'isbase' => '0',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '53',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  12 => 
  array (
    'fieldid' => '19',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'relation',
    'name' => '相关文章',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'omnipotent',
    'setting' => 'array (
  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >
<ul class="list-dot" id="relation_text"></ul>
<div>
<input type=\\\'button\\\' value="添加相关" onclick="omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)" class="button" style="width:66px;">
<span class="edit_content">
<input type=\\\'button\\\' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">
</span>
</div>\',
  \'fieldtype\' => \'varchar\',
  \'minnumber\' => \'1\',
)',
    'formattribute' => '',
    'unsetgroupids' => '2,6,4,5,1,17,18,7',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '0',
    'isunique' => '0',
    'isbase' => '0',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '1',
    'isposition' => '0',
    'listorder' => '15',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  14 => 
  array (
    'fieldid' => '80',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'username',
    'name' => '用户名',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '20',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'text',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '1',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '98',
    'disabled' => '0',
    'isomnipotent' => '0',
  ),
  15 => 
  array (
    'fieldid' => '4',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'thumb',
    'name' => '缩略图',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '100',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'image',
    'setting' => 'array (
  \'size\' => \'50\',
  \'defaultvalue\' => \'\',
  \'show_type\' => \'1\',
  \'upload_maxsize\' => \'1024\',
  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',
  \'watermark\' => \'0\',
  \'isselectimage\' => \'1\',
  \'images_width\' => \'\',
  \'images_height\' => \'\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '0',
    'issearch' => '0',
    'isadd' => '1',
    'isfulltext' => '0',
    'isposition' => '1',
    'listorder' => '14',
    'disabled' => '1',
    'isomnipotent' => '0',
  ),
  16 => 
  array (
    'fieldid' => '10',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'pages',
    'name' => '分页方式',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'pages',
    'setting' => '',
    'formattribute' => '',
    'unsetgroupids' => '-99',
    'unsetroleids' => '-99',
    'iscore' => '0',
    'issystem' => '0',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '16',
    'disabled' => '1',
    'isomnipotent' => '0',
  ),
  17 => 
  array (
    'fieldid' => '12',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'posids',
    'name' => '推荐位',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'posid',
    'setting' => 'array (
  \'cols\' => \'4\',
  \'width\' => \'125\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '1',
    'isunique' => '0',
    'isbase' => '1',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '18',
    'disabled' => '1',
    'isomnipotent' => '0',
  ),
  18 => 
  array (
    'fieldid' => '20',
    'modelid' => '1',
    'siteid' => '1',
    'field' => 'allow_comment',
    'name' => '允许评论',
    'tips' => '',
    'css' => '',
    'minlength' => '0',
    'maxlength' => '0',
    'pattern' => '',
    'errortips' => '',
    'formtype' => 'box',
    'setting' => 'array (
  \'options\' => \'允许评论|1
不允许评论|0\',
  \'boxtype\' => \'radio\',
  \'fieldtype\' => \'tinyint\',
  \'minnumber\' => \'1\',
  \'width\' => \'88\',
  \'size\' => \'1\',
  \'defaultvalue\' => \'1\',
  \'outputtype\' => \'1\',
  \'filtertype\' => \'0\',
)',
    'formattribute' => '',
    'unsetgroupids' => '',
    'unsetroleids' => '',
    'iscore' => '0',
    'issystem' => '0',
    'isunique' => '0',
    'isbase' => '0',
    'issearch' => '0',
    'isadd' => '0',
    'isfulltext' => '0',
    'isposition' => '0',
    'listorder' => '54',
    'disabled' => '1',
    'isomnipotent' => '0',
  ),
);
