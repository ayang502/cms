<?php
require_once __DIR__ . "/../init.php";
include "iconv.func.php";
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
    public function getModelID($name, $siteid) {
        $sql = "select * from {$this->table}_model where siteid={$siteid} and name='{$name}'";
        return $this->cdb->fetchOne($sql);
    }
    public function getWareModel($tableid) {
        $sql = "select Name from cmsware_content_table where TableID={$tableid}";
        return $this->wdb->fetchOne($sql);
    }
    public function genPost($v, $parent, $siteid, $template) {
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
        $info['ismenu'] = 0;
        if ($v['PublishMode'] == 1) {
            $setting['ishtml'] = 1;
            $post['category_html_ruleid'] = 41;
            $setting['content_ishtml'] = 1;
            $post['show_html_ruleid'] = $this->getRulID($v);
            $post['category_html_ruleid'] = 1;
            $post['show_html_ruleid'] = 17;
        } else if ($v['PublishMode'] == 2) {
            $post['category_php_ruleid'] = 1;
            $post['show_php_ruleid'] = 17;
        } else {
            $post['category_php_ruleid'] = 1;
            $post['show_php_ruleid'] = 17;
        }
        if (!empty($template)) {
            $setting['template_list'] = $template;
        }
        $tmp = $this->genTemplate($v);
        $setting = array_merge($tmp, $setting);
        /*
        $a = $this->getUrlAndCatid($v);
        if (false !== $a && !empty($a)) {
            $info['catdir'] = $a['catdir'];
            $info['url'] = $a['url'];
        }
         */

        $info['catdir'] = join("", gbk_to_pinyin($v['Name']));
        $setting['template_list'] = 'default';
        $post['info']    = $info;
        $post['setting'] = $setting;
        return $post;
    }

    public function genTemplate($v) {
        $setting = array();
        $setting['template_list'] = 'default';
        $setting ['category_template'] = 'category';
        $setting ['list_template'] = 'list';
        $setting ['show_template'] = 'show';
        $setting['create_to_html_root'] = 1;
        return $setting;
        if (!empty($v['IndexTpl'])) {
            $setting['category_template'] = $v['IndexTpl'];
        }
        if (!empty($v['IndexTpl'])) {
            $setting['list_template'] =$v['IndexTpl'];
        }
        if (!empty($v['ContentTpl'])) {
            $setting['show_template'] = $v['ContentTpl'];
        }
        $setting['create_to_html_root'] = 1;
        return $setting;
    }

    public function deleteCate() {
        return $this->cdb->truncateTable($this->table.'_category');
    }

    public function getRulID($v) {
        $tmp = trim($v['PublishFileFormat']);
        $ruleid = 32;
        $flag = false;
        if(empty($v['SubDir']) || 'null' == strtolower($v['SubDir'])) {
            $flag = true;
        }
        switch ($tmp) {
            case "{ContentID}.html":
                if ($flag) {
                    $ruleid = "32";
                } else {
                    $ruleid = "36";
                }
                break;

            case "{TimeStamp}d{ContentID}.html":
                if ($flag) {
                    $ruleid = "34";
                } else {
                    $ruleid = "37";
                }
                break;
            case "{IndexID}/index.html":
                if ($flag) {
                    $ruleid = "35";
                } else {
                    $ruleid = "40";
                }
        
            case "[@pubSchool('{SchoolID}')]{ContentID}.html":
                if ($flag) {
                    $ruleid = "33";
                } else {
                    $ruleid = "38";
                }
                break;
            case "[@strtolower(@str_replace(' ','-','{E_Name_s}'))].html":
                if ($flag) {
                    $ruleid = "31";
                } else {
                    $ruleid = "39";
                }
                break;
        }
        return $ruleid;
    }

    public function getUrlAndCatid($v) {
        if (empty($v['ContentPSN']) || 'null' == strtolower($v['ContentPSN'])) {
            return false;
        }
        $psn = trim($v['ContentPSN']);
        $tmp = explode('}', $psn);
        $psnid = str_replace("{PSN:", "", $tmp[0]);
        $sql = "select * from cmsware_psn where PSNID = {$psnid}";
        $res = $this->wdb->fetchOne($sql);
        $catdir = str_replace("relate::", "", $res['PSN']);
        if (!empty($tmp[1])) {
            $catdir .= $tmp[1];
        }
        $url = $res['URL'] . "/";
        return array('catdir'=>$catdir, 'url'=>$url);
    } 
    public function alterTable() {
        $sql = "alter table {$this->ctable} change catdir catdir varchar(255);";
        $res = $this->cdb->execute($sql);
    }
}
