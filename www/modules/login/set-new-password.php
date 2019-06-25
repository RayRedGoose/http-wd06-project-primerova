<?php

$title = "Новый пароль";
$recoveryCode = false;
$newPasswordReady = false;


if (!empty($_GET['email'])) {

  $user = R::findOne('users', 'email = ?', array( $_GET['email']));

  if ($user) {
    $user->recovery_code_times--;
    R::store($user);

    if ( $user->recovery_code_times < 1 ) {
			echo "User recovery code attempts - limited";
			echo "<br><br>";
			echo "<a href='" . HOST . "'>Вернуться на главную</a>";
			die;
		}

		// Проверка верности кода
		if ( $user->recovery_code == $_GET['code'] ) {
			$recoveryCode = true;
		} else {
			$recoveryCode = false;
		  }

  } else {
		echo "Пользователь с таким email не найден";
		die;
    }

} else if (isset($_POST['set-new-password'])) {
  $user = R::findOne('users', 'email = ?', array( $_POST['resetemail']) );
  $user->recovery_code_times--;
  R::store($user);

  $user = R::findOne('users', 'email = ?', array($_POST['resetemail']));

  if ($user) {
    if ( $user->recovery_code_times < 1 ) {
      die;
    }

    if ($user->recovery_code == $_POST['onetimecode']) {

			$user->password = password_hash($_POST['resetpassword'], PASSWORD_DEFAULT);

			$user->recovery_code_times = 0;
			R::store($user);
			$success[] = ['title' => "Пароль обновлен"];
			$newPasswordReady = true;
		}
	}

} else {
	header("Location: " . HOST ."lost-password");
	die;
  }



// central part content
ob_start();
include ROOT . '\views\pages\login\form-set-new-password.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\pages\login\login-page.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
