<?php
class hists extends base {
    public function run() {
        $this->tablename = $this->table . '_hits';
        $sql = "truncate table {$this->tablename}";
        $this->cdb->execute($sql);
        $this->runCmswareHists();
    }
    public function runCmswareHists() {
        $table = 'cmsware_plugin_base_count';
        $id = 0;
        while (true) {
            $sql = "select * from {$table} where IndexID > {$id} order by IndexID asc limit 1000"; 
            $res = $this->wdb->fetchAll($sql);
            if (empty($res)) break;
            $result = array();
            foreach ($res as $v) {
                $data = array();
                $id = $v['IndexID'];
                $data['views'] = $v['Hits_Total'];
                $data['yesterdayviews'] = $v['Hits_Today'];
                $data['dayviews'] = $v['Hits_Today'];
                $data['weekviews'] = $v['Hits_Week'];
                $data['monthviews'] = $v['Hits_Month'];
                $data['catid'] = $v['NodeID'];
                $data['updatetime'] = $v['Hits_Date'];
                $modelid = $this->getModelIDAndContentId($v['NodeID']);
                //c-modelid-contentid(文章id)
                $data['hitsid'] = "c-{$modelid}-{$v['ContentID']}";
                $result[] = $data;
            }
            $res = $this->cdb->insertBatch($this->tablename, $result);
            if (false == $res) {
                foreach ($result as $v) {
                    $this->cdb->insert($this->tablename, $v);
                }
            }
        }
    }
    private function getModelIDAndContentId($NodeID) {
        $sql = "select modelid from {$this->table}_category where catid = {$NodeID}";
        $res = $this->cdb->fetchOne($sql);
        return $res['modelid'];
    }
}
?>
