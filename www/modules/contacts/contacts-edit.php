<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = 'Редактирование контактов';

$contacts = R::load('contacts', 1);

if ( isset($_POST['contactsUpdate'])) {

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	}

	if ( trim($_POST['phone']) == '') {
		$errors[] = ['title' => 'Введите Телефон' ];
	}

	if ( trim($_POST['address']) == '') {
		$errors[] = ['title' => 'Введите Адрес' ];
	}

	if ( empty($errors)) {
		$contacts->email = htmlentities($_POST['email']);
		$contacts->phone = htmlentities($_POST['phone']);
		$contacts->address = htmlentities($_POST['address']);

		$contacts->name = htmlentities($_POST['name']);
		$contacts->lastname = htmlentities($_POST['lastname']);
		$contacts->skype = htmlentities($_POST['skype']);
		$contacts->vk = htmlentities($_POST['vk']);
		$contacts->fb = htmlentities($_POST['fb']);
		$contacts->github = htmlentities($_POST['github']);
		$contacts->twitter = htmlentities($_POST['twitter']);

		R::store($contacts);
		header('Location: ' . HOST . "contacts");
		exit();

	}

}

ob_start();
include ROOT . '\views\pages\contacts\edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
