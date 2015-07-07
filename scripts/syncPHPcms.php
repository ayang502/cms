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
            $res = curl_post(ADDSITEURL, $post);
            $a = strip_tags($res);
            echo $a;
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
                    error_log("$a\n", 3, "model.log");
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
                    error_log("$a\n", 3, "field.log");
                }
            }
        } 
    }
    public function syncCategory() { 
        $cate = new category();
        //$cate->deleteCate();
        $cate->alterTable();
        $r = $cate->getCmsSite();
        $w = $cate->getCwSite();
        $all = $cate->getAllSite();
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
                        $post = $cate->genPost($vvv, $tmp, $siteid, $all[$siteid]['template']);
                        $post['dosubmit'] = 1;
                        $post['siteid'] = $siteid;
                        $url = sprintf(ADDCATEFIELDEURL, $parent, $level);
                        continue;
                        $res = curl_post($url, $post);
                        if (false === strpos($res, '成功')) {
                            error_log("\n$res", 3, "category.log");
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

     
    public function syncAdminUser() {
        $obj = new adminuser();
        $res = $obj->addRole();
        foreach ($res as $info) {
            $post['dosubmit'] = 1;
            $post['info'] = $info;
            $a  =curl_post(ADDROLE, $post);
        }

        $res = $obj->addUser();
        foreach ($res as $info) {
            $post['dosubmit'] = 1;
            $post['info'] = $info;
            curl_post(ADDUSER, $post);
        }
    }
    public function syncIndexId() {
        $obj = new indexId();
        $obj->run();
    }
    public function syncHists() {
        $obj = new hists();
        $obj->run();
    }
    public function syncTableModel() {
        $obj = new tableid();
        $obj->run();
    }
}

$obj = new syncPHPcms();
$obj->syncCategory();
exit;   

$res = $obj->loginCms();
if ($res) {
    $obj->syncSite();
    $obj->syncModel();
    $obj->syncModelFields();
    if (is_file("alter.sql")) {
        $cdb = helper::getDB("phpcms");
        $c = file("alter.sql");
        foreach ($c as $v) {
            $sql = trim($v);
            $res = $cdb->execute($sql);
        }
    }
    $obj->syncUrlrule();
    $obj->syncCategory();
    $obj->syncIndexId();
    $obj->syncHists();
    $obj->syncTableModel();
    $obj->syncAdminUser();
    
} else {
    exit("登陆错误了");
}
