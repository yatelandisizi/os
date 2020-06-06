<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Soft extends controller
{
    public function index($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        if(!session('username')){
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
        $this->assign('huanying',$huanying);
        }
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list=Db::name('soft')->select();
        $this->assign('list',$list);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function soft($huanying = '欢迎:')
    {
        $id=input("id");
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        if(!session('username')){
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
        $this->assign('huanying',$huanying);
        }
        if(session('username')){
            $this->assign('yonghu',$yonghu=session('username'));
        }else{
        $this->assign('yonghu',$yonghu='null');
        }

        $list=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list',$list);//显示所有win10版本的系统名字
        $list1=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list1',$list1);//显示所有win8版本的系统名字
        $list2=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list2',$list2);//用于win7url地址
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();
        $this->assign('list7',$list7);//用于win7url地址
        $list8=Db::name('soft')->find($id);
        $this->assign('list8',$list8);//显示软件信息
        $list9=Db::name('book')->where('type','=',$id)->order('zan desc')->order('cai asc')->select();
        $this->assign('list9',$list9);//显示留言
        $list10=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('list10',$list10);
        return $this->fetch();
    }
    public function login()
    {
        return $this->success('跳转登录中...','login/index');
    }
    public function book()
    {
        if(session('username')==null){
            $this->error('留言失败,请先登录');
        }else{
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'book'=>input('book'),
            'date'=>date("Y-m-d H:i:s"),
            'username'=>input('username'),
            'zan'=>input('zan'),
            'photo'=>input('photo'),
            'cai'=>input('cai'),
            'type'=>input('type'),
            'softname'=>input('softname')
            ];
            if(Db::name('book')->insert($data)){
                $this->success('留言成功');
            }else{
                $this->error('留言失败');
            }
        }
        }
    }
    public function zan()
    {
        $id=input('id');
        $user=input('user');
        if($list3=Db::name('bookshuangji')->where('bookid','=',$id)->where('user','=',$user)->find()){
            $this->error('您已经点击过');
        }else if($user=='null'){
            $this->error('请您先登录');
        }else{
        $list1=Db::name('book')->where('id','=',$id)->setInc('zan',1);//数据表book字段+1
        $data=['bookid'=>$id,'user'=>$user,];
        if(Db::name('bookshuangji')->insert($data)){
                $this->success('点赞成功');
            }else{
                $this->success('点赞失败');
                }
        }
    }
    public function cai()
    {
        $id=input('id');
        $user=input('user');
        if($list3=Db::name('bookshuangji')->where('bookid','=',$id)->where('user','=',$user)->find()){
            $this->error('您已经点击过');
        }else if($user=='null'){
            $this->error('请您先登录');
        }else{
        $list1=Db::name('book')->where('id','=',$id)->setInc('cai',1);//数据表book字段+1
        $data=['bookid'=>$id,'user'=>$user,];
        if(Db::name('bookshuangji')->insert($data)){
                $this->success('点踩成功');
            }else{
                $this->success('点赞失败');
                }
        }
    }
    public function bookguanli($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        if(!session('username')){
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
        $this->assign('huanying',$huanying);
        }
        if(session('username')){
            $this->assign('yonghu',$yonghu=session('username'));
        }else{
        $this->assign('yonghu',$yonghu='null');
        }
        $list=Db::name('windows')->where('upbanben','=','windows10')->select();//显示所有win10版本的系统名字
        $this->assign('list',$list);
        $list1=Db::name('windows')->where('upbanben','=','windows8')->select();//显示所有win8版本的系统名字
        $this->assign('list1',$list1);
        $list2=Db::name('windows')->where('upbanben','=','windows7')->find();//用于win7url地址
        $this->assign('list2',$list2);
        $list3=Db::name('foot')->find();//尾部显示
        $this->assign('list3',$list3);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->select();//显示所有win10版本的系统名字
        $this->assign('list5',$list5);
        $list6=Db::name('windows')->where('upbanben','=','windows8')->select();//显示所有win8版本的系统名字
        $this->assign('list6',$list6);
        $list7=Db::name('windows')->where('upbanben','=','windows7')->find();//用于win7url地址
        $this->assign('list7',$list7);
        $list9=Db::name('book')->where('username','=',session('username'))->paginate(10);//分页显示留言
        $this->assign('list9', $list9);
        $list10=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('list10',$list10);
        return $this->fetch();
    }
    public function bookdel()
    {
        $id=input('id');
        if($list=Db::name('book')->delete($id)){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    public function download()
    {
        $con=Db::name('user')->where('username',session('username'))->find();
        $num=$con['jifen'];
        $id=input('id');
        //$num=Db::name('user')->where('username','=',session('username'))->field('jifen')->find();
        if($num>=20){
            if(!session('username')){
                $this->assign('user',$user='null');
                }else{
                    $this->assign('user',$user=session('username'));
                }
            $list1=Db::name('user')->where('username','=',session('username'))->setDec('jifen',20);//数据表jifen字段-20
            $list=Db::name('soft')->find($id);
            $this->assign('list',$list);
            $list3=Db::name('foot')->find();
            $this->assign('list3',$list3);
            Db::name('soft')->where('id','=',$id)->setInc('frequency');
        }else{
            $this->error('积分不足或请先登录');
        }
        return $this->fetch();
    }
    public function softshoucang()
    {
        if(request()->isPost()){
            $data=[
            'userid'=>input('userid'),
            'photo'=>input('photo'),
            'name'=>input('name'),
            'type'=>input('type'),
            'softid'=>input('softid')
            ];
            if(Db::name('softshoucang')->insert($data)){
                $this->success('收藏成功');
            }else{
                $this->error('收藏失败');
            }
        }
    }
    public function shoucang($huanying = '欢迎:')
    {
        $username=session('username');
        $soft=Db::name('softshoucang')->where('userid','=',$username)->select();
        $this->assign('soft',$soft);
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        if(!session('username')){
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
        $this->assign('huanying',$huanying);
        }
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
}
