<?php
require_once __DIR__ . "/../init.php";
class syncPHPcms extends phpcms {
    public function syncSite() {
        $post['dosubmit'] = '1';
        $obj = new sites();
        $arr = $obj->insertCmsSite();
        foreach ($arr as $v) {
            $post = $v;
            $post['dosubmit'] = 1;
            if ($v['siteid'] ==1) {
                $res = curl_post(EDITSITEURL . '&siteid='.$v['siteid'], $post);
            } else {
                $res = curl_post(ADDSITEURL, $post);
            } 
        }
    }

    public function syncModel() {
        $obj = new model();
        $res = $obj->getModelName();
        foreach ($res as $siteid=>$v) {
            foreach ($v as $kk=>$vv) {
                $post['info'] = $vv;
                $post['siteid'] = $siteid;
                $post['dosubmit'] = 1;
                $res = curl_post(ADDMODELEURL, $post);
                $a = strip_tags($res);
                if (false === strpos($a, '成功')) {
                    echo $a;
                    echo "\n";
                }
            }
        }
    }
    public function syncModelFields() {
        $obj = new model();
        $r = $obj->getCmsSite();
        foreach ($r as $siteid) {
            $arr = $obj->getModelField($siteid);
            foreach ($arr as $v) {
                $post['info'] = $v;
                $post['siteid'] = $v['siteid'];
                $post['setting'] = isset($v['setting']) ? $v['setting'] : array();
                $post['dosubmit'] = 1;
                $post['tablename'] = $v['tablename'];
                $res = curl_post(ADDMODELFIELDEURL . '&modelid=' . $v['modelid'] , $post);
                $a = strip_tags($res);
                if (false === strpos($a, '成功')){
                    var_Dump($post);
                    echo $a;
                    echo "\n";
                    exit;
                }
            }
        } 
    }
    public function syncCategory() { 
        $cate = new category();
        $cate->deleteCate();
        $r = $cate->getCmsSite();
        $w = $cate->getCwSite();
        foreach ($w as $k=>$v) {
            if (!isset($r[$k])) continue;
            $siteid = $r[$k];
            $c = array();
            $a = $cate->get_category($v, 0, $c);
            foreach ($a as $level=>$v) {
                foreach ($v as $parent=>$vv) {
                    foreach ($vv as $vvv) {
                        if ($level == 0) {
                            $tmp = 0; 
                        } else {
                            $tmp = $parent;
                        }
                        $post = $cate->genPost($vvv, $tmp, $siteid);
                        $post['dosubmit'] = 1;
                        $post['siteid'] = $siteid;
                        $url = sprintf(ADDCATEFIELDEURL, $parent, $level);
                        $res = curl_post($url, $post);
                        if (false === strpos($res, '成功')) {
                            echo $res;
                            echo "\n";
                        }
                    }
                }
            }
        }
    }

    public function syncUrlrule() {
        $sqlfile = __DIR__ . "/v9_urlrule.sql";
        $obj = new base();
        $obj->cdb->execute($sqlfile);
    }

    public function syncContent() {
        $obj = new content();
        $id = 0;
        $id = 0;
        $wdb = helper::getDB('cmsware');
        while(true) {
            usleep(1000);
            if (!$wdb) $wdb = helper::getDB('cmsware');
$sql = "select * from cmsware_content_index where TableID=7 and IndexID > {$id} order by IndexID asc limit 100"; 
            $res = $wdb->fetchAll($sql);
            if (empty($res)) {
                break;
            }
            foreach ($res as $k=>$v) {
                $id = $v['IndexID'];
                echo $id;
                echo "\n";
                $catid = $v['NodeID'];
                $arr = array();
                
                $arr = $obj->getPublish($v['TableID'], $v['ContentID']);
                $status = 99;
                if (empty($res)) {
                    $arr = $obj->getContent($v['TableID'], $v['ContentID']);
                    $status = 1;
                }
                $arr['URL'] = $v['URL'];
                $post['dosubmit'] = 1;
                $tmp = $obj->getSiteId($catid);
                $post['siteid'] = $tmp['siteid'];

                $a = $obj->genPost($arr, $status, $catid, $v['TableID']);
                if (empty($a)) continue;

                $post['info'] = $a;

                $url = sprintf(ADDCONENTURL, $catid);
                $res = curl_post($url, $post);
                $a = strip_tags($res);
                if (false === strpos($a, '成功')){
                    print_r($post);
                    echo $a;
                    echo "\n";
                    exit;
                }            
            }
        }
    } 
    public function cleanCache() {
        $res = curl_post(CLEANCACHE, array('dosubmit' => 1));
        var_dump($res);
    }
}

$obj = new syncPHPcms();
$res = $obj->loginCms();

if ($res) {
    //$obj->syncSite();
    //$obj->syncModel();
    //$obj->syncModelFields();
    /*
    if (is_file("alter.sql")) {
        $tmp = new base();
        $tmp->cdb->execute("alter.sql");
    }
     */

    //$obj->syncUrlrule();
    //$obj->syncCategory();
    $obj->syncContent();
}
