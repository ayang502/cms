<?php
defined('IN_PHPCMS') or exit('No permission resources.');
if(!defined('CACHE_MODEL_PATH')) define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

/**
 * 内容模型数据库操作类
 */
pc_base::load_sys_class('model', '', 0);
class cmsware_model extends model {
	public $table_name = '';
	public function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'cmsware';
		parent::__construct();
		$this->siteid = get_siteid();
        $this->db->query("set character_set_client=utf8");
        $this->db->query("set character_set_results=utf8");
	}
}
?>
