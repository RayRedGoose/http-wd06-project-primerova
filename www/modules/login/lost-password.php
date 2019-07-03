<?php

$title = "Восстановление пароля";

if ( isset($_POST['lost-password'])) {

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if(!preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $_POST['email'])) {
		$errors[] = ['title' => 'Неверное написание email'];
	}

	if ( empty($errors)) {

		$user = R::findOne('users', 'email = ?', array($_POST['email']) );

		if ( $user ) {

			// Генерация кода и сохранение кода в БД
			function random_str( $num = 30 ) {
				return substr(str_shuffle('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, $num);
			}
			$recovery_code = random_str(15);
			$user->recovery_code = $recovery_code;
			$user->recovery_code_times = 3;
			R::store($user);

			// Высылаем инструкции на почту
			$recovery_message = "<p>Код для сброса пароля: <b>$recovery_code</b></p>";
			$recovery_message .= "<p>Для сброса пароля перейдите по ссылке ниже, и установите новый пароль:</p>";
			$recovery_message .= '<p><a href="' . HOST;
			$recovery_message .= "set-new-password?email=" . $_POST['email'] . "&code=" . $recovery_code;
			$recovery_message .= '" target="_blank">';
			$recovery_message .= "Установить новый пароль</a></p>";

			$headers = 	"MIME-Version: 1.0" . PHP_EOL .
						"Content-Type: text/html; charset=utf-8" . PHP_EOL .
						"From:" . adopt( SITE_NAME ) . "<" . SITE_EMAIL . " >" . PHP_EOL .
						"Reply-To:" . ADMIN_EMAIL;

			mail($_POST['email'], 'Восстановление доступа', $recovery_message, $headers);

			// $success[] = "Инструкции по восстановлению доступа высланы на " . $_POST['email'];
			$success[] = [
					'title' => "Все отлично!" ,
					'desc' => "<p>Инструкции по восстановлению доступа высланы на {$_POST['email']}</p>"

				];

		} else {
			$errors[] = ['title' => "Пользователь с таким email не зарегистрирован" ];
		}
	}
}

// central part content
ob_start();
include ROOT . '\views\pages\login\form-lost-password.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\pages\login\login-page.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
