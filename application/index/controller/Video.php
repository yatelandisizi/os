<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Video extends controller
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
        if(session('username')){
            $this->assign('yonghu',$yonghu=session('username'));
        }else{
        $this->assign('yonghu',$yonghu='null');
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
        $videotype=Db::name('videotype')->order('look desc')->select();
        $this->assign('videotype',$videotype);//显示所有短视频类型
        $videotype1=Db::name('videotype')->order('look desc')->paginate(8);
        $this->assign('videotype1',$videotype1);//显示所有短视频类型
        $countcus = Db::name('video')->count();
        $min = Db::name('video')->min('id');
        $max = Db::name('video')->max('id');
        $jingxuan1=Db::name('video')->order('look desc')->where('id','=',rand($min,$max))->find();
        $this->assign('jingxuan1',$jingxuan1);
        $book1=Db::name('videobook')->where('type','=',$jingxuan1['id'])->order('zan desc')->paginate(2);
        $this->assign('book1',$book1);
        $jingxuan2=Db::name('video')->order('look desc')->where('id','=',rand($min,$max))->find();
        $this->assign('jingxuan2',$jingxuan2);
        $book2=Db::name('videobook')->where('type','=',$jingxuan2['id'])->order('zan desc')->paginate(2);
        $this->assign('book2',$book2);
        $jingxuan3=Db::name('video')->order('rand()')->paginate(3);
        $this->assign('jingxuan3',$jingxuan3);
        $jingxuan4=Db::name('video')->order('rand()')->paginate(3);
        $this->assign('jingxuan4',$jingxuan4);
        $tuijian=Db::name('video')->order('look desc')->order('rand()')->paginate(6);
        $this->assign('tuijian',$tuijian);//推荐视频
        $like=Db::name('video')->limit(4)->order('rand()')->select();
        $this->assign('like',$like);//猜你喜欢
        $hot=Db::name('video')->order('look desc')->order('rand()')->paginate(4);
        $this->assign('hot',$hot);//热门视频
        $hot1=Db::name('video')->order('rand()')->find();
        $this->assign('hot1',$hot1);//热门视频
        $book3=Db::name('videobook')->where('type','=',$hot1['id'])->order('zan desc')->paginate(2);
        $this->assign('book3',$book3);
        $top=Db::name('video')->limit(3)->order('rand()')->select();
        $this->assign('top',$top);//头条新闻
        $new=Db::name('video')->order('date desc')->order('rand()')->paginate(3);
        $this->assign('new',$new);//最新视频
        return $this->fetch();
    }  
    public function login()
    {
        $this->success('正在跳转','index/login');
    }
    public function look($huanying = '欢迎:')
    {
        $type=input('type');
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
        $video=Db::name('video')->where('type','=',$type)->order('zan desc')->order('cai asc')->order('rand()')->paginate(15,false,['query' => request()->param()]);
        $this->assign('video',$video);//查询出所有该类型的视频，备用查询代码：paginate(2,false,['query' => ['type'=>$type],]);
        $like=Db::name('video')->where('type','=',$type)->order('rand()')->paginate(4);
        $this->assign('like',$like);//猜你喜欢
        $hot=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('hot',$hot);//热门视频
        $videolookadd=Db::name('videotype')->where('type','=',$type)->setInc('look',1);//浏览次数+1
        return $this->fetch();
    }  
    public function shoucangadd()
    {
        if(request()->isPost()){
            $data=[
            'videoid'=>input('videoid'),
            'username'=>input('username'),
            'date'=>date("Y-m-d H:i:s"),
            'title'=>input('title'),
            'zan'=>input('zan'),
            'photo'=>input('photo'),
            'cai'=>input('cai'),
            'type'=>input('type'),
            'typename'=>input('typename'),
            'videofile'=>input('videofile'),
            'look'=>input('look'),
            'comment'=>input('comment'),
            'author'=>input('author')
            ];
            if(Db::name('shoucang')->insert($data)){
                $this->success('收藏成功');
            }else{
                $this->error('收藏失败');
            }
        }
    }
    public function shoucang($huanying = '欢迎:')
    {
        $username=session('username');
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
        $video=Db::name('shoucang')->where('username','=',$username)->order('date desc')->paginate(20);
        $this->assign('video',$video);//查询出所有该类型的视频，备用查询代码：paginate(2,false,['query' => ['type'=>$type],]);
        $like=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('like',$like);//猜你喜欢
        $hot=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('hot',$hot);//热门视频
        return $this->fetch();
    }
    public function book()
    {
        $id=input('id');
        $list1=Db::name('video')->where('id','=',$id)->setInc('comment',1);//数据表book字段+1
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
            'videoname'=>input('videoname')
            ];
            if(Db::name('videobook')->insert($data)){
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
        if($list3=Db::name('videoshuangji')->where('bookid','=',$id)->where('user','=',$user)->find()){
            $this->error('您已经点击过');
        }else if($user=='null'){
            $this->error('请您先登录');
        }else{
        $list1=Db::name('video')->where('id','=',$id)->setInc('zan',1);//数据表book字段+1
        $data=['bookid'=>$id,'user'=>$user,];
        if(Db::name('videoshuangji')->insert($data)){
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
        if($list3=Db::name('videoshuangji')->where('bookid','=',$id)->where('user','=',$user)->find()){
            $this->error('您已经点击过');
        }else if($user=='null'){
            $this->error('请您先登录');
        }else{
        $list1=Db::name('video')->where('id','=',$id)->setInc('cai',1);//数据表book字段+1
        $data=['bookid'=>$id,'user'=>$user,];
        if(Db::name('videoshuangji')->insert($data)){
                $this->success('点赞成功');
            }else{
                $this->success('点赞失败');
                }
        }
    }
    public function openlook($huanying = '欢迎:')
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
        $openvideo=Db::name('video')->where('id','=',$id)->find();
        $this->assign('openvideo',$openvideo);
        $list1=Db::name('video')->where('id','=',$id)->setInc('look',1);//数据表look字段+1
        $like=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('like',$like);//猜你喜欢
        $hot=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('hot',$hot);//热门视频
        $photo=Db::name('user')->where('username','=',session('username'))->find();
        $this->assign('photo',$photo);
        $book=Db::name('videobook')->where('type','=',$id)->order('zan desc')->select();
        $this->assign('book',$book);
        return $this->fetch();
    }  
    public function bookzan()
    {
        $id=input('id');
        $user=input('user');
        if($list3=Db::name('videobookshuangji')->where('bookid','=',$id)->where('user','=',$user)->find()){
            $this->error('您已经点击过');
        }else if($user=='null'){
            $this->error('请您先登录');
        }else{
        $list1=Db::name('videobook')->where('id','=',$id)->setInc('zan',1);//数据表book字段+1
        $data=['bookid'=>$id,'user'=>$user,];
        if(Db::name('videobookshuangji')->insert($data)){
                $this->success('点赞成功');
            }else{
                $this->success('点赞失败');
                }
        }
    }
    public function videoupload($huanying = '欢迎:')
    {
        if(!session('username')){
            $list12=Db::name('user')->find(null);
            $this->assign('list12',$list12);
            $this->assign('huanying',$huanying='<a href="login" style="color:red;" title="用户登录">您还没有登录</a>');
            $this->error('请您先登录');
        }else{
            $list12=Db::name('user')->where('username','=',session('username'))->find();//用户资料查询
            $this->assign('list12',$list12);
        $this->assign('huanying',$huanying);
        $this->assign('yonghu',$yonghu=session('username'));
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
        $type=Db::name('videotype')->select();
        $this->assign('type',$type);
        return $this->fetch();
        }
    }
    public function videouploadinfo()
    {
        $file = request()->file('files');
        if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'videofile');
        if($info){
            $a=('/os/public/videofile/'.$info->getSaveName());
            $this->assign('a',$a);
        }else{
            echo $file->getError();
            }
        }else{
            $a='未选择任何文件';
            $this->assign('a',$a);
            }
        $data=[
        'title'=>input('title'),
        'author'=>session('username'),
        'zan'=>input('zan'),
        'cai'=>input('cai'),
        'comment'=>input('comment'),
        'look'=>input('look'),
        'type'=>input('winbanben'),
        'typename'=>input('banbenname'),
        'date'=>date("Y-m-d H:i:s"),
        'videofile'=>$a,
        'photo'=>input('photo'),
        'verify'=>input('verify')
        ];
        if(Db::name('video')->insert($data)){
                $this->success('发表成功');
            }else{
                $this->success('发表失败');
                }
        }
        public function search($huanying = '欢迎:'){
        $request = input('title');
        if($search=Db::name('video')->where('title','=',$request)->find()){
            $this->assign('search',$search);
        }else{
            $this->error('暂时没有此资源','index/index');
        }
        $type=input('type');
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
        $like=Db::name('video')->where('type','=',$type)->order('rand()')->paginate(4);
        $this->assign('like',$like);//猜你喜欢
        $hot=Db::name('video')->order('rand()')->paginate(4);
        $this->assign('hot',$hot);//热门视频
        $videolookadd=Db::name('videotype')->where('type','=',$type)->setInc('look',1);//浏览次数+1
        return $this->fetch();
    }
}
