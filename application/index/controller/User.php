<?php 
namespace app\index\Controller;
use think\Controller;
use think\Db;
require 'Base.php';
class User extends Base
{
    public function index($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        $this->assign('huanying',$huanying);
        }
        $id=input('id');
        $list=Db::name('user')->where('id','=',$id)->find();
        $this->assign('list',$list);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function userupdata($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $this->assign('huanying',$huanying);
        $list=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('list',$list);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'username'=>input('username'),
            'password'=>md5(input('password')),
            'email'=>input('email'),
            'weixin'=>input('weixin'),
            'guojia'=>input('guojia'),
            'pro'=>input('pro'),
            'city'=>input('city'),
            'county'=>input('county'),
            'phone'=>input('phone'),
            'QQ'=>input('QQ'),
            'question'=>input('question'),
            'answer'=>input('answer'),
            'photo'=>input('photo'),
            'jifen'=>input('jifen')
            ];
            if(Db::name('user')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function userziliao($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $this->assign('huanying',$huanying);
        $list=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('list',$list);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function userphotoupdata($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $this->assign('huanying',$huanying);
        $list=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('list',$list);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function userphotoupdatainfo($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $this->assign('huanying',$huanying);
        $id=input('id');
        $list=Db::name('user')->find($id);
        $this->assign('list',$list);
        $file = request()->file('files');
        if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'userphoto');
        if($info){
            $a=('/os/public/userphoto/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
            $a='未选择任何图片';
            $this->assign('a',$a);
            }
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function userphotoupdatainfointo()
    {
        $id=input('id');
        $photo=input('photo');
        if($list=DB::name('user')->where('id','=',$id)->setField('photo', $photo))
        {
            $this->success('修改成功','user/index');
        }else{
            $this->error('修改失败','user/index');
        }
    }
    public function userbook($huanying = '欢迎:')
    {
        if(session('username')){
            $this->assign('yonghu',$yonghu=session('username'));
        }else{
        $this->assign('yonghu',$yonghu='null');
        }
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        $this->assign('huanying',$huanying);
        }
        $id=input('id');
        $list=Db::name('user')->where('id','=',$id)->find();
        $this->assign('list',$list);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        $list9=Db::name('book')->where('username','=',session('username'))->select();//显示留言
        $this->assign('list9',$list9);
        return $this->fetch();
    }
}