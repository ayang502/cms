<?php
set_time_limit(300);
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

pc_base::load_sys_class('form','',0);
pc_base::load_app_func('util');
pc_base::load_sys_class('format','',0);

class api {
    private $db,$cmsware_db, $admin_db;
    public $siteid,$categorys;
    public function __construct() {
        $this->db         = pc_base::load_model('content_model');
        $this->cmsware_db = pc_base::load_model('cmsware_model');
        $this->cat_db     = pc_base::load_model('category_model');
        $this->admin_db   = pc_base::load_model('admin_model');
        $this->index_map  = pc_base::load_model('index_mapping_model');

        $check = $this->check();
        if (false === $check) {
            exit('没有权限');
        } 
        $this->indexid = intval($_GET['indexid']) + 0;
        $this->from    = intval($_GET['from']) + 0;
        if ($this->from == 0) {
            $this->from = 'api';
            $this->isimprot = 0;
        } else {
            $this->isimprot = 1;
        }
        if (empty($this->indexid)) {
            exit('没有indexid');
        }
    }
    //调用权限验证
    private function check() {
        return true; 
    }

    public function del_content() {
        //获取content
        $res = $this->index_map->get_one("indexid = {$this->indexid}");
        if (empty($res)) {
            echo json_decode(array('status'=>0, 'msg'=>'no index data'));
            return;
        }
        //删除content 
        $this->db->set_model($res['modelid']);
        $res = $this->db->delete_content($res['contentid']);
        //删除index
        $this->index_map->delete("indexid = {$this->indexid}");
        echo json_decode(array('status'=>0, 'msg'=>'succ'));
    }

    public function edit_content() {
        define('IN_ADMIN');
        $return['status'] = 1;
        $return['msg']    = 'succ';

        //获取cmsware indexid 对应内容
        $this->cmsware_db->table_name = $this->cmsware_db->db_tablepre . "content_index";
        $index_data = $this->cmsware_db->get_one('IndexID=' . $this->indexid);
        if (empty($index_data)) {
            $return['status'] = 0;
            $return['msg']    = 'no cmsware index data';
            echo json_encode($return);
            return;
        }
        $catid = $index_data['NodeID'];
        //获取siteid 
        $categorys = $this->cat_db->get_one('catid='.$catid);
        if (empty($categorys)) {
            $return['status'] = 0;
            $return['msg']    = 'no category';
            echo json_encode($return);
            return;
        }
        $this->siteid = $categorys['siteid'];
		$this->categorys = getcache('category_content_'.$this->siteid,'commons');

        //获取cmsware文章内容 
        $this->cmsware_db->table_name = $this->cmsware_db->db_tablepre . "content_{$index_data['TableID']}"; 
        $cmsware_content = $this->cmsware_db->get_one('ContentID=' . $index_data['ContentID']);
        if (empty($cmsware_content)) {
            $return['status'] = 0;
            $return['msg']    = 'no cmsware content data';
            echo json_encode($return);
            return;
        }
        //构建提交数据
        $data['info'] = $this->buildPost($cmsware_content, $catid, $index_data['TableID']);

        //开始编辑phpcms内容表
        $catid = $data['info']['catid'] = intval($data['info']['catid']);
        if(empty($data['info']) || trim($data['info']['title']) == '') {
            $return['status'] = 0;
            $return['msg'] = 'title is empty';
            echo json_encode($return);
            return;
        }
        $category = $this->categorys[$catid];
        $this->modelid  = $this->categorys[$catid]['modelid'];
        $this->db->set_model($this->modelid);
        $data['info']['status'] = 99;

        $tmp = $this->db->edit_content($data['info'], $data['info']['ContentID'], $this->from);
        if (true != $tmp) {
            $return['status'] = 0;
            $return['msg'] = 'edit is faild';
            echo json_encode($return);
            return;
        }
        echo json_encode($return);
        return;
    }

