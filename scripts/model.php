<?php
class model extends base {
    public function run() {
        $this->default = require __DIR__ . "/default_model_field.php";
        
    }
    public function deleteModel() {
        $sql = "delete from {$this->table}_model where modelid > 10";
        $r = $this->cdb->execute($sql);
    }
    public function getModelName() {
        $sql = "select * from v9_site";
        $res = $this->cdb->fetchAll($sql);
        foreach ($res as $vv) {
            $siteid = $vv['siteid'];
            $sql = "select * from cmsware_content_table";
            $rs = $this->wdb->fetchAll($sql);
            $arr = array();
            foreach ($rs as $k=>$v) {
                $arr[$k]['siteid'] = $siteid;
                $arr[$k]['name'] = $v['Name'];
                $arr[$k]['tablename'] = 'content_' . $siteid . '_' . $v['TableID'];
                $result[$siteid] = $arr;
            }
        }
        return $result;
    }
    
    public function syncModelField($siteid) {
        $sql = "select * from cmsware_content_fields order by TableID asc"; 
        $res = $this->wdb->fetchAll($sql);
        $arr = $this->default;
        foreach ($res as $k=>$v) {
            $tmp =  $this->getSome($v['FieldInputPicker']); 
            if (!empty($tmp)) {
                $tmp['formtype'] = $ttt['formtype'];
                $tmp['setting'] = $ttt['setting'];
                $tmp['setting'] = str_replace("#relation#", $v['FieldName'], $tmp['setting']);
            }

            $tmp['siteid'] = $siteid;
            $tmp['field'] = $v['FieldName'];
            $tmp['name'] = $v['FieldTitle'];
            $tmp['minlength'] = 0;
            $tmp['minlength'] = $v['FieldSize'];;
            
            $tmp['issearch'] = $v['FieldSearchable'];
            $arr = array();
            if ($v['IsTitleField'] == 1) {
                continue;
            }
            if ($v['FieldName'] == 'Keywords') {
                continue;
            }
            $tmp['formtype'] = 'text';
            $res = $this->getSetting($v);
            if (!empty($res)) {
                $tmp['setting'] = $res;
            }
            print_r($tmp);
            exit;
        }
    }
    /*
    public function getSetting($v) {
        if ($v['FieldInput'] == 'select') {
            if (!empty($v['FieldDefaultValue'])) {
                $default = parseSelectDefault($v['FieldDefaultValue']);
            }
            if (!empty($v['FieldDescription'])) {
                $default = parseSelectDefault($v['FieldDefaultValue']);
            }
            return array2string(array (
                'options' => {$default},
                'boxtype' => 'select',
                'fieldtype' => 'varchar',
                'minnumber' => '1',
                'width' => '80',
                'size' => '1',
                'defaultvalue' => '',
                'outputtype' => '1',
            ));
        }
        return '';
    }
    public function getSome($FieldInputPicker) {
        $tmp = array();
        if ($FieldInputPicker == 'upload') {
            $tmp['formtype'] = 'image';
            $tmp['setting'] = array (
                'size' => '50',
                'defaultvalue' => '',
                'show_type' => '1',
                'upload_maxsize' => '1024',
                'upload_allowext' => 'jpg|jpeg|gif|png|bmp',
                'watermark' => '0',
                'isselectimage' => '1',
                'images_width' => '',
                'images_height' => '',
            );
        }
        if ($FieldInputPicker == 'upload_attach') {
            $tmp['formtype'] == 'downfiles';
            $tmp['setting'] = array (
                'upload_allowext' => 'zip|rar|doc|xls|txt|jpg|gif|pdf|ppt',
                'isselectimage' => '1',
                'upload_number' => '10',
                'downloadlink' => '1',
                'downloadtype' => '1',
            );
        }
        if ($FieldInputPicker == 'content') {
            $tmp['formtype'] = 'omnipotent';
            $tmp['setting'] = array (
                    'formtext' => '<input type=\'hidden\' name=\'info[#relation#]\' id=\'#relation#\' value=\'{FIELD_VALUE}\' style=\'50\' >
                    <ul class=\"list-dot\" id=\"#relation#_text\"></ul>
                    <div>
                    <input type=\'button\' value=\"添加相关\" onclick=\"omnipotent(\'selectid\',\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\',\'添加相关\',1)\" class=\"button\" style=\"width:66px;\">
                    <span class=\"edit_content\">
                    <input type=\'button\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">
                    </span>
                    </div>',
                    'fieldtype' => 'varchar',
                    'minnumber' => '1',
            );
            $tmp['isomnipotent'] = 1;
        }
        if (isset($tmp['setting'])) {
            $tmp['setting'] = array2string($tmp['setting']);
        }

        return $tmp;
    }
     */
}
