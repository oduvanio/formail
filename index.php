<?php
use infrajs\router\Router;
use infrajs\path\Path;
use infrajs\ans\Ans;
use infrajs\mail\Mail;
use infrajs\config\Config;
use infrajs\template\Template;
use infrajs\session\Session;
use infrajs\load\Load;
use akiyatkin\recaptcha\Recaptcha;

session_start();
$ans = array();
$conf = Config::get('formail');
if(empty($_SESSION['formail_lastsend'])) $_SESSION['formail_lastsend'] = 0;
if ($_SESSION['formail_lastsend'] > time() - 10000) {
	return Ans::err($ans, 'Вы уже отправили форму, повторная отправка возможно через 10 секунд.');
}


$data = $_REQUEST;
foreach ( $conf['required'] as $k => $v ) {
	if ( empty($data[$k]) ) {
		return Ans::err($ans, 'Заполните обязательные поля.');
	}
}

$r = Recaptcha::check();
if (!$r) return Ans::err($ans,'Ошибка, не пройдена проверка антибот.');

$data['date'] = date('d-m-Y', time());
$data['time'] = date('H:i:s', time());
$data['host'] = $_SERVER['HTTP_HOST'];
$data['ip'] = $_SERVER['REMOTE_ADDR'];
$body = Template::parse('-formail/mail.tpl', $data);
$r = Mail::toAdmin($conf['subject'], 'noreplay@'.$_SERVER['HTTP_HOST'], $body);
$src = Path::resolve('~');
$all = Load::loadJSON($src.'.formail.json');
if(!$all) {
	$all = array();
}
$data['body'] = $body;
$all[$data['friend-phone']] = $data;
$res = Load::json_encode($all);
file_put_contents($src.'.formail.json', $res);
if (!$r) {
	return Ans::err($ans, 'Не удалось отправить сообщение, попробуйте позже');
}
$_SESSION['formail_lastsend'] = time();
return Ans::ret($ans, 'Ваше сообщение успешно отправлено. Вскоре указаный вами человек получит смс-уведомление о скидке на лечение в нашей клинике. Спасибо что выбрали нас.');