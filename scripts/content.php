<?php
class content extends base {
    public function genPost($res, $status, $catid, $tableid) {
        if (false === $this->isCatExists($catid)) {
            return;
        }
        $res['catid'] = $catid;
        $res['inputtime']   = $res['PublishDate'];
        $res['id'] = $res['ContentID'];
        if (empty($res['ContentID'])) {
            print_r($res);
            return;
        }
        $res['url'] = $res['URL'];
        $res['status'] = $status;
        $method = "genContent{$tableid}";
        return $this->$method($res);
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
        $res['CustomLinks'] = str_replace(',', '|', $res['CustomLinks']);
        $res['SchoolID'] = str_replace(',', '|', $res['SchoolID']);
        $res['AgentID'] = str_replace(',', '|', $res['AgentID']);
        $res['Agent_Name'] = str_replace(',', '|', $res['Agent_Name']);
        $res['School_Name'] = str_replace(',', '|', $res['School_Name']);
        $res['USAER_SchoolID'] = str_replace(',', '|', $res['USAER_SchoolID']);
        $res['USAER_School_Name'] = str_replace(',', '|', $res['USAER_School_Name']);
        return $res;
    }
    public function genContent2($res) {
        if (empty($res['Title'])) {
            return ;
        }
        $res = $res;
        $res['title'] = $res['Title'];
        $res['content'] = $res['Intro'];
        $res['CustomLinks'] = str_replace(',', '|', $res['CustomLinks']);
        $res['SchoolID'] = str_replace(',', '|', $res['SchoolID']);
        $res['CustomSoftLinks'] = str_replace(',', '|', $res['CustomSoftLinks']);
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
        $res['Schools'] = str_replace(',', '|', $res['Schools']);
        $res['TopSchools'] = str_replace(',', '|', $res['TopSchools']);
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
        $res['SchoolID'] = str_replace(',', '|', $res['SchoolID']);
        $res['AgentID'] = str_replace(',', '|', $res['AgentID']);
        return $res;
    }
    public function genContent8($res) {
        if (empty($res['Title'])) {
            return;
        }
        $res['title'] = $res['Title'];
        $res['AgentID'] = str_replace(',', '|', $res['AgentID']);
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
        $res['about_SchoolID'] = str_replace(',', '|', $res['about_SchoolID']);
        $res['about_SchoolName'] = str_replace(',', '|', $res['about_SchoolName']);
        $res['about_School_E_Name'] = str_replace(',', '|', $res['about_School_E_Name']);
        return $res;
    }
    public function genContent12($res) {
        if (empty($res['SchoolID'])) {
            return;
        }
        $res['title'] = $res['SchoolID'];
        $res['SchoolID'] = str_replace(',', '|', $res['SchoolID']);
        $res['Link_Grade'] = str_replace(',', '|', $res['Link_Grade']);
        $res['Link_MajorIDs'] = str_replace(',', '|', $res['Link_MajorIDs']);
        return $res;
    }

    public function getContent($tableid, $contentid) {
        $table = "cmsware_content_{$tableid}";
        $sql = "select * from {$table} where ContentID={$contentid}";
        return $this->wdb->fetchOne($sql);
    }

    public function getPublish($tableid, $contentid) {
        $table = "cmsware_publish_{$tableid}";
        $sql = "select * from {$table} where ContentID={$contentid}";
        return $this->wdb->fetchOne($sql);
    }
    public function getSiteId($catid) {
        $sql = "select siteid from {$this->table}_category where catid={$catid}";
        return $this->cdb->fetchOne($sql);
    }
    public function isCatExists($catid) {
        $sql = "select * from {$this->table}_category where catid={$catid}";
        $res = $this->cdb->fetchOne($sql);
        if (empty($res)) {
            return false;
        }
        return true;
    }
}
