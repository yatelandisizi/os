<?php
namespace app\index\controller;

use think\Controller;
use app\index\model\User;
use think\Db;

class Login extends controller
{
    public function index()
    {
        if(request()->isPost()){
            $user=new User();
            $data=input('post.');
            $num=$user->login($data);
            if($num==1){
                return $this->success('登录成功','index/index');
            }elseif($num==2){
                return $this->error('用户名或密码错误','login/index');
            }elseif($num==3){
                return $this->error('用户不存在','login/index');
            }elseif($num==4){
                return $this->error('验证码错误','login/index');
            }
        }
        return $this->fetch();
    }
    public function logout()
    {
        session(null);
        return $this->success('退出成功','index/index');
    }
}
