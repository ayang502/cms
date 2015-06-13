<?php
require_once __DIR__ . "/../init.php";
include "iconv.func.php";
class category extends base {
    public function __construct() {
        parent::__construct();
        $this->wtable = 'cmsware_site';
        $this->ctable = $this->table . '_category';
    }
    public function getRootID () {
        $res = $this->getCwSite(); 
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
    public function getModelID($name, $siteid) {
        $sql = "select * from {$this->table}_model where siteid={$siteid} and name='{$name}'";
        return $this->cdb->fetchOne($sql);
    }
    public function getWareModel($tableid) {
        $sql = "select Name from cmsware_content_table where TableID={$tableid}";
        return $this->wdb->fetchOne($sql);
    }
    public function genPost($v, $parent, $siteid) {
        $post = $info = $setting = array();
        $info['catid'] = $v['NodeID'];
        $info['parentid'] = $parent;
        if ($v['TableID'] > 12) {
            $v['TableID'] = '1';
        }
        $res = $this->getWareModel($v['TableID']);
        $name = $res['Name'];
        $res = $this->getModelID($name, $siteid);
        
        $info['modelid'] = $res['modelid'];
        $info['catname'] = $v['Name'];
        $info['catdir'] = join("", gbk_to_pinyin($v['Name']));
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
        if (!empty($v['IndexTpl'])) {
            $setting['cms_list_tpl'] = $v['IndexTpl'];
        }
        if (!empty($v['ContentTpl'])) {
            $setting['cms_show_tpl'] = $v['ContentTpl'];
        }

        $post['info'] = $info;
        $post['setting'] = $setting;
        return $post;
    }
    public function deleteCate() {
        return $this->cdb->truncateTable($this->table.'_category');
    }
}
