<?php
class adminuser extends base {
    public function addRole() {
        $sql = "delete from {$this->table}_admin_role where roleid>1";
        $this->cdb->execute($sql);

        $sql = "select * from cmsware_group where gId > 1";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $v) {
            $tmp = array();
            $tmp['roleid'] = $v['gId'];
            $tmp['rolename'] = $v['gName'];
            $tmp['description'] = $v['gName'];
            $tmp['disabled'] = 0;
            $return[] = $tmp;
        }
        return $return;
    }
    public function addUser() {
        $sql = "delete from {$this->table}_admin where userid > 1";
        $this->cdb->execute($sql);

        $sql = "select  *from cmsware_user";
        $res = $this->wdb->fetchAll($sql);
        foreach ($res as $v) {
            $tmp = array();
            $tmp['userid'] = $v['uId'];
            $tmp['username'] = $v['uName'];
            $tmp['realname'] = $v['uName'];
            $tmp['password'] = "123123"; 
            $tmp['pwdconfirm'] = "123123";
            $tmp['roleid'] = $v['uGId'];
            $tmp['email'] = "a@a.com";
            $tmp['lastlogintime'] = $v['LastLoginDate'];
            $return[] = $tmp;
        }
        return $return;
    }
}
