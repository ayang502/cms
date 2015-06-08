<?php
//迁移站点设置
class sites extends base {
    private $dir = array(
        '中英网UKER.net'  => "www",
        '内部调用'        => "/",
        '中美网USAer.net' => "usaer",
        '澳大利亚'        => 'aus',
        '平台合作'        => 'channel',
    );

    private $setting = 
        array (
            'upload_maxsize' => '2048',
            'upload_allowext' => 'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf',
            'watermark_enable' => '1',
            'watermark_minwidth' => '300',
            'watermark_minheight' => '300',
            'watermark_img' => 'statics/images/water//mark.png',
            'watermark_pct' => '85',
            'watermark_quality' => '80',
            'watermark_pos' => '9',
        );
    public function __construct() {
        $this->wdb = helper::getDB('cmsware');
        $this->getBaseWareSites();
        $this->getcmsware_psn();
    }

    public function insertCmsSite() {
        foreach ($this->sites as $v) {
            if ($v['Name'] == '采集文章') {
                continue;
            }
            if ($v['Name'] == '废弃节点') {
                continue;
            }
            if ($v['Name'] == 'SEO运营') {
                continue;
            }
            $arr = array();
            $a =  $style = '';
            if (!empty($v['ResourcePSN'])) {
                $a = explode('}', $v['ResourcePSN']);
                $a = substr($a[0], 5);
                $arr['domain'] = $this->psn[$a]['URL'];
                $arr['dirname'] = $this->dir[$v['Name']];
            } else {
                $arr['domain'] = '';
                $arr['dirname'] = "html_{$v['NodeID']}"; 
            }
            $arr['siteid'] = $v['NodeID'];
            $arr['name'] = $v['Name'];
            $arr['site_title'] = $v['Name'];
            $arr['uuid'] = guid();
            $arr['setting'] = $this->setting;
            if (!empty($v['IndexTpl'])) {
                $v['IndexTpl'] = ltrim($v['IndexTpl'], "/");
                $a = explode("/", $v['IndexTpl']);
                $style = array_shift($a);
            } else {
                $style = 'default';
            }
            $arr['default_style'] = $style;
            $arr['template'] = $style;
            $res[] = $arr;
        }
        return $res;
    }
}
