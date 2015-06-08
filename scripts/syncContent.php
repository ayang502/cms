<?php
require_once __DIR__ . "/../init.php";
class syncPHPcms extends phpcms {
    public function __construct($nodeID) {
        $this->nodeID = $nodeID;
    }

    public function syncContent() {
        $start = time();
        $id = 0;
        while(true) {
            $obj = new content();
            $wdb = helper::getDB('cmsware');
            $sql = "select * from cmsware_content_index where NodeID in ({$this->nodeID})  and IndexID > {$id} order by IndexID asc limit 100"; 
            $res = $wdb->fetchAll($sql);
            if (empty($res)) {
                break;
            }
            foreach ($res as $k=>$v) {
                $id = $v['IndexID'];
                $catid = $v['NodeID'];
                $arr = array();
                $publish = $obj->getPublish($v['TableID'], $v['ContentID']);
                $content = $obj->getContent($v['TableID'], $v['ContentID']);
                $status = 99;
                if (empty($publish)) {
                    $status = 1;
                }
                $arr = empty($publish) ?  $content : $publish; 
                if (!empty($content)) {
                    $arr['CreationUserID'] = $content['CreationUserID'];
                } else {
                    $arr['CreationUserID'] = 1;
                }
                
                $arr['URL'] = $v['URL'];
                $post['dosubmit'] = 1;
                $tmp = $obj->getSiteId($catid);
                $post['siteid'] = $tmp['siteid'];
                $a = $obj->genPost($arr, $status, $catid, $v['TableID']);
                error_log("$id\n", 3, "id.log");
                if (empty($a)) {
                    error_log("$id\n", 3, "indexid.log");    
                    continue;
                }
                $post['info'] = $a;
                continue;
                $url = sprintf(ADDCONENTURL, $catid);
                $res = curl_post($url, $post);
                $a = strip_tags($res);
                if (false === strpos($a, '成功')){
                    error_log($v['ContentID']."\n", 3, "content.log");
                    error_log("$a\n", 3, "content.log");
                }            
            }
        }
        $end = time();
        error_log(($end-$start)."\n", 3, "time");
    } 
}
$NodeID = $argv[1];

$obj = new syncPHPcms($NodeID);
$res = $obj->loginCms();

if ($res) {
    $obj->syncContent();
}
