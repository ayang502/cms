<?php
class model extends base {
    public function __construct() {
        parent::__construct();
        $this->field2formtype = array(
            'text'       => 'text',
            'RichEditor' => 'editor',
            'textaera'   => 'textarea',
            'select'     => 'box',
            'checkbox'   => 'box',
        );
        $this->default = require __DIR__ . "/default_model_field.php";
        
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
    public function getCMModel() {
        $sql = "select * from cmsware_content_table";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $v) {
            $this->cmmodel[$v['TableID']] = $v['Name'];
        }
    }
    public function getCmsModelID($name, $siteid) {
        $sql = "select * from {$this->table}_model where name='{$name}' and siteid={$siteid}";
        $res = $this->cdb->fetchOne($sql);
        return $res;
    }
    public function getModelField($siteid) {
        $this->getCMModel();
        $sql = "select * from cmsware_content_fields order by TableID asc"; 
        $res = $this->wdb->fetchAll($sql);
        $arr = $this->default;
        foreach ($res as $k=>$v) {
            if ($v['IsTitleField'] == 1) {
                continue;
            }
            
            /*
            if (strtolower($v['FieldName']) == 'customlinks') {
                continue;
            }
            if ($v['FieldName'] == 'Keywords') {
                continue;
            }
            if ($v['FieldName'] == 'Intro') {
                continue;
            }
            */
            if ($v['FieldName'] == 'TitleColor') {
                continue;
            }

            $tmp = array();
            $modelname = $this->cmmodel[$v['TableID']];
            $model = $this->getCmsModelID($modelname, $siteid);
            $tmp =  $this->getSepcSetting($v); 
            
            if (isset($tmp['formtype']) && !empty($tmp['formtype'])) {
                $tmp['formtype'] = $tmp['formtype'];
            } else {
                $tmp['formtype'] = $this->field2formtype[$v['FieldInput']];
            }
            if (isset($tmp['setting']) && !empty($tmp['setting'])) {
                $tmp['setting'] = $tmp['setting'];
                $tmp['setting'] = str_replace("#relation#", $v['FieldName'], $tmp['setting']);
            }
            $tmp['siteid'] = $siteid;
            $tmp['field'] = $v['FieldName'];
            $tmp['name'] = $v['FieldTitle'];
            $tmp['minlength'] = 0;
            if ($v['FieldType'] == 'longtext') {
                $tmp['maxlength'] = '';
            } elseif ($v['FieldType'] == 'mediumtext') {
                $tmp['maxlength'] = '';
            } else if (empty($v['FieldSize'])) {
                $tmp['maxlength'] = '';
            } else {
                $tmp['maxlength'] = intval($v['FieldSize']);
            }
            $tmp['issearch'] = $v['FieldSearchable'];
            $tmp['modelid'] = $model['modelid'];
            $tmp['tablename'] = $model['tablename'];
            $tmp['issystem'] = 0;
            $tmp['isbase'] = 1;
            $tmp['isadd'] = 1;
            $tmp['listorder'] = 19;

            if ($v['FieldName'] == 'Editor') {
                $tmp['maxlength'] = 40;
            }
            if (strtolower($v['FieldName']) == 'content') {
                $sql = "update {$this->table}_model_field set disabled=0 where field = 'content' and modelid={$tmp['modelid']};\n";
                error_log($sql, 3, "alter.sql");
                continue;
            }
            if ($v['FieldSize'] == 0 && $tmp['formtype'] == 'text') {
                $tmp['formtype'] = 'textarea';
            }
            $return[] = $tmp;
        }
        return $return;
    }

    public function getSepcSetting($v) {
        $tmp = array();
        if ($v['FieldInputPicker'] == 'upload') {
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
            return $tmp;
        }
        if ($v['FieldInputPicker'] == 'upload_attach') {
            $tmp['formtype'] = 'downfiles';
            $tmp['setting'] = array (
                'upload_allowext' => 'zip|rar|doc|xls|txt|jpg|gif|pdf|ppt',
                'isselectimage' => '1',
                'upload_number' => '10',
                'downloadlink' => '1',
                'downloadtype' => '1',
            );
            return $tmp;
        }
        if ($v['FieldInputPicker'] == 'content' || $v['FieldType'] == 'contentlink') {
            $tmp['formtype'] = 'omnipotent';
            $tmp['setting'] = array (
                    'formtext' => "<input type='hidden' name='info[#relation#]' id='#relation#' value='{FIELD_VALUE}' style='50'>
                    <ul class=\"list-dot\" id=\"#relation#_text\"></ul>
                    <div>
                    <input type='button' value=\"添加相关\" onclick=\"omnipotent('selectid','?m=content&c=content&a=public_relationlist&modelid={MODELID}','添加相关',1)\" class=\"button\" style=\"width:66px;\">
                    <span class=\"edit_content\">
                    <input type='button' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">
                    </span>
                    </div>",
                    'fieldtype' => 'varchar',
                    'minnumber' => '1',
            );
            $tmp['isomnipotent'] = 0;
            return $tmp;
        }
        if ($v['FieldInput'] == 'select' || $v['FieldInput'] == 'checkbox' || $v['FieldInputPicker'] == 'dsn_content') {
            if (!empty($v['FieldDefaultValue'])) {
                $default = parseSelectDefault($v['FieldDefaultValue']);
            }
            if (!empty($v['FieldDescription']) || false !== strpos($v['FieldDescription'], '<value>')) {
                $default = parseSelect($v['FieldDescription']);
            }
            $tmp['setting'] = array (
                'fieldtype' => 'varchar',
                'minnumber' => '1',
                'width' => '80',
                'size' => '1',
                'defaultvalue' => '',
                'outputtype' => '1',
            );
            if (!empty($default)) {
                $tmp['setting']['options'] = $default;
            }
            if ($v['FieldInput'] == 'select') {
                $tmp['setting']['boxtype'] = 'select';
            } else if ($v['FieldInput'] == 'checkbox') {
                $tmp['setting']['boxtype'] = 'checkbox';
            } else {
                $tmp['setting']['boxtype'] = 'select';
            }
            if ($v['FieldInputPicker'] == 'dsn_content') {
                $tmp['formtype'] = 'box';
            }else {
                $tmp['formtype'] = $this->field2formtype[$v['FieldInput']];
            }
            return $tmp;
        }
    }
}
