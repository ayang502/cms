<?php
class tableid extends base {
    public function run() {
        $table = $this->table . '_tableid_mapping';
        $sql = "drop table {$table};";
        $ex = $this->cdb->execute($sql);
        $sql = "create table {$table} (
            `modelid` int(11) not null, 
            `tableid` int(11) not null, 
            `siteid` int(11) not null,
            `tablename` char(20) not null,
            primary key `modelid` (`modelid`)
        )engine=innodb charset=utf8;";

        $this->cdb->execute($sql);

        $sql = "select * from cmsware_content_table";
        $tables = $this->wdb->fetchAll($sql);
        foreach ($tables as $v) {
            $data = array();
            $tmp = $this->getModelID($v['Name']);
            foreach ($tmp as $vv) {
                $data['tableid'] = $v['TableID'];
                $data['modelid'] = $vv['modelid'];
                $data['siteid'] = $vv['siteid'];
                $data['tablename'] = $vv['tablename'];
                $return[] = $data;
            }
        }
        $result = $this->cdb->insertBatch($table, $return);
        unset($return);
        if (!$result) {
            error_log($indexid."\n", 3, $table . '.log');
        }
    }
    public function getModelID($modelname) {
        $sql = "select * from {$this->table}_model where name='{$modelname}'";
        $res = $this->cdb->fetchAll($sql);
        return $res;
    }
    
}
