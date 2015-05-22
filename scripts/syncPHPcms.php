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
                $res = curl_post(ADDMODULEURL, $post);
                echo strip_tags($res);
                echo "\n";
            }
        }
    }
    public function syncModelFields() {

    }
}

$obj = new syncPHPcms();
$obj->loginCms();
$obj->syncSite();
$obj->syncModel();
