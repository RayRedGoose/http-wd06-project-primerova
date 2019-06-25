<?php

$title = 'Редактировать профиля';

$currentUser = $_SESSION['logged_user'];

$user = R::load('users', $currentUser->id);

if (isset($_POST['profile-update'])) {
  if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email'];
	}

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

  if ( trim($_POST['lastname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if ( empty($errors)) {
    $user->name = htmlentities($_POST['name']);
    $user->lastname = htmlentities($_POST['lastname']);
    $user->email = htmlentities($_POST['email']);
    $user->city = htmlentities($_POST['city']);
    $user->country = htmlentities($_POST['country']);

    R::store($user);
    $_SESSION['logged_user'] = $user;
    header('Location: ' . HOST . 'profile');
    exit();

  }
}

ob_start();
include ROOT . '\views\pages\profile\profile-edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
