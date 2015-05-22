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
function strReplaceAssoc(array $replace, $subject) { 
    return str_replace(array_keys($replace), array_values($replace), $subject);    
}
function parseSelect($str) {
    $str = strReplaceAssoc($replace, $str); 
    $arr = explode("\n", $str);
    foreach ($arr as $k=>$v) {
        $v = trim($v);
        if (!empty($v)) {
            $tmp = strReplaceAssoc(array('<value>'=>'', '</value>'=>'', '<title>'=>'', '</title>'=>''), $v);
            $new[] = $tmp;
        }
    }
    $count = count($new);
    for ($i=0;$i<$count/2;$i++) {
        $insert[] = $new[$i] . '|' . $new[$i+1];
    }
    return $insert;
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
