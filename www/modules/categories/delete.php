<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить категорию";

$cat = R::load('categories', $_GET['id']);

if ( isset($_POST['catDelete']) && $_GET['id'] > 1 ) {

	R::trash($cat);
	header('Location: ' . HOST . "categories?result=catDeleted");
	exit();

} else if ($_GET['id'] == 1) {
		$errors[]  = ['title' => 'Вы не можете удалить эту категорию'];
}

ob_start();
include ROOT . '\views\pages\categories\delete.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';


?>
