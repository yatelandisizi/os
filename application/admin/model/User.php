<?php 
namespace app\admin\model;
use think\Model;
use think\Db;
/**
* 
*/
class User extends Model
{
	
	public function login($data)
	{
		// 验证验证码
		// $verify = $data['verify'];
		// if (!captcha_check($data['verify'])) {
		// 	return 4;
		// }


		if($user=Db::name('admin')->where('name',$data['name'])->find()){
			if(!captcha_check($data['verify'])){
				return 4;
			}elseif($user['pass']==md5($data['pass'])){
				session('name',$data['name']);
				return 1;
			}elseif(!($user['pass']==md5($data['pass']))){
				return 2;
			}
		}else{
			return 3;
		}
	}
}