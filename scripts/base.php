<?php
class base {
    public function __construct() {
        global $table;
        $this->table = $table;
        $this->cdb = helper::getDB('phpcms');
        $this->wdb = helper::getDB('cmsware');
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

    public function mappingModelID($siteid, $oldTableID) {
        return intval($siteid . $oldTableID + 1);
    }

    public function getCmsSite() {
        $sql = "select * from {$this->table}_site";
        $res = $this->cdb->fetchAll($sql);
        foreach ($res as $k=>$v) {
            $return[$v['name']] = $v['siteid'];
        }
        return $return;
    }
    public function getCwSite() {
        $sql = "select * from cmsware_site where ParentID = 0";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $k=>$v) {
            $return[$v['Name']] = $v['NodeID'];
        }
        return $return;

    }
}
