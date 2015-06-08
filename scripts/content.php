<?php
class content extends base {
    public function getmodelID($catid) {
        $cdb = helper::getDB('phpcms');
        $sql = "select modelid from {$this->table}_category where catid=$catid";
        return $cdb->fetchOne($sql);
    }
    public function genPost($res, $status, $catid, $tableid) {
        if (false === $this->isCatExists($catid)) {
            return;
        }
        $tmp = $this->getmodelID($catid);
        $modelid = $tmp['modelid'];
        $this->modelid = $modelid;
        unset($tmp);
        $res['modelid'] = $modelid;
        $res['catid'] = $catid;
        
        if (!isset($res['ContentID']) || empty($res['ContentID'])) {
            return;
        }
        if (isset($res['PublishDate'])) {
            $res['inputtime']   = $res['PublishDate'];
        }
        $res['id'] = $res['ContentID'];
        $res['url'] = $res['URL'];
        $res['status'] = $status;
        $res['sysadd'] = $res['CreationUserID'];
        $res['username'] = $this->getusername($res['sysadd']);
        $method = "genContent{$tableid}";
        return $this->$method($res);
    }
    public function genRelation($v) {
        if (empty($v)) return;
        foreach ($tmp as $t) {
            $relation[] = $this->modelid . ',' . $t;
        }
        $res = join('|', $relation);
        return $res;
    }
    public function getusername($id) {
        $sql = "select username from {$this->table}_admin where userid={$id}";
        $cdb = helper::getDB('phpcms');
        $res = $cdb->fetchOne($sql);
        if (empty($res)) {
            return 'admin';
        }
        return $res['username'];
    }
    public function genContent1($res) {
        if (empty($res['Title'])) {
            return;
        }
        $res['title'] = $res['Title'];
        if (isset($res['TitleColor']) && false !== strpos($res['TitleColor'], '#')) {
            $res['style_color'] = $res['TitleColor'];
        }
        $res['keywords'] = $res['Keywords'];
        $res['content'] = $res['Content'];
        $res['CustomLinks'] = $this->genRelation($res['CustomLinks']);
        $res['SchoolID'] = $this->genRelation($res['SchoolID']);
        $res['AgentID'] = $this->genRelation($res['AgentID']);
        $res['Agent_Name'] = $this->genRelation($res['Agent_Name']);
        $res['School_Name'] = $this->genRelation($res['School_Name']);
        $res['USAER_SchoolID'] = $this->genRelation($res['USAER_SchoolID']);
        $res['USAER_School_Name'] = $this->genRelation($res['USAER_School_Name']);
        return $res;
    }
    public function genContent2($res) {
        if (empty($res['Title'])) {
            return ;
        }
        $res = $res;
        $res['title'] = $res['Title'];
        $res['content'] = $res['Intro'];
        $res['CustomLinks'] = $this->genRelation($res['CustomLinks']);
        $res['SchoolID'] = $this->genRelation($res['SchoolID']);
        $res['CustomSoftLinks'] = $this->genRelation($res['CustomSoftLinks']);
        return $res; 
    }
    
    public function genContent3($res) {
        if (empty($res['E_Name'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['S_Name'];
        return $res;
    }
    public function genContent4($res) {
        if (empty($res['DegreeType'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['DegreeType'];
        return $res;
    }
    public function genContent5($res) {
        if (empty($res['CompanyName'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['CompanyName'];
        $res['Schools'] = $this->genRelation($res['Schools']);
        $res['TopSchools'] = $this->genRelation($res['TopSchools']);
        return $res;
    }
    
    public function genContent6($res) {
        if (empty($res['UserFullname'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['UserFullname'];
        return $res;
    }
    public function genContent7($res) {
        if (empty($res['SchoolName'])) {
            return $res;
        }
        $res['title'] = $res['SchoolName'];
        $res['SchoolID'] = $this->genRelation($res['SchoolID']);
        $res['AgentID'] = $this->genRelation($res['AgentID']);
        return $res;
    }
    public function genContent8($res) {
        if (empty($res['Title'])) {
            return;
        }
        $res['title'] = $res['Title'];
        $res['AgentID'] = $this->genRelation($res['AgentID']);
        return $res;
    }

    public function genContent9($res) {
        if (empty($res['S_Name'])) {
            return;
        }
        $res['title'] = $res['S_Name'];
        return $res;
    }
    public function genContent11($res) {
        if (empty($res['about_SchoolID'])) {
            return;
        }
        $res['title'] = $res['about_SchoolID'];
        $res['about_SchoolID'] = $this->genRelation($res['about_SchoolID']);
        $res['about_SchoolName'] = $this->genRelation($res['about_SchoolName']);
        $res['about_School_E_Name'] = $this->genRelation($res['about_School_E_Name']);
        return $res;
    }
    public function genContent12($res) {
        if (empty($res['SchoolID'])) {
            return;
        }
        $res['title'] = $res['SchoolID'];
        $res['SchoolID'] = $this->genRelation($res['SchoolID']);
        $res['Link_Grade'] = $this->genRelation($res['Link_Grade']);
        $res['Link_MajorIDs'] = $this->genRelation($res['Link_MajorIDs']);
        return $res;
    }

    public function getContent($tableid, $contentid) {
        $wdb = helper::getDB('cmsware');
        $table = "cmsware_content_{$tableid}";
        $sql = "select * from {$table} where ContentID={$contentid}";
        return $wdb->fetchOne($sql);
    }

    public function getPublish($tableid, $contentid) {
        $wdb = helper::getDB('cmsware');
        $table = "cmsware_publish_{$tableid}";
        $sql = "select * from {$table} where ContentID={$contentid}";
        return $wdb->fetchOne($sql);
    }
    public function getSiteId($catid) {
        $sql = "select siteid from {$this->table}_category where catid={$catid}";
        $cdb = helper::getDB('phpcms');
        return $cdb->fetchOne($sql);
    }
    public function isCatExists($catid) {
        $sql = "select * from {$this->table}_category where catid={$catid}";
        $cdb = helper::getDB('phpcms');
        $res = $cdb->fetchOne($sql);
        if (empty($res)) {
            return false;
        }
        return true;
    }
}
