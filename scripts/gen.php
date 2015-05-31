<?php
require_once __DIR__ . "/../init.php";
$define_max = 1500;
$db = helper::getDB("cmsware");
$sql = "select NodeID from cmsware_site where ParentID = 0";
$res = $db->fetchAll($sql);
foreach ($res as $v) {
    $p[] = $v['NodeID'];
}
$p[] = 0;
$sql = 'select distinct(NodeID) as tmp from cmsware_content_index;';
$res = $db->fetchAll($sql);
echo "#/bin/sh/";
echo "\n";
foreach ($res as $v) {
    if (in_array($v['tmp'], $p)) {
        continue;   
    }
    $nodeid = $v['tmp'];
    $sql = "select count(*) as num from cmsware_content_index where NodeID={$nodeid}";
    $tmp = $db->fetchOne($sql);
    $arr[$v['tmp']] = $tmp['num'];
}
print_r($arr);
asort($arr);
foreach ($arr as $nodeid=>$num) {
    if ($num < 1000) {
        $tmp[] = $nodeid;
    } else {
        echo "php syncContent.php {$nodeid} &\n";
    }
}
if (!empty($tmp)) {
    echo "php syncContent.php ".join(',', $tmp)." &\n";
}
