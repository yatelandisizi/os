<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
class Index extends controller
{
    public function index($huanying = '欢迎:',$denglu='登录',$zhuxiao='登出',$qiandao='签到')
    {
    	if(!session('username')){
    		$this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
    		$this->assign('denglu',$denglu);
    		$this->assign('zhuxiao',$zhuxiao='');
            $this->assign('qiandao',$qiandao='');
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
    	}else{
    	$this->assign('huanying',$huanying);
    	$this->assign('denglu',$denglu='');
    	$this->assign('zhuxiao',$zhuxiao);
        $this->assign('qiandao',$qiandao);
        $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
        $this->assign('list12',$list12);
        }
        $list=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list',$list);//显示所有win10版本的系统名字
        $list1=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list1',$list1);//显示所有win8版本的系统名字
        $list2=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list2',$list2);//用于win7url地址
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//显示网页尾部信息
        $list16=Db::name('index')->find();
        $this->assign('list16',$list16);//用于显示前端新版系统下载
        $list4=Db::name('win')->where('winbanben','=',$list16['winbanben'])->where('wei=64')->order('shunxu asc')->select();
        $this->assign('list4',$list4);//显示win10 64位系统
        $list5=Db::name('win')->where('winbanben','=',$list16['winbanben'])->where('wei=32')->order('shunxu asc')->select();
        $this->assign('list5',$list5);//显示win10 64位系统
        $list6=Db::name('winnews')->find();//显示windows的新闻
        $this->assign('list6',$list6);
        $list7=Db::name('win10')->find();//显示win10新闻
        $this->assign('list7',$list7);
        $list8=Db::name('win8')->find();//显示win8新闻
        $this->assign('list8',$list8);
        $list9=Db::name('win7')->find();//显示win7新闻
        $this->assign('list9',$list9);
        $list10=Db::name('ubuntu')->find();//显示ubuntu新闻
        $this->assign('list10',$list10);
        $list11=Db::name('movie')->find();//播放电影
        $this->assign('list11',$list11);
        $list13=Db::name('redhat')->find();//显示redhat新闻
        $this->assign('list13',$list13);
        $list14=Db::name('fedora')->find();//显示fedora新闻
        $this->assign('list14',$list14);
        $list15=Db::name('raspbain')->find();//显示raspbain新闻
        $this->assign('list15',$list15);
        $list17=Db::name('mac')->find();//显示mac新闻
        $this->assign('list17',$list17);
        $wincount=Db::name('win')->count('id');//查询win数据表中的数据条数
        $softcount=Db::name('soft')->count('id');//查询win数据表中的数据条数
        $filecount=$wincount+$softcount;
        $this->assign('filecount',$filecount);
        $downloadcount=Db::name('soft')->sum('frequency');//显示下载次数
        $this->assign('downloadcount',$downloadcount);
        $pa=$downloadcount/$filecount;
        $pa=$pa*10;
        $this->assign('pa',$pa);
        return $this->fetch();
    }
     public function login()
    {
        return $this->success('跳转登录中...','login/index');
    }
    public function windows10($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $upbanben=input('upbanben');
        $winbanben=input('winbanben');//获取查找参数
        $list=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->find();
        $this->assign('list',$list);//显示该网页基本信息
        $list4=Db::name('windows')->where('winbanben','=',$winbanben)->find();
        $this->assign('list4',$list4);//显示系统标题
        $list1=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list1',$list1);//找出所有该win10系统版本的内容
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
    	if(!session('username')){
    		$this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
    	}else{
    	$this->assign('huanying',$huanying);
        }//判断用户是否登录
    	return $this->fetch();
    }
    public function windows8($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $upbanben=input('upbanben');
        $winbanben=input('winbanben');
        $list=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->find();
        $this->assign('list',$list);//显示网页基本信息
        $list2=Db::name('windows')->where('winbanben','=',$winbanben)->find();
        $this->assign('list2',$list2);//显示系统标题
        $list1=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list1',$list1);//找出所有该win8系统版本的内容
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);//尾部显示
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
    	if(!session('username')){
    		$this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
    	}else{
    	$this->assign('huanying',$huanying);
        }
    	return $this->fetch();
    }
    public function windows7($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $upbanben=input('upbanben');
        $winbanben=input('winbanben');
        $list=Db::name('win')->where('upbanben','=',$upbanben)->find();
        $this->assign('list',$list);//显示网页基本信息
        $list2=Db::name('windows')->where('winbanben','=',$winbanben)->find();
        $this->assign('list2',$list2);//显示系统标题
        $list1=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list1',$list1);//找出所有该win7系统版本的内容
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
    	if(!session('username')){
    		$this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
    	}else{
    	$this->assign('huanying',$huanying);
        }
    	return $this->fetch();
    }
    public function ziti()
    {
        return $this->fetch();
    }
    public function services($huanying = '欢迎:')
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
        return $this->fetch();
    }
    public function contact($huanying = '欢迎:')
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
        $this->assign('list3',$list3);//显示网页尾部信息
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function soft($huanying = '欢迎:')
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
        $list=Db::name('soft')->paginate(15);
        $this->assign('list',$list);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
        return $this->fetch();
    }
    public function raspberryshow($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        }
        $list1=Db::name('win')->where('upbanben','=','windows10')->where('winbanben','=','chuangyizhe')->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list1',$list1);
        $list2=Db::name('win')->where('upbanben','=','windows10')->where('winbanben','=','zhounian')->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list2',$list2);
        $list3=Db::name('foot')->find();
        $this->assign('list3',$list3);
        $list5=Db::name('windows')->where('upbanben','=','windows10')->order('id desc')->select();
        $this->assign('list5',$list5);//显示所有win10版本的系统名字
        $list6=Db::name('windows')->where('upbanben','=','windows8')->order('id desc')->select();
        $this->assign('list6',$list6);//显示所有win8版本的系统名字
        $list7=Db::name('windows')->where('upbanben','=','windows7')->order('id desc')->find();
        $this->assign('list7',$list7);//用于win7url地址
        if(!session('username')){
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
        }else{
        $this->assign('huanying',$huanying);
        }
        return $this->fetch();
    }
    public function upload(){
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('image');
    
    // 移动到框架应用根目录/public/uploads/ 目录下
    if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            echo $info->getExtension();
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getSaveName();
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename(); 
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }

        }
        return $this->fetch();
    }
    public function jifen()
    {
        $id=input('id');
        $list1=Db::name('user')->where('id','=',$id)->setInc('jifen',20);//数据表book字段+1
        $this->success('成功领取20积分');
    }
    public function search($huanying = '欢迎:'){
        $request = input('name');
        if($search=Db::name('soft')->where('name','=',$request)->find()){
            $this->assign('search',$search);
        }else{
            $this->error('暂时没有此资源','index/index');
        }
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
