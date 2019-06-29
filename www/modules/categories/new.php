<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = 'Добавление новой категории блога';

if (isset($_POST['catNew'])) {

  if ( trim($_POST['catTitle']) == '' ) {
		$errors[] = ['title' => 'Введите название категории'];
	}

  if ( empty($errors)) {
    $cat = R::dispense('categories');
    $cat->catTitle = htmlentities($_POST['catTitle']);
    R::store($cat);
    header('Location: ' . HOST . "categories?result=catCreated");
    exit();
  }
}

ob_start();
include ROOT . '\views\pages\categories\new.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
