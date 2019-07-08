<?php

$title = "Регистрация";

// Если форма отправлена - то делаем регистрацию
if ( isset($_POST['register'])) {

	if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email', 'desc' => '<p>Email обязателен для регистрации на сайте</p>' ];
	}

	if ( trim($_POST['password']) == '') {
		$errors[] = ['title' => 'Введите Пароль' ];
	}

	if(!preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $_POST['email'])) {
		$errors[] = ['title' => 'Неверное написание email'];
	} else 	if ( R::count('users', 'email = ?', array($_POST['email']) ) > 0 ) {
			$errors[]  = [
							'title' => 'Пользователь с там email уже зарегистрирован',
							'desc' => '<p>Используйте другой Email адрес, или воспользуйтесь восстановлением пароля.</p>',
						];
		}

	if ( empty($errors) ) {
		// добавление пользователя в базу данных
		$user = R::dispense('users');
		$user->email = htmlentities($_POST['email']);
		$user->role = 'user';
		$user->password = password_hash($_POST['password'], PASSWORD_DEFAULT);
		R::store($user);

		$_SESSION['logged_user'] = $user;
		$_SESSION['login'] = "1";
		$_SESSION['role'] = $user->role;

		header('Location: ' . HOST . "profile-edit");
		exit();

	}

}





// central part content
ob_start();
include ROOT . 'views/pages/login/form-registration.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/pages/login/login-page.tpl';
include ROOT . 'views/parts/foot.tpl';


?>
