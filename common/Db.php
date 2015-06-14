<?php
class Db {
    public $_objLink = '';
    public function __construct ($arrConfig = null) {
        $this->_arrConfig = $arrConfig;
    }
    
    public function _connect () {                
        if (!$this->_objLink) {
            $dsn = "mysql:host={$this->_arrConfig['host']};dbname={$this->_arrConfig['database']};port={$this->_arrConfig['port']};charset={$this->_arrConfig['charset']}";
            try {
                $this->_objLink = new PDO($dsn, $this->_arrConfig['username'], $this->_arrConfig['password']);
            } catch (PDOException $e)  {
                $this->_objLink = new PDO($dsn, $this->_arrConfig['username'], $this->_arrConfig['password']);
                echo $e->getMessage();
            }
            $this->_objLink->exec("set names 'utf8' ");
            $this->_objLink->exec("set character_set_client=utf8");
            $this->_objLink->exec("set character_set_results=utf8");
        }
    }    
    
    public function execute ($strSql) {
        $this->_connect();
        $result = $this->_objLink->exec($strSql);
        return $result;
    }

    public function fetchAll ($strSql) {
        $this->_connect();
        $st = $this->_objLink->prepare($strSql);
        $st->execute();
        $data = $st->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
    public function fetchOne($strSql) {
        $this->_connect();
        $st = $this->_objLink->prepare($strSql);
        $st->execute();
        $data = $st->fetch(PDO::FETCH_ASSOC);
        return $data;
    }

    public function insert($table, $arr) {
        $keys = array_keys($arr);
        $f = '(`' . join('`,`', $keys) . '`)';
        $v = "\"" . join("\",\"", $arr) . "\"";
        $sql = "insert into {$table} {$f} values({$v})";
        $this->_connect();
        $res = $this->_objLink->exec($sql);
        if (!$res) {
            echo $sql;
            echo "\n";
            return false;
        }
        return $res;
    }
    public function update($table, $arr, $where) {
        $sql = "update {$table} set ";
        foreach ($arr as $k=>$v) {
            $tmp[] = $k . '="'.$v.'"';
        }
        $sql .= join(',', $tmp);
        if (!empty($where)) {
            $sql .= ' where ' . $where; 
        }
        $this->_connect();
        return $this->_objLink->exec($sql);
    }
    public function insertBatch($table ,$arr) {
        $keys = array_keys($arr[0]);
        $f = '(`' . join('`,`', $keys) . '`)';
        foreach ($arr as $v) {
            $d[] = "('" . join("','", $v) . "')";
        }
        $sql = "insert into {$table} {$f} values ".join(',', $d);
        $this->_connect();
        $res = $this->_objLink->exec($sql);
        if (!$res) {
            echo $sql;
            echo "\n";
            return false;
        }
        return $res;
    }

    public function truncateTable($table) {
        $sql = "truncate table {$table}";
        $this->_connect();
        return $this->_objLink->exec($sql);

    }

    public function dropTable($table) {
        $sql = "drop table {$table}";
        $this->_connect();
        return $this->_objLink->exec($sql);
    }
} 
