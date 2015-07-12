<?php
require_once __DIR__ . "/../init.php";
class syncPHPcms extends phpcms {
    public function __construct($indexid) {
        $this->indexid = $indexid;
    }

    public function syncContent() {
        $start = time();
        $id = $this->indexid;
        $wdb = helper::getDB('cmsware');
        $cdb = helper::getDB('phpcms');
        $sql = "select IndexID from cmsware_content_index where IndexID >= {$this->indexid} order by IndexID asc limit 10000"; 
        $res = $wdb->fetchAll($sql);
        foreach ($res as $k=>$v) {
            $id = $v['IndexID'];
            error_log($id."\n", 3, "process{$this->indexid}.log");
            $url = sprintf(ADDCONENTURL, $id);
            $res = curl_post($url, array());
            $tmp = json_decode($res, true);            
            if (!isset($tmp['status']) || $tmp['status'] != 1) {
                error_log($id . "\t" .  strip_tags($res) . "\n", 3, "fail_content.log");
            }
        }
        $end = time();
        error_log(($end-$start)."\n", 3, "time");
    }
}

$indexid = $argv[1];
$obj = new syncPHPcms($indexid);
$obj->syncContent();
