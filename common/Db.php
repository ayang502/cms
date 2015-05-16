<?php
class Db {
    public function __construct ($arrConfig = null) {
        $this->_arrConfig = $arrConfig;
    }
    
    protected function _connect () {                
        $dsn = "mysql:host={$this->_arrConfig['host']};dbname={$this->_arrConfig['database']};port={$this->_arrConfig['port']};charset={$this->_arrConfig['charset']}";
        $this->_objLink = new PDO($dsn, $this->_arrConfig['username'], $this->_arrConfig['password']);
    }    
    
    public function execute ($strSql) {
        $this->_connect();
        $result = $this->_objLink->execute($strSql);
        return $result;
    }

    public function fetchAll ($strSql) {
        $this->_connect();
        $st = $this->_objLink->prepare($strSql);
        $st->execute();
        $data = $st->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
} 
