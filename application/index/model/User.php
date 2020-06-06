<?php 
namespace app\index\model;
use think\Model;
use think\Db;
/**
* 
*/
class User extends Model
{
	
	public function login($data)
	{
		if($user=Db::name('user')->where('username',$data['username'])->find()){
			if(!captcha_check($data['verify'])){
				return 4;
			}elseif($user['password']==md5($data['password'])){
				session('username',$data['username']);
				return 1;
			}elseif(!($user['password']==md5($data['password']))){
				return 2;
			}
		}else{
			return 3;
		}
	}
}