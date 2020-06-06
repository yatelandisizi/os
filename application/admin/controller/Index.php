<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Index extends Base
{
    public function index()
    {
        return $this->fetch();
    }
    public function shiyan()
    {
        return $this->fetch();
    }
    public function shiyantext()
    {

        $name=input('name');
        $pass=input('pass');
        $this->assign('name',$name);
        $this->assign('pass',$pass);
        $file1 = request()->file('file1');
        $name1 = $file1->getInfo()['name'];
        if($file1){
        $info1 = $file1->move(ROOT_PATH . 'public' . DS . 'shiyanfile');
        $file1->move('/home/www/upload/',$name1); 
        if($info1){
            $a=('/os/public/shiyanfile/'.$name1);
            $this->assign('a',$a);
        }else{
            echo $file1->getError();
            }
        }else{
            $a='未选择任何图片';
            $this->assign('a',$a);
            }
        $file2 = request()->file('file2');
        if($file2){
        $info2 = $file2->move(ROOT_PATH . 'public' . DS . 'shiyanfile');
        if($info2){
            $b=('/os/public/shiyanfile/'.$info2->getSaveName());
            $this->assign('b',$b);
        }else{
            echo $file2->getError();
            }
        }else{
            $b='未选择任何图片';
            $this->assign('b',$b);
            }
        $file3 = request()->file('file3');
        if($file3){
        $info3 = $file3->move(ROOT_PATH . 'public' . DS . 'shiyanfile');
        if($info3){
            $c=('/os/public/shiyanfile/'.$info3->getSaveName());
            $this->assign('c',$c);
        }else{
            echo $file3->getError();
            }
        }else{
            $c='未选择任何图片';
            $this->assign('c',$c);
            }
        $file4 = request()->file('file4');
        if($file4){
        $info4 = $file4->move(ROOT_PATH . 'public' . DS . 'shiyanfile');
        if($info4){
            $d=('/os/public/shiyanfile/'.$info4->getSaveName());
            $this->assign('d',$d);
        }else{
            echo $file4->getError();
            }
        }else{
            $d='未选择任何图片';
            $this->assign('d',$d);
            }
        return $this->fetch();
    }
    public function shiyanupdata()
    {
        if(request()->isPost()){
            $data=[
            'file1'=>input('file1'),
            'file2'=>input('file2'),
            'file3'=>input('file3'),
            'file4'=>input('file4'),
            'name'=>input('name'),
            'pass'=>input('pass')
            ];
            if(Db::name('shiyan')->insert($data)){
                $this->success('添加成功');
            }else{
                $this->error('添加失败');
            }
        }
    }
    public function index1()
    {
    	$list1=Db::name('windows')->select();
    	$this->assign('list1',$list1);//显示出windows系统的所有分类
        return $this->fetch();
    }
    public function indexicons()
    {
        return $this->fetch();
    }
    public function adminicons()
    {
        return $this->fetch();
    }
    public function top()//fream框架投头部
    {
        return $this->fetch();
    }
    public function left()//fream框架左部导航栏
    {
        return $this->fetch();
    }
    public function right()//fream框架右侧主页
    {
    	$list=Db::name('foot')->find();
    	$this->assign('list',$list);
        if(request()->isPost()){
            $data=[
            'ID'=>input('ID'),
            'internet'=>input('internet'),
            'computer'=>input('computer'),
            'os'=>input('os'),
            'server'=>input('server'),
            'sqlku'=>input('sqlku'),
            'phpmyadmin'=>input('phpmyadmin'),
            'environment'=>input('environment'),
            'webname'=>input('webname')
            ];
            if(Db::name('foot')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function news()//新闻管理
    {
        $list=Db::name('index')->find();
        $this->assign('list',$list);
        $list1=Db::name('windows')->select();
        $this->assign('list1',$list1);
        $winbanben=input('winbanben');
        if($list3=Db::name('index')->where('name','=',$winbanben)->find()){
            if(request()->isPost()){
                $data=[
                    'id'=>input('id'),
                    'name'=>$list3['name'],
                    'winbanben'=>$list3['winbanben']
                    ];
                if(Db::name('index')->update($data)){
                    $this->success('修改成功');
                    }else{
                        $this->error('数据没有修改');
                    }
            }
        }else{
            $list2=Db::name('windows')->where('winbanben','=',$winbanben)->find();
            if(request()->isPost()){
                $data=[
                    'id'=>input('id'),
                    'name'=>$list2['name'],
                    'upbanben'=>$list2['upbanben'],
                    'winbanben'=>input('winbanben')
                    ];
                if(Db::name('index')->update($data)){
                    $this->success('修改成功');
                    }else{
                        $this->error('数据没有修改');
                    }
            }
        }
        
        return $this->fetch();
    }
    public function newswinupdata()//windows新闻管理
    {
        $list6=Db::name('winnews')->find();//显示windows的新闻
        $this->assign('list6',$list6);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'introduce3'=>input('introduce3'),
            'title4'=>input('title4'),
            'introduce4'=>input('introduce4'),
            'photo1'=>input('photo1'),
            'photo2'=>input('photo2'),
            'photo3'=>input('photo3'),
            ];
            if(Db::name('winnews')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function newswin10updata()//win10新闻管理
    {
        $list7=Db::name('win10')->find();//显示win10新闻
        $this->assign('list7',$list7);
        return $this->fetch();
    }
    public function newswin8updata()//win8新闻管理
    {
        $list8=Db::name('win8')->find();//显示win8新闻
        $this->assign('list8',$list8);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'title4'=>input('title4'),
            'title5'=>input('title5'),
            'title6'=>input('title6'),
            'title7'=>input('title7'),
            'photo'=>input('photo'),
            ];
            if(Db::name('win8')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function newswin7updata()//win7新闻管理
    {
        $list9=Db::name('win7')->find();//显示win7新闻
        $this->assign('list9',$list9);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'introduce3'=>input('introduce3'),
            'title4'=>input('title4'),
            'introduce4'=>input('introduce4'),
            'photo'=>input('photo'),
            ];
            if(Db::name('win7')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function newsubuntuupdata()//ubuntu新闻管理
    {
        $list10=Db::name('ubuntu')->find();//显示ubuntu新闻
        $this->assign('list10',$list10);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'title4'=>input('title4'),
            'title5'=>input('title5'),
            'title6'=>input('title6'),
            'photo'=>input('photo'),
            ];
            if(Db::name('ubuntu')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function newsredhatupdata()//redhat新闻管理
    {
        return $this->fetch();
    }
    public function newsfedoraupdata()//fedora新闻管理
    {
        return $this->fetch();
    }
    public function newsraspberryupdata()//raspberry新闻管理
    {
        return $this->fetch();
    }
    public function newsmacupdata()//mac新闻管理
    {
        return $this->fetch();
    }
    public function movieupdata()//每日电影管理
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'name'=>input('name'),
            'video'=>input('video'),
            'photo'=>input('photo'),
            ];
            if(Db::name('movie')->update($data)){
                $this->success('修改成功');
            }else{
                $this->error('数据没有修改');
            }
        }
        return $this->fetch();
    }
    public function moviephotoupdata()//每日电影封面修改
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function moviefileupdata()//每日电影文件修改
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function moviephotoupdatainfo()//每日电影封面上传
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        $file = request()->file('files');
        if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'moviefile');
        if($info){
            $a=('/os/public/moviefile/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
            $a='未选择任何图片';
            $this->assign('a',$a);
            }
        return $this->fetch();
    }
    public function moviefileupdatainfo()//每日电影文件上传
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        $file = request()->file('files');
        if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'moviephoto');
        if($info){
            $a=('/os/public/moviephoto/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
            $a='未选择任何文件';
            $this->assign('a',$a);
            }
        return $this->fetch();
    }
    public function moviephotoupdatainfointo()//每日电影封面更改
    {
        $list=Db::name('movie')->find();
        $this->assign('list',$list);
        if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'name'=>input('name'),
            'video'=>input('video'),
            'photo'=>input('photo'),
            ];
            if(Db::name('movie')->update($data)){
                $this->success('修改成功','index/movieupdata');
            }else{
                $this->error('数据没有修改','index/movieupdata');
            }
        }
        return $this->fetch();
    }
    public function windowsguanli()//显示管理的系统
    {
        //显示出windows系统的所有分类及进入按钮
    	$list1=Db::name('windows')->select();
    	$this->assign('list1',$list1);
        return $this->fetch();
    }
    public function windows()//显示出所有要管理的系统
    {
    	$upbanben=input('upbanben');
    	$winbanben=input('winbanben');
    	$list=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->find();
        $this->assign('list',$list);//显示该网页基础信息
    	$list1=Db::name('win')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->order('shunxu asc')->order('wei desc')->select();
        $this->assign('list1',$list1);//找出所有该win系统版本的内容
        return $this->fetch();
    }
    public function windowsupdata()//更改系统信息
    {
    	$id=input('id');
        $upbanben=input('upbanben');
    	$winbanben=input('winbanben');
    	$stname=input('stname');
        $wei=input('wei');
    	$list1=Db::name('win')->where('winbanben','=',$winbanben)->where('stname','=',$stname)->where('wei','=',$wei)->find();
    	$this->assign('list1',$list1);//显示该系统基本信息
    	$list2=Db::name('windows')->where('upbanben','=',$upbanben)->select();
    	$this->assign('list2',$list2);
        $list3=Db::name('windows')->select();
        $this->assign('list3',$list3);
    	if(request()->isPost()){
    		$data=[
    		'id'=>input('id'),
    		'upbanben'=>input('upbanben'),
            'jianname'=>input('jianname'),
    		'winbanben'=>input('winbanben'),
    		'banbenname'=>input('banbenname'),
    		'stname'=>input('stname'),
            'chname'=>input('chname'),
    		'filename'=>input('filename'),
    		'sha'=>input('sha'),
    		'filesize'=>input('filesize'),
    		'bendi'=>input('bendi'),
    		'xunlei'=>input('xunlei'),
    		'yunpan'=>input('yunpan'),
    		'shunxu'=>input('shunxu'),
    		'wei'=>input('wei'),
    		'frequency'=>input('frequency'),
    		];
    		if(Db::name('win')->update($data)){
    			$this->success('修改成功');
    		}else{
    			$this->error('数据没有修改');
    		}
    	}
        return $this->fetch();
    }
    public function del()//删除所选系统
    {
    	$id=input('id');
    	$list=Db::name('win')->delete($id);
        $this->success('删除成功','admin/index/windowsguanli');
    }
    public function windowsadd()//添加windows系统
    {
    	$list1=Db::name('windows')->select();
    	$this->assign('list1',$list1);
        return $this->fetch();
    }
    public function windowsaddinfo()
    {
        $upbanben=input('upbanben');
        $this->assign('upbanben',$upbanben);
        $winbanben=input('winbanben');
        $this->assign('winbanben',$winbanben);
        $jianname=input('jianname');
        $this->assign('jianname',$jianname);
        $banbenname=input('banbenname');
        $this->assign('banbenname',$banbenname);
        $stname=input('stname');
        $this->assign('stname',$stname);
        $chname=input('chname');
        $this->assign('chname',$chname);
        $filename=input('filename');
        $this->assign('filename',$filename);
        $sha=input('sha');
        $this->assign('sha',$sha);
        $filesize=input('filesize');
        $this->assign('filesize',$filesize);
        $bendi=input('bendi');
        $this->assign('bendi',$bendi);
        $xunlei=input('xunlei');
        $this->assign('xunlei',$xunlei);
        $yunpan=input('yunpan');
        $this->assign('yunpan',$yunpan);
        $shunxu=input('shunxu');
        $this->assign('shunxu',$shunxu);
        $wei=input('wei');
        $this->assign('wei',$wei);
        $frequency=0;
        $this->assign('frequency',$frequency);
        if($file = request()->file('file')){
		$sha=$file->md5();
        	$this->assign('sha',$sha);
        	$filename = $file->getInfo()['name'];
        	$this->assign('filename',$filename);
		$info = $file->move(ROOT_PATH . 'public' . DS . 'windowsfile');
            if($info){
                $e=('/os/public/windowsfile/'.$info->getSaveName());
                $this->assign('e',$e);
                $sum=($info->getSize());
                if($sum<1024){
                    $bit=$sum;
                    $s=round($bit,2); //保留2位小数
                    $filesize=($s.'B');
                    $this->assign("filesize",$filesize);
                }else if($sum<1048576){
                    $bit=$sum/1024;
                    $s=round($bit,2);
                    $filesize=($s.'K');
                    $this->assign("filesize",$filesize);
                }else if($sum<1073741824){
                    $bit=$sum/1024/1024;
                    $s=round($bit,2);
                    $filesize=($s.'M');
                    $this->assign("filesize",$filesize);
                }else{
                    $bit=$sum/1024/1024/1024;
                    $s=round($bit,2);
                    $filesize=($s.'G');
                    $this->assign("filesize",$filesize);
                }
		$this->success('添加成功','index/windowsguanli');
            }
        }else{
            $this->error('未选择文件','index/windowsadd');
        }
        return $this->fetch();
    }
    public function windowsaddinfointo(){
        $list=Db::name('win');
        if(request()->isPost()){
            $data=[
            'upbanben'=>input('upbanben'),
            'winbanben'=>input('winbanben'),
            'jianname'=>input('jianname'),
            'banbenname'=>input('banbenname'),
            'stname'=>input('stname'),
            'chname'=>input('chname'),
            'filename'=>input('filename'),
            'sha'=>input('sha'),
            'filesize'=>input('filesize'),
            'bendi'=>input('bendi'),
            'xunlei'=>input('xunlei'),
            'yunpan'=>input('yunpan'),
            'shunxu'=>input('shunxu'),
            'wei'=>input('wei'),
            'frequency'=>input('frequency'),
            ];
            if(Db::name('win')->insert($data)){
                $this->success('添加成功');
            }else{
                $this->error('添加失败');
            }
        }
        return $this->fetch();
    }
    public function newwindows()//添加新的windows系统
    {
    	if(request()->isPost()){
    		$data=[
    		'name'=>input('name'),
    		'upbanben'=>input('upbanben'),
    		'winbanben'=>input('winbanben'),
            'jianname'=>input('jianname')
    		];
    		if(Db::name('windows')->insert($data)){
    			$this->success('添加成功');
    		}else{
    			$this->error('添加失败');
    		}
    	}
    	return $this->fetch();
	}
	public function newwindowsupdata()//全新windows系统的修改
    {
    	$upbanben=input('upbanben');
    	$winbanben=input('winbanben');
    	$list=Db::name('windows')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->find();
    	$this->assign('list',$list);
    	if(request()->isPost()){
    		$data=[
    		'ID'=>input('ID'),
    		'name'=>input('name'),
            'jianname'=>input('jianname'),
    		'upbanben'=>input('upbanben'),
    		'winbanben'=>input('winbanben'),
    		];
    		if(Db::name('windows')->update($data)){
    			$this->success('修改成功');
    		}else{
    			$this->error('数据没有修改');
    		}
    	}
        return $this->fetch();
    }
    public function newwindowsdel()//全新windows系统的删除
    {
    	$upbanben=input('upbanben');
    	$winbanben=input('winbanben');
    	$list=Db::name('windows')->where('upbanben','=',$upbanben)->where('winbanben','=',$winbanben)->delete();
        $this->success('删除成功','admin/index/windowsguanli');
    }
    public function upload(){// 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('image');// 移动到框架应用根目录/public/uploads/ 目录下
    if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){// 成功上传后 获取上传信息// 输出 jpg
            echo $info->getExtension();// 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getSaveName();// 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename();// 上传失败获取错误信息
        }else{
            echo $file->getError();
        }
        }
        return $this->fetch();
    }
    public function soft()//软件信息循环输出
    {
    	$list=Db::name('soft')->select();
    	$this->assign('list',$list);
        return $this->fetch();
    }
    public function softadd()//添加新的软件
    {
        return $this->fetch();
    }
    public function softaddinfo()//添加新的软件
    { 
        $device=input('device');
        $this->assign('device',$device);
        $environment=input('environment');
        $this->assign('environment',$environment);
        $filename=input('filename');
        $this->assign('filename',$filename);
        $language=input('language');
        $this->assign('language',$language);
        $name=input('name');
        $this->assign('name',$name);
        $score=input('score');
        $this->assign('score',$score);
        $support=input('support');
        $this->assign('support',$support);
        $type=input('type');
        $this->assign('type',$type);
        $frequency=input('frequency');
        $this->assign('frequency',$frequency);
        $xunlei=input('xunlei');
        $this->assign('xunlei',$xunlei);
        $yunpan=input('yunpan');
        $this->assign('yunpan',$yunpan);
        $bendi=input('bendi');
        $this->assign('bendi',$bendi);
        $title1=input('title1');
        $this->assign('title1',$title1);
        $introduce1=input('introduce1');
        $this->assign('introduce1',$introduce1);
        $title2=input('title2');
        $this->assign('title2',$title2);
        $introduce2=input('introduce2');
        $this->assign('introduce2',$introduce2);
        $title3=input('title3');
        $this->assign('title3',$title3);
        $introduce3=input('introduce3');
        $this->assign('introduce3',$introduce3);
        $file1 = request()->file('file1');
        if($file1){
        $info1 = $file1->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info1){
            $a=('/os/public/softphoto/'.$info1->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file1->getError();
            }
        }else{
            $a='未选择任何图片';
            $this->assign('a',$a);
            }
        $file2 = request()->file('file2');
        if($file2){
        $info2 = $file2->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info2){
            $b=('/os/public/softphoto/'.$info2->getSaveName());
            $this->assign('b',$b);
        }else{
            echo $file2->getError();
            }
        }else{
            $b='未选择任何图片';
            $this->assign('b',$b);
            }
        $file3 = request()->file('file3');
        if($file3){
        $info3 = $file3->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info3){
            $c=('/os/public/softphoto/'.$info3->getSaveName());
            $this->assign('c',$c);
        }else{
            echo $file3->getError();
            }
        }else{
            $c='未选择任何图片';
            $this->assign('c',$c);
            }
        $file4 = request()->file('file4');
        if($file4){
        $info4 = $file4->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info4){
            $d=('/os/public/softphoto/'.$info4->getSaveName());
            $this->assign('d',$d);
        }else{
            echo $file4->getError();
            }
        }else{
            $d='未选择任何图片';
            $this->assign('d',$d);
            }
        if($file5 = request()->file('file5')){
        $filename = $file5->getInfo()['name'];
        $this->assign('filename',$filename);
        }else{
            $this->error('信息不完整','index/softadd');
        }
        if($file5){
		$sha=$file5->md5();
                $this->assign('sha',$sha);
            $info5 = $file5->move(ROOT_PATH . 'public' . DS . 'softfile');
            if($info5){
                $e=('/os/public/softfile/'.$info5->getSaveName());
                $this->assign('e',$e);
                $sum=($info5->getSize());
                if($sum<1024){
                    $bit=$sum;
                    $s=round($bit,2);
                    $size=($s.'B');
                    $this->assign("size",$size);
                }else if($sum<1048576){
                    $bit=$sum/1024;
                    $s=round($bit,2);
                    $size=($s.'K');
                    $this->assign("size",$size);
                }else if($sum<1073741824){
                    $bit=$sum/1024/1024;
                    $s=round($bit,2);
                    $size=($s.'M');
                    $this->assign("size",$size);
                }else{
                    $bit=$sum/1024/1024/1024;
                    $s=round($bit,2);
                    $size=($s.'G');
                $this->assign("size",$size);
            }
        }else{
            echo $file5->getError();
            }
        }else{
            $this->error('信息不完整','index/softadd');
            }
        $photo1=input('photo1');
        $this->assign('photo1',$photo1);
        $photo2=input('photo2');
        $this->assign('photo2',$photo2);
        $photo3=input('photo3');
        $this->assign('photo3',$photo3);
        $photo4=input('photo4');
        $this->assign('photo4',$photo4);
        return $this->fetch();
    }
    public function softaddinfointo()
    {
         if(request()->isPost()){
            $data=[
            'id'=>input('id'),
            'device'=>input('device'),
            'environment'=>input('environment'),
            'filename'=>input('filename'),
            'language'=>input('language'),
            'name'=>input('name'),
            'photo'=>input('photo'),
            'photo1'=>input('photo1'),
            'photo2'=>input('photo2'),
            'photo3'=>input('photo3'),
            'score'=>input('score'),
            'size'=>input('size'),
            'support'=>input('support'),
            'type'=>input('type'),
            'uptime'=>date('y-m-d'),
            'sha'=>input('sha'),
            'frequency'=>input('frequency'),
            'xunlei'=>input('xunlei'),
            'yunpan'=>input('yunpan'),
            'bendi'=>input('bendi'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'introduce3'=>input('introduce3'),
            ];
            if(Db::name('soft')->insert($data)){
                $this->success('添加成功','index/softadd');
            }else{
                $this->error('添加失败','index/softadd');
            }
        }
    }
    public function softupdata()//软件信息更新
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
        if(request()->isPost()){
    		$data=[
    		'id'=>input('id'),    
    		'device'=>input('device'),
    		'environment'=>input('environment'),
    		'filename'=>input('filename'),
    		'language'=>input('language'),
    		'name'=>input('name'),
    		'photo'=>input('photo'),
    		'photo1'=>input('photo1'),
    		'photo2'=>input('photo2'),
    		'photo3'=>input('photo3'),
    		'score'=>input('score'),
    		'size'=>input('size'),
    		'support'=>input('support'),
    		'type'=>input('type'),
    		'sha'=>input('sha'),
    		'frequency'=>input('frequency'),
    		'xunlei'=>input('xunlei'),
    		'yunpan'=>input('yunpan'),
    		'bendi'=>input('bendi'),
            'title1'=>input('title1'),
            'introduce1'=>input('introduce1'),
            'title2'=>input('title2'),
            'introduce2'=>input('introduce2'),
            'title3'=>input('title3'),
            'introduce3'=>input('introduce3'),
    		];
    		if(Db::name('soft')->update($data)){
    			$this->success('修改成功');
    		}else{
    			$this->error('数据没有修改');
    		}
    	}
    	return $this->fetch();
    }
    public function softdel()//软件信息更新
    {
        $id=input('id');
        if($list=Db::name('soft')->where('id','=',$id)->delete()){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
        $this->assign('list',$list);
    }
    public function softphotoupdata()//软件封面图片选择
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	return $this->fetch();
    }
    public function softphotoupdata1()//软件图片1选择
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	return $this->fetch();
    }
    public function softphotoupdata2()//软件图片2选择
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	return $this->fetch();
    }
    public function softphotoupdata3()//软件图片3选择
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	return $this->fetch();
    }
    public function softfileupdata()//软件文件选择
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	return $this->fetch();
    }
    public function windowsfileupdata()//windows文件选择
    {
    	$id=input('id');
    	$list1=Db::name('win')->find($id);
    	$this->assign('list1',$list1);
    	return $this->fetch();
    }
    public function softphotoupdatainfo()//软件封面图片上传
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	$file = request()->file('files');
    	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info){
            $a=('/os/public/softphoto/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
        	$a='未选择任何图片';
            $this->assign('a',$a);
            }
    	return $this->fetch();
    }
    public function softphotoupdatainfo1()//软件图片1上传
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	$file = request()->file('files');
    	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info){
            $a=('/os/public/softphoto/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
        	$a='未选择任何图片';
            $this->assign('a',$a);
            }
    	return $this->fetch();
    }
    public function softphotoupdatainfo2()//软件图片2上传
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	$file = request()->file('files');
    	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'softphoto');
        if($info){
            $a=('/os/public/softphoto/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
        	$a='未选择任何图片';
            $this->assign('a',$a);
            }
    	return $this->fetch();
    }
    public function softphotoupdatainfo3()//软件图片3上传
    {
    	$id=input('id');
    	$list=Db::name('soft')->find($id);
    	$this->assign('list',$list);
    	$file = request()->file('files');
    	if($file){
        	$info = $file->move(ROOT_PATH . 'public' . DS . 'softphoto');
        	if($info){
            	$a=('/os/public/softphoto/'.$info->getSaveName());
            	$this->assign('a',$a);
        		}else{
            		echo $file->getError();
            		}
        		}else{
        	$a='未选择任何图片';
            $this->assign('a',$a);
            }
    	return $this->fetch();
    }
    public function softfileupdatainfo()//软件文件上传
    {
        $id=input('id');
        $list=Db::name('soft')->find($id);
        $this->assign('list',$list);
        if($file = request()->file('files')){
        $filename = $file->getInfo()['name'];
        $this->assign('filename',$filename);
        }else{
            $this->error('信息不完整','index/softadd');
        }
	$sha=$file->md5();
        $this->assign('sha',$sha);
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'softfile');
            if($info){
                $e=('/os/public/softfile/'.$info->getSaveName());
                $this->assign('e',$e);
                $sum=($info->getSize());
                if($sum<1024){
                    $bit=$sum;
                    $s=round($bit,2);
                    $size=($s.'B');
                    $this->assign("size",$size);
                }else if($sum<1048576){
                    $bit=$sum/1024;
                    $s=round($bit,2);
                    $size=($s.'K');
                    $this->assign("size",$size);
                }else if($sum<1073741824){
                    $bit=$sum/1024/1024;
                    $s=round($bit,2);
                    $size=($s.'M');
                    $this->assign("size",$size);
                }else{
                    $bit=$sum/1024/1024/1024;
                    $s=round($bit,2);
                    $size=($s.'G');
                $this->assign("size",$size);
            }
        }else{
            echo $file5->getError();
            }
        }else{
            $this->error('信息不完整','index/softadd');
            }
    	return $this->fetch();
    }
    public function windowsfileupdatainfo()//windows文件上传
    {
    	$id=input('id');
    	$list1=Db::name('win')->find($id);
    	$this->assign('list1',$list1);
    	$file = request()->file('files');
    	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            $a=('/os/public/uploads/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
        	$a='未选择任何文件';
            $this->assign('a',$a);
            }
    	return $this->fetch();
    }
    public function softphotoupdatainfointo()//软件总信息更新
    {
    	if(request()->isPost()){
    		$data=[
    		'id'=>input('id'),
    		'device'=>input('device'),
    		'environment'=>input('environment'),
    		'filename'=>input('filename'),
    		'language'=>input('language'),
            	'uptime'=>date('y-m-d'),
    		'name'=>input('name'),
    		'photo'=>input('photo'),
    		'photo1'=>input('photo1'),
    		'photo2'=>input('photo2'),
    		'photo3'=>input('photo3'),
    		'score'=>input('score'),
    		'size'=>input('size'),
    		'support'=>input('support'),
    		'type'=>input('type'),
    		'sha'=>input('sha'),
    		'frequency'=>input('frequency'),
    		'xunlei'=>input('xunlei'),
    		'yunpan'=>input('yunpan'),
    		'bendi'=>input('bendi'),
    		];
    		if(Db::name('soft')->update($data)){
    			$this->success('修改成功','index/soft');
    		}else{
    			$this->error('没有修改','index/soft');
    		}
    }
}
    public function windowsfileupdatainfointo()//windows系统总更新
    {
    	if(request()->isPost()){
    		$data=[
    		'id'=>input('id'),
    		'upbanben'=>input('upbanben'),
            	'jianname'=>input('jianname'),
    		'winbanben'=>input('winbanben'),
    		'banbenname'=>input('banbenname'),
    		'stname'=>input('stname'),
            	'chname'=>input('chname'),
    		'filename'=>input('filename'),
    		'sha'=>input('sha'),
    		'filesize'=>input('filesize'),
    		'bendi'=>input('bendi'),
    		'xunlei'=>input('xunlei'),
    		'yunpan'=>input('yunpan'),
    		'shunxu'=>input('shunxu'),
    		'wei'=>input('wei'),
    		'frequency'=>input('frequency'),
    		];
    		if(Db::name('win')->update($data)){
    			$this->success('修改成功','index/windowsguanli');
    		}else{
    			$this->error('数据没有修改','index/windowsguanli');
    		}
    	}
    	return $this->fetch();
    }
    public function video()
    {
        $list=Db::name('video')->where('verify','=',0)->order("date asc")->select();//时间升序
        $this->assign('list',$list);//显示视频
        return $this->fetch();
    }
    public function videodel()
    {
        $id=input('id');
        if($list=Db::name('video')->delete($id)){
            $this->success('删除成功','index/video');
        }else{
            $this->error('删除失败','index/video');
        }
    }
    public function videosuccess()
    {
        $id=input('id');
        if($list=Db::name('video')->where('id','=',$id)->setInc('verify',1)){
            $this->success('审核通过','index/video');
        }else{
            $this->error('审核失败','index/video');
        }
    }
}