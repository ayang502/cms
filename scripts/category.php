<?php
require_once __DIR__ . "/../init.php";
class cms_category extends base {
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
    public function __construct() {
        parent::__construct();
        $this->wtable = 'cmsware_site';
        $this->ctable = $this->table . '_category';
    }
    public function run() {
        $this->insertCmsCategory();
        $this->getBaseWareSites();
    }

    public function insertCmsCategory() {
        $this->getBaseWareSites();
        foreach($this->sites as $v) {
            $sql = "select * from {$this->wtable} where ParentID = {$v['NodeID']}";
            $res = $this->wdb->fetchAll($sql);
            print_r($res);
            exit;
        }
    }
}
$obj = new cms_category();
$obj->run();
