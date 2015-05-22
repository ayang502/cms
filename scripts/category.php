<?php
require_once __DIR__ . "/../init.php";
class cms_category extends base {
    public function __construct() {
        $this->i = 1;
        $this->setting = array (
            'workflowid' => '',
            'ishtml' => '1',
            'content_ishtml' => '1',
            'create_to_html_root' => '0',
            'template_list' => 'uker',
            'category_template' => 'category',
            'list_template' => 'list',
            'show_template' => 'show',
            'meta_title' => '',
            'meta_keywords' => '',
            'meta_description' => '',
            'presentpoint' => '1',
            'defaultchargepoint' => '0',
            'paytype' => '0',
            'repeatchargedays' => '1',
            'category_ruleid' => '1',
            'show_ruleid' => '11',
        );
        parent::__construct();
        $this->wtable = 'cmsware_site';
        $this->ctable = $this->table . '_category';
        $this->getBaseWareSites();
        $this->getcmsware_psn();
    }
    public function run() {
        $this->insertCmsCategory();
    }
    public function get_category($category_pid=0, $level=0){
        $sql = "select * from {$this->wtable} where ParentID = $category_pid";
        $result = $this->wdb->fetchAll($sql);
        if (!empty($result)) {
            foreach ($result as $v) {
                $category_pid = $v["NodeID"];
                $this->c[] = $v['NodeID'];
                $this->get_category($category_pid, $level+1);
            }
        }
    }
    //一级分类
    public function insertCmsCategory() {
        $sql = "select * from cmsware_content_table";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $v) {
            $a[$v['TableID']] = $v['Name'];
        } 

        foreach ($this->sites as $v) {
            $sql    = "select * from cmsware_site where ParentID={$v['NodeID']}";
            $level1 = $this->wdb->fetchAll($sql);
            $siteid = $v['NodeID'];
            foreach ($level1 as $vv) {
                $arr = array();
                $this->c = array();
                $this->get_category($vv['NodeID']);

                $tableid = $vv['TableID'];
                echo $tableid;
                echo "\n";
                continue;
                $sql = "select * from {$this->table}_model where name='{$a[$tableid]}' and siteid={$siteid}";
                echo $sql;
                $b = $this->cdb->fetchOne($sql);
                $arr = $this->setting;
                $arr['siteid'] = $siteid;
                $arr['cateid'] = $vv['NodeID'];
                $arr['module'] = 'content';
                $arr['modelid'] = $b['modelid'];
                $arr['parentid'] = $vv['ParentID'];
                $arr['arrparentid'] = $vv['ParentID'];
                if (!empty($this->c)) {
                    $arr['child'] = 1;
                } else {
                    $arr['child'] = 0;
                }
                $arr['arrchildid'] = join(",", $this->c);
                if ($vv['PublishMode'] == 1) {
                    $arr['sethtml'] = 1;
                } else {
                    $arr['sethtml'] = 0;
                }
                if (!empty($vv['ResourcePSN'])) {
                    $a = explode('}', $vv['ResourcePSN']);
                    $a = substr($a[0], 5);
                    $arr['url'] = $this->psn[$a]['URL'];;
                }
                $arr['ismenu'] = 0;
                $arr['ishtml'] = 0;
                $arr['catdir'] = 0;
                $this->cdb->insert($this->ctable, $arr);
            }
        }
    }
}
$obj = new cms_category();
$obj->run();
