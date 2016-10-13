<?php
use infrajs\router\Router;
use infrajs\path\Path;
use infrajs\ans\Ans;
use infrajs\mail\Mail;
use infrajs\config\Config;
use infrajs\template\Template;

if (!is_file('vendor/autoload.php')) {
	chdir(explode('vendor/', __DIR__)[0]);
	require_once('vendor/autoload.php');
	Router::init();
}
$ans = array();
$conf = Config::get('formail');
$data = $_REQUEST;
foreach ( $conf['required'] as $k => $v ) {
	if ( empty($data[$k]) ) {
		return Ans::err($ans, 'Заполните обязательные поля.');
	}
}
$data['time'] = time();
$data['host'] = $_SERVER['HTTP_HOST'];
$data['ip'] = $_SERVER['REMOTE_ADDR'];
$body = Template::parse('-formail/mail.tpl', $data);
$r = Mail::toAdmin($conf['subject'], $from, $body);
if (!$r) {
	return Ans::err($ans, 'Не удалось отправить сообщение, попробуйте позже');
}
return Ans::ret($ans, 'ОбалденО');