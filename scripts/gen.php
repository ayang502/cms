<?php
require_once __DIR__ . "/../init.php";
$db = helper::getDB("cmsware");
$sql = 'select distinct(concat(NodeID,",",TableID)) as tmp from cmsware_content_index;';
$res = $db->fetchAll($sql);
echo "#/bin/sh/";
echo "\n";
foreach ($res as $v) {
    $tmp = explode(',', $v['tmp']);
    $NodeID  = $tmp[0];
    $TableID = $tmp[1];
    echo "php syncContent.php {$NodeID} {$TableID} &";
    echo "\n";
}