    public function add_content() {
        define('IN_ADMIN');
        $return['status'] = 1;
        $return['msg']    = 'succ';

        //获取cmsware indexid 对应内容
        $this->cmsware_db->table_name = $this->cmsware_db->db_tablepre . "content_index";
        $index_data = $this->cmsware_db->get_one('IndexID=' . $this->indexid);
        if (empty($index_data)) {
            $return['status'] = 0;
            $return['msg']    = 'no cmsware index data';
            echo json_encode($return);
            return;
        }
        $catid = $index_data['NodeID'];
        //获取siteid 
        $categorys = $this->cat_db->get_one('catid='.$catid);
        if (empty($categorys)) {
            $return['status'] = 0;
            $return['msg']    = 'no category';
            echo json_encode($return);
            return;
        }
        $this->siteid = $categorys['siteid'];
		$this->categorys = getcache('category_content_'.$this->siteid,'commons');

        //获取cmsware文章内容 
        $this->cmsware_db->table_name = $this->cmsware_db->db_tablepre . "content_{$index_data['TableID']}"; 
        $cmsware_content = $this->cmsware_db->get_one('ContentID=' . $index_data['ContentID']);
        if (empty($cmsware_content)) {
            $return['status'] = 0;
            $return['msg']    = 'no cmsware content data';
            echo json_encode($return);
            return;
        }
        //构建提交数据
        $data['info'] = $this->buildPost($cmsware_content, $catid, $index_data['TableID']);

        //开始插入phpcms内容表
        $catid = $data['info']['catid'] = intval($data['info']['catid']);
        if(empty($data['info']) || trim($data['info']['title']) == '') {
            $return['status'] = 0;
            $return['msg'] = 'title is empty';
            echo json_encode($return);
            return;
        }
        $category = $this->categorys[$catid];
        $this->modelid  = $this->categorys[$catid]['modelid'];
        $this->db->set_model($this->modelid);

        //插入mapping
        $arr = array(
            'indexid' => $index_data['IndexID'], 
            'contentid' => $index_data['ContentID'],
            'catid'     => $catid, 
            'modelid'   => $this->modelid, 
            'nodeid'    => $index_data['NodeID'], 
            'tableid'   => $index_data['TableID'],
            'siteid'    => $this->siteid, 
            'parentindexid' => $index_data['ParentIndexID'], 
            'url' => $index_data['URL'] 
        );
        $id = $this->index_map->insert_content_index($arr);
        if (!is_numeric($id)) {
            $return['status'] = 0;
            $return['msg'] = 'insert content index fail';
            echo json_encode($return);
            return;
        }
        $data['info']['status'] = 99;
        $id = $this->db->add_content($data['info'], $this->isimprot, $this->from);
        if (empty($id) || !is_numeric($id)) {
            $return['status'] = 0;
            $return['msg'] = 'sync is faild';
            echo json_encode($return);
            return;
        }
        echo json_encode($return);
        return;
    }

    public function buildPost($res, $catid, $tableid) {
        unset($tmp);
        $res['modelid'] = $this->modelid;
        $res['catid'] = $catid;
        
        if (!isset($res['ContentID']) || empty($res['ContentID'])) {
            return;
        }
        if (isset($res['PublishDate'])) {
            $res['inputtime']   = $res['PublishDate'];
        }
        $res['id'] = $res['ContentID'];
        $res['sysadd'] = 1;
        $res['username'] = $this->getusername($res['sysadd']);
        $method = "buildContent{$tableid}";
        return $this->$method($res);
    }

    public function buildRelation($v) {
        $v = trim($v);
        if (empty($v) || is_null($v) || strtolower($v) == 'null') {
            return;
        }
        $tmp = explode(',', $v);
        $relation = array();
        foreach ($tmp as $t) {
            $t = trim($t);
            if (empty($t)) continue;
            //把indexid 换成contentid
            if (is_numeric($t)) {
                $this->cmsware_db->table_name = $this->cmsware_db->db_tablepre . "content_index"; 
                $ware = $this->cmsware_db->get_one('IndexID=' . $t);
                if (empty($ware) || empty($ware['ContentID'])) {
                    continue;
                }
                $contentid = $ware['ContentID'] + 0;
                if ($contentid != 0) {
                    $relation[] = $this->modelid . ',' . $contentid;
                }
            } else {
                $relation[] = $this->modelid . ',' . $t;
            }
        }
        $res = join('|', $relation);
        return $res;
    }

