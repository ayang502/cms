<?php
require_once __DIR__ . "/../init.php";
class cms_model extends base {
    public function run() {
        $this->default = require __DIR__ . "/default_model_field.php";
        $sql = 'select * from cmsware_content_table';
        $this->res = $this->wdb->fetchAll($sql);
        $this->getBaseWareSites();
        $this->syncModel();
        //$this->syncModelField();
        //$this->syncTable();
        //$this->syncData();
    }
    public function syncModel() {
        $iputType =  array(
            "checkbox",
            "RichEditor",
            "select",
            "text",
            "textaera",
            "radio",
            "password",
        );
        //FieldInput: select
        //FieldDefaultValue: 0;1;2;3;4;5;6
        $this->cdb->truncateTable($this->table . "_model");
        $sql = "select * from cmsware_content_table";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $v) {
            foreach ($this->sites as $site) {
                $arr = array(); 
                $arr['siteid'] = $site['NodeID'];
                $arr['name'] = $v['Name'];
                $tablename = "{$this->table}_content_{$site['NodeID']}_{$v['TableID']}_data";
                $this->tables["cmsware_content_".$v['TableID']][] = $tablename;
                $arr['tablename'] = "content_{$site['NodeID']}_{$v['TableID']}";
                $arr['addtime'] = time();
                $this->cdb->insert($this->table . '_model', $arr);
            }
        }
    }
    public function syncModelField() {
        $table = $this->table . '_model_field';
        $this->cdb->truncateTable($table);
        $sql = "select * from {$this->table}_model";
        $res = $this->cdb->fetchAll($sql);
        foreach ($res as $v) {
            foreach ($this->default as $vv) {
                $arr = $vv;
                $arr['siteid'] = $v['siteid'];
                $arr['modelid'] = $v['modelid'];
                //$this->cdb->insert($table, $arr);
            }
        }
    }
    public function syncTable() {
        foreach ($this->res as $v) {
            $table = 'cmsware_content_' . $v['TableID'];
            $sql = "show create table {$table}";
            $res = $this->wdb->fetchAll($sql);
            $tablesql = trim($res[0]['Create Table']);
            $tmp = explode("\n", $tablesql);
            array_pop($tmp);
            array_push($tmp, ')ENGINE=MyISAM DEFAULT CHARSET=utf8');
            $wt[$table] = $tmp;
        }
        foreach ($this->tables as $wtable=>$vv) {  
            foreach ($vv as $vvv) {
                echo $vvv;
                echo "\n";
                $a = $this->cdb->dropTable($vvv);
                $a = $this->cdb->dropTable(str_replace("_data", "", $vvv));
                $tmp = $wt[$wtable];
                $a = $this->cdb->dropTable($vvv);
                $tmp[0] = str_replace($wtable, $vvv, $tmp[0]);
                $sql = join("\n", $tmp);
                //$a = $this->cdb->execute($sql);
            }
        }
    }

    public function syncData() {
        foreach ($this->res  as $v) {
            $id = 0;
            $table = 'cmsware_content_' . $v['TableID'];
            $ctable = str_replace('cmsware', $this->table, $table);
            $this->cdb->truncateTable($ctable);
            while (true) {
                $sql = "select * from {$table} where ContentID>{$id} limit 100";
                $res = $this->wdb->fetchAll($sql);
                if (empty($res)) {
                    break;
                }
                //$this->cdb->insertBatch($ctable, $res);
                $id =  $res[count($res)-1]['ContentID'];
                echo $ctable;
                echo ":";
                echo $id;
                echo "\n";
            }
        }
    }
}
$obj = new cms_model();
$obj->run();
