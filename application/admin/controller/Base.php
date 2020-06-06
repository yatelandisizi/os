<?php
namespace app\admin\controller;
use think\Controller;
class Base extends Controller
{
    public function _initialize(){
        if(!session('name')){
            $this->error('请先登录系统！','Login/index');//强制进入登录页面
        }
    }
}