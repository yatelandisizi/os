<?php 
namespace app\index\Controller;

use think\Controller;
use think\Db;
use think\Request;

/**
* 
*/
class Download extends Controller
{
	public function win($huanying = '欢迎:')
	{
		if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
            $this->assign('user',$user='null');
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
            $this->assign('user',$user=session('username'));
            $this->assign('huanying',$huanying);
        }
        
		$id=input('id');
		$list=Db::name('win')->find($id);
		$this->assign('list',$list);
		$list3=Db::name('foot')->find();
        $this->assign('list3',$list3);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
        Db::name('win')->where('id','=',$id)->setInc('frequency');
		return $this->fetch();
	}
}
