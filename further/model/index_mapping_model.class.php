<?php

defined('IN_PHPCMS') or exit('No permission resources.');
if(!defined('CACHE_MODEL_PATH')) define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

/**
 * 内容模型数据库操作类
 */
pc_base::load_sys_class('model', '', 0);

class index_mapping_model extends model {
	public $table_name = '';
	public $category = '';
	public function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'default';
		parent::__construct();
        $this->table_name = $this->db_tablepre . 'index_mapping';
	}

    public function insert_content_index($arr) {
        $id = $this->insert($arr, true);  
        return $id;
    }
}
