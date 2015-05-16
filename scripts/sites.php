<?php
require_once __DIR__ . "/../init.php";
//迁移站点设置
class cms_sites {
    public function __construct() {
        $this->cdb = helper::getDB('phpcms');
        $this->wdb = helper::getDB('cmsware');
        $this->getBaseWareSites();
        $this->getcmsware_psn();
    }
    public function getBaseWareSites() {
        $s = "select * from cmsware_site where ParentID=0";
        $this->sites = $this->wdb->fetchAll($s);
    }
    public function getcmsware_psn(){
        $s = "select * from cmsware_psn";
        $this->psn = $this->wdb->fetchAll($s);
    }

    public function insertCmsSite() {
        foreach ($this->sites as $v) {
            echo $v['ResourcePSN'];
            echo "\n";
            $psn = explode(':', $v['ResourcePSN']);
            var_dump($psn);
            exit;
            $psn = str_replace("}", "", $psn[1]);
            echo $psn;
            echo "\n";
        }
    }
}
$obj = new cms_sites();
$obj->insertCmsSite();
