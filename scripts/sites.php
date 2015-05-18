<?php
require_once __DIR__ . "/../init.php";
//迁移站点设置
class cms_sites {
    private $setting = "
        array (
            'upload_maxsize' => '2048',
            'upload_allowext' => 'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf',
            'watermark_enable' => '1',
            'watermark_minwidth' => '300',
            'watermark_minheight' => '300',
            'watermark_img' => 'statics/images/water//mark.png',
            'watermark_pct' => '85',
            'watermark_quality' => '80',
            'watermark_pos' => '9',
        )
        ";
    public function __construct() {
        global $table;
        $this->table = $table;
        $this->cdb = helper::getDB('phpcms');
        $this->wdb = helper::getDB('cmsware');
        $this->getBaseWareSites();
        $this->getcmsware_psn();
    }
    public function run() {
        $this->insertCmsSite();
    }

    public function getBaseWareSites() {
        $s = "select * from cmsware_site where ParentID=0";
        $this->sites = $this->wdb->fetchAll($s);
    }

    public function getcmsware_psn(){
        $s = "select * from cmsware_psn";
        $psn = $this->wdb->fetchAll($s);
        foreach ($psn as $v) {
            $this->psn[$v['PSNID']] = $v;
            $arr = explode("/", $v['PSN']);
            $this->psn[$v['PSNID']]['DIR'] = array_pop($arr);
            $this->psn[$v['PSNID']]['URL'] = $v['URL'] . '/';
        }
    }

    
    public function insertCmsSite() {
        $this->cdb->truncateTable($this->table . '_site');
        foreach ($this->sites as $v) {
            $arr = array();
            $a =  $style = '';
            if (!empty($v['ResourcePSN'])) {
                $a = explode('}', $v['ResourcePSN']);
                $a = substr($a[0], 5);
                $arr['domain'] = $this->psn[$a]['URL'];
                $arr['dirname'] = $this->psn[$a]['DIR'];
            } else {
                $arr['domain'] = 'http://cms.uker.net/';
                $arr['dirname'] = 'html';
            }
            $arr['siteid'] = $v['NodeID'];
            $arr['name'] = $v['Name'];
            $arr['site_title'] = $v['Name'];
            $arr['uuid'] = guid();
            $arr['setting'] = $this->setting;
            if (!empty($v['IndexTpl'])) {
                $a = explode("/", $v['IndexTpl']);
                $style = array_pop($a);
            } else {
                $style = 'default';
            }
            $arr['default_style'] = $style;
            $arr['template'] = $style;
            $res = $this->cdb->insert($this->table."_site", $arr);
            var_dump($res);
        }
    }
}
$obj = new cms_sites();
$obj->run();
