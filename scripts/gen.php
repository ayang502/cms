<?php
require_once __DIR__ . "/../init.php";
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
asort($arr);
foreach ($arr as $nodeid=>$num) {
    if ($num > 500 && $num <= 1000) {
        $tmp1[] = $nodeid;
    } else if ($num <= 500) {
        $tmp2[] = $nodeid;
    } else {
        echo "php syncContent.php {$nodeid} &\n";
    }
}
if (!empty($tmp1)) {
    $ttt = array_chunk($tmp1, 10);
    foreach ($ttt as $v) {
        echo "php syncContent.php ".join(',', $v)." &\n";
    }
}
if (!empty($tmp2)) {
    $ttt = array_chunk($tmp2, 10);
    foreach ($ttt as $v) {
        echo "php syncContent.php ".join(',', $v)." &\n";
    }
}
