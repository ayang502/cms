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
        $arr = $obj->getModelField(1);
        foreach ($arr as $v) {
            $post['info'] = $v;
            $post['setting'] = isset($v['setting'])?$v['setting']:array();
            $post['dosubmit'] = 1;
            $post['tablename'] = $v['tablename'];
            $res = curl_post(ADDMODELFIELDEURL . '&modelid=' . $v['modelid'] , $post);
            $a = strip_tags($res);
            if (false === strpos($a, '成功')){
                echo $a;
                echo "\n";
                exit;
            }
        }

    }
    public function syncCategory() { 
        $cate = new category();
        $r = $cate->getCmsSite();
        $w = $cate->getCwSite();
        foreach ($w as $k=>$v) {
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
                        $post = $cate->genPost($vvv, $tmp);
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
}

$obj = new syncPHPcms();
$res = $obj->loginCms();
if ($res) {
    //$obj->syncSite();
    //$obj->syncModel();
    //$obj->syncModelFields();
    $obj->syncCategory();
}
