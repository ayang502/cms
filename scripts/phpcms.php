<?php
class phpcms {
    public function loginCms() {
        $post_fields['username'] =  USERNAME;
        $post_fields['password'] = PASSWD;
        $post_fields['code'] = 'abcd';
        $url = LOGINURL . '&dosubmit=1';
        $res = curl_post($url, $post_fields);
        if (!strpos($res, "登录成功")) {
            exit("登录失败了");
        }
        return $res;
    }
}
