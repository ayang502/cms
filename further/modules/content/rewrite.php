<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_app_func('util','content');


class rewrite {
    private $db;
    private $not_found = '/404.html';
	function __construct() {
		$this->db        = pc_base::load_model('content_model');
        $this->index_map = pc_base::load_model('index_mapping_model');
	}

    public function run() {
        $uri = $_GET['uri'];
        if (empty($uri)) {
            header("Location::/{$this->not_found}");
        }
        $uri = 'http://down.uker.net/school/16.html';
        $uri = 'http://down.uker.net/publish/content.php/21,0.html';
        //获取uri对应的文章
        $res = $this->index_map->get_one("url='{$uri}'");
        //如果没找到，可能是没有域名，再找一遍
        if (empty($res)) {
            $urlinfo = parse_url($uri);
            $uri = str_replace($urlinfo['scheme']."://", '', $uri);
            $uri = str_replace($urlinfo['host'], '', $uri);
        }
        $res = $this->index_map->get_one("url='{$uri}'");
        if (empty($res)) {
            header("Location::/{$this->not_found}");
        }
        //跳转到真正的页面
        $this->db->set_model($res['modelid']);
        $res = $this->db->get_one("id={$res['contentid']}");
        if (!empty($res) && isset($res['url'])) {
            header("Location:{$res['url']}");
            exit;
        }
        header("Location::/{$this->not_found}");
    }
}
