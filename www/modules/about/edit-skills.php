<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$skills = R::load('skills', 1);
$title = "Редактировать - О авторе";

if ( isset($_POST['skillsUpdate'])) {

	foreach ($_POST as $index => $value) {
		if ( intval($value) > 100 )  {
			$errors[] = ['title' => "Для поля $index введите число от 0 до 100" ];
		}
	}
 
	if ( empty($errors)) {

		$skills->html = htmlentities($_POST['html']);
		$skills->css = htmlentities($_POST['css']);
		$skills->js = htmlentities($_POST['js']);
		$skills->jquery = htmlentities($_POST['jquery']);
		$skills->php = htmlentities($_POST['php']);
		$skills->mysql = htmlentities($_POST['mysql']);
		$skills->git = htmlentities($_POST['git']);
		$skills->gulp = htmlentities($_POST['gulp']);
		$skills->npm = htmlentities($_POST['npm']);
		$skills->yarn = htmlentities($_POST['yarn']);

		R::store($skills);
		header('Location: ' . HOST . "about");
		exit();
	}

}

ob_start();
include ROOT . 'views/pages/about/edit-skills.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
