<?php
require_once __DIR__ . "/../init.php";
$db = helper::getDB("cmsware");
$sql = "select max(IndexID) as cnt from cmsware_content_index";
$res = $db->fetchOne($sql);
$max = $res['cnt'];
for ($i=1;$i<=$max;$i=$i+10000) {
    echo "php syncContent.php $i &\n";
}
