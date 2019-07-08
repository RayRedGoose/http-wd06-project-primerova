<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактиовать категорию";

$cat = R::load('categories', $_GET['id']);


if (isset($_POST['catEdit']) ) {

	if (trim($_POST['catTitle']) == '') {
		$errors[] = ['catTitle' => 'Введите Название категории' ];
	}

	if (empty($errors)) {
		$cat->cat_title = htmlentities($_POST['catTitle']);
		R::store($cat);
		header('Location: ' . HOST . "categories?result=catUpdated");
		exit();
	}

}

ob_start();
include ROOT . 'views/pages/categories/edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
