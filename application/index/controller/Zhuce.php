<?php namespace app\index\Controller;use think\Controller;use think\Db;class Zhuce extends Controller{    public function index()    {        $list3=Db::name('foot')->find();        $this->assign('list3',$list3);        $list=Db::name('user');        $list=Db::table('think_question')->select();        $this->assign('list',$list);        return $this->fetch();    }    public function upload(){        $file1 = request()->file('file1');        if($file1){                $info = $file1->move(ROOT_PATH . 'public' . DS . 'userphoto');                if($info){                    $a=('/os/public/userphoto/'.$info->getSaveName());                    $this->assign('a',$a);                }else{                    echo $file1->getError();                }        }else{            $a='未选择任何文件';            $this->assign('a',$a);        }        if(request()->isPost()){            $data=[            'username'=>input('username'),            'password'=>md5(input('password')),            'email'=>input('email'),            'weixin'=>input('weixin'),            'guojia'=>input('guojia'),            'pro'=>input('pro'),            'city'=>input('city'),            'county'=>input('county'),            'phone'=>input('phone'),            'QQ'=>input('QQ'),            'question'=>input('question'),            'answer'=>input('answer'),            'photo'=>$a,            'jifen'=>input('jifen')            ];            $list2=Db::name('user')->where('username','=',$data['username'])->find();            $list4=Db::name('user')->where('email','=',$data['email'])->find();             if($data['username']==$list2['username']){                $this->error('注册失败，用户名已存在','zhuce/index');            }if($data['email']==$list4['email']){                $this->error('注册失败，该邮箱已注册','zhuce/index');            }else if((Db::name('user')->insert($data))&&($data['username']!=$list2['username'])&&($data['email']!=$list2['email'])){                $this->success('注册成功','login/index');            }        }        return $this->fetch();    }}