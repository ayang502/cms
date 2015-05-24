<?php
require_once __DIR__ . "/../init.php";
class category extends base {
    public function __construct() {
        parent::__construct();
        $this->wtable = 'cmsware_site';
        $this->ctable = $this->table . '_category';
    }

    public function get_category($category_pid=0, $level=0, &$c){
        $sql = "select * from {$this->wtable} where ParentID = $category_pid";
        $result = $this->wdb->fetchAll($sql);
        if (!empty($result)) {
            foreach ($result as $v) {
                $category_pid = $v["NodeID"];
                $c[$level][$v['ParentID']][]  = $v;
                $this->get_category($category_pid, $level+1, $c);
            }
        }
        return $c;
    }

    public function genPost($v, $parent) {
        $post = $info = $setting = array();
        $info['catid'] = $v['NodeID'];
        $info['parentid'] = $parent;
        $info['catname'] = $v['Name'];
        $info['catdir'] = $v['NodeID'];
        $info['ismenu'] = 0;

        if ($v['PublishMode'] == 1) {
            $setting['ishtml'] = 1;
            $post['category_ruleid'] = 35;
            $setting['content_ishtml'] = 1;
            $post['show_html_ruleid'] = mapUrlRule($v['SubDir'] . $v['PublishFileFormat']);
        } else if ($v['PublishMode'] == 2) {
            $post['category_php_ruleid'] = 6;
            $post['show_php_ruleid'] = 16;
        } else {
            $post['category_php_ruleid'] = 6;
            $post['show_php_ruleid'] = 16;
        }
        $post['info'] = $info;
        $post['setting'] = $setting;
        return $post;
    }
}
