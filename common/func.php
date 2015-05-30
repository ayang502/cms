<?php
$replace = array( 
    '</dataSource>' => '', 
    '<dataSource>' => '',
    '<List>' => '', 
    '</List>' => '', 
    '<var>' => '', 
    '</var>' => '', 
); 
function guid(){
    if (function_exists('com_create_guid')){
        return com_create_guid();
    }else{
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        return $uuid;
    }
}
function strReplaceAssoc($replace, $subject) { 
    return str_replace(array_keys($replace), array_values($replace), $subject);    
}
function parseSelect($str) {
    global $replace;
    $str = strReplaceAssoc($replace, $str); 
    $arr = explode("\n", $str);
    foreach ($arr as $k=>$v) {
        $v = trim($v);
        if (!empty($v)) {
            $tmp = strReplaceAssoc(array('<value>'=>'', '</value>'=>'', '<title>'=>'', '</title>'=>''), $v);
            if (empty($tmp)) {
                $tmp = "";
            }
            $new[] = $tmp;
        }
    }
    $count = count($new);
    for ($i=0;$i<$count;) {
        if (!isset($new[$i+1])) {
            $insert[] = $new[$i] . '|' . '';
        } else {
            $insert[] = $new[$i] . '|' . $new[$i+1];
        }
        $i = $i+2;
    }
    return join("\n", $insert);
}
function parseSelectDefault($str) {
    $arr = explode(';', $str);
    foreach ($arr as $v) {
        $a[] = $v . '|' . $v;
    }
    return join("\n", $a);
}
function curl_post($url, $post_fields) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_COOKIEJAR, COOKIE_JAR);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_fields));
    $content = curl_exec($ch);
    curl_close($ch);
    return $content;
}
function mapUrlRule($str) {
    $url = 31;
    switch($str) {
        case  '{ContentID}.html' :
            $url = "31";
        break;
        case 'Y-m-d{TimeStamp}d{ContentID}.html' : 
            $url = "32";
        break;
        case '{TimeStamp}d{ContentID}.html' : 
            $url = "34";
        break;
        case '{IndexID}/index.html':
            $url = "35";
        break;
        case 'Y-m-d{IndexID}/index.html':
            $url = "35";
        break;
        case "[@pubSchool('{SchoolID}')]{ContentID}.html";
            $url = "31";
        break;
        case 'sitemap_{ContentID}.xml';
            $url = "33";
        break;
        case 'Y-m-d{ContentID}.html';
            $url = "31";
        break;
        case "[@strtolower(@str_replace('''-','{E_Name_s}'))].html":
            $url = "31";
        break;
        case "Y-m-d[@pubSchool('{SchoolID}')]{ContentID}.html":
            $url = "31";
        break;
    }
    return $url;
}