    public function getusername($id) {
        $res = $this->admin_db->get_one('userid=' . $id);
        if (empty($res)) {
            return 'admin';
        }
        return $res['username'];
    }

    public function buildContent1($res) {
        if (empty($res['Title'])) {
            return;
        }
        $res['title'] = $res['Title'];
        if (isset($res['TitleColor']) && false !== strpos($res['TitleColor'], '#')) {
            $res['style_color'] = $res['TitleColor'];
        }
        $res['keywords'] = $res['Keywords'];
        $res['content'] = $res['Content'];
        $res['CustomLinks'] = $this->buildRelation($res['CustomLinks']);
        $res['SchoolID'] = $this->buildRelation($res['SchoolID']);
        $res['AbuildtID'] = $this->buildRelation($res['AbuildtID']);
        $res['Abuildt_Name'] = $this->buildRelation($res['Abuildt_Name']);
        $res['School_Name'] = $this->buildRelation($res['School_Name']);
        $res['USAER_SchoolID'] = $this->buildRelation($res['USAER_SchoolID']);
        $res['USAER_School_Name'] = $this->buildRelation($res['USAER_School_Name']);
        return $res;
    }

    public function buildContent2($res) {
        if (empty($res['Title'])) {
            return ;
        }
        $res = $res;
        $res['title'] = $res['Title'];
        $res['content'] = $res['Intro'];
        $res['CustomLinks'] = $this->buildRelation($res['CustomLinks']);
        $res['SchoolID'] = $this->buildRelation($res['SchoolID']);
        $res['CustomSoftLinks'] = $this->buildRelation($res['CustomSoftLinks']);
        return $res; 
    }
    
    public function buildContent3($res) {
        if (empty($res['E_Name'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['S_Name'];
        return $res;
    }

    public function buildContent4($res) {
        if (empty($res['DegreeType'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['DegreeType'];
        return $res;
    }

    public function buildContent5($res) {
        if (empty($res['CompanyName'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['CompanyName'];
        $res['Schools'] = $this->buildRelation($res['Schools']);
        $res['TopSchools'] = $this->buildRelation($res['TopSchools']);
        return $res;
    }
    
    public function buildContent6($res) {
        if (empty($res['UserFullname'])) {
            return;
        }
        $res = $res;
        $res['title'] = $res['UserFullname'];
        return $res;
    }

    public function buildContent7($res) {
        if (empty($res['SchoolName'])) {
            return $res;
        }
        $res['title'] = $res['SchoolName'];
        $res['SchoolID'] = $this->buildRelation($res['SchoolID']);
        $res['AbuildtID'] = $this->buildRelation($res['AbuildtID']);
        return $res;
    }

    public function buildContent8($res) {
        if (empty($res['Title'])) {
            return;
        }
        $res['title'] = $res['Title'];
        $res['AbuildtID'] = $this->buildRelation($res['AbuildtID']);
        return $res;
    }

    public function buildContent9($res) {
        if (empty($res['S_Name'])) {
            return;
        }
        $res['title'] = $res['S_Name'];
        return $res;
    }

    public function buildContent11($res) {
        if (empty($res['about_SchoolID'])) {
            return;
        }
        $res['title'] = $res['about_SchoolID'];
        $res['about_SchoolID'] = $this->buildRelation($res['about_SchoolID']);
        $res['about_SchoolName'] = $this->buildRelation($res['about_SchoolName']);
        $res['about_School_E_Name'] = $this->buildRelation($res['about_School_E_Name']);
        return $res;
    }

    public function buildContent12($res) {
        if (empty($res['SchoolID'])) {
            return;
        }
        $res['title'] = $res['SchoolID'];
        $res['SchoolID'] = $this->buildRelation($res['SchoolID']);
        $res['Link_Grade'] = $this->buildRelation($res['Link_Grade']);
        $res['Link_MajorIDs'] = $this->buildRelation($res['Link_MajorIDs']);
        return $res;
    }
}
