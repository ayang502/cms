<?php
class indexId extends base {
    public function run() {
        $table = $this->table . '_index_mapping';
        $sql = "drop table {$table};";
        $ex = $this->cdb->execute($sql);
        $sql = "create table {$table} (
            `indexid` int(11) not null, 
            `contentid` int(11) not null,
            `catid` int(11) not null, 
            `modelid` int(11) not null, 
            `nodeid` int(11) not null,
            `tableid` int(11) not null,
            `siteid` int(11) not null,
            primary key `indexid` (`indexid`)
        )engine=innodb charset=utf8;";

        $this->cdb->execute($sql);

        $indexid = 0;
        while (true) {
            echo $indexid;
            echo "\n";
            $sql = "select * from cmsware_content_index where IndexID > {$indexid} order by IndexID asc limit 2000";

            $wareres = $this->wdb->fetchAll($sql);
            if (empty($wareres)) break;
            foreach ($wareres as $v) {
                $data = array();
                $data['indexid'] = $v['IndexID'];
                $data['contentid'] = $v['ContentID']+0;
                $data['catid'] = $v['NodeID']+0;
                $tmp = $this->getModelID($v['NodeID']);
                $data['modelid'] = $tmp['modelid']+0;
                $data['siteid'] = $tmp['siteid']+0;
                $data['nodeid'] = $v['NodeID']+0;
                $data['tableid'] = $v['TableID']+0;
                $indexid = $v['IndexID'];
                $return[] = $data;
            }
            $result = $this->cdb->insertBatch($table, $return);
            unset($return);
            if (!$result) {
                error_log($indexid."\n", 3, $table . '.log');
            }
        }
    }
    public function getModelID($catid) {
        $sql = "select * from {$this->table}_category where catid={$catid}";
        $res = $this->cdb->fetchOne($sql);
        return $res;
    }
    
}
