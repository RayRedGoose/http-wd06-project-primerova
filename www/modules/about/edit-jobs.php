<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$jobs = R::find('jobs', 'ORDER BY id DESC');


$title = "Редактировать - Об авторе";


if ( isset($_POST['newJob'])) {

	if ( trim($_POST['period']) == '') {
		$errors[] = ['title' => 'Введите период работы' ];
	}

	if ( trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите должность' ];
	}

	if ( empty($errors)) {
		$job = R::dispense('jobs');
		$job->period = htmlentities($_POST['period']);
		$job->title = htmlentities($_POST['title']);
		$job->description = htmlentities($_POST['description']);
		R::store($job);
	}

}



if ( isset($_POST['deleteJob'])) {
  $job = R::load('jobs', $_GET['id']);
	R::trash($job);
	header('Location: ' . HOST . "about");
	exit();

}

ob_start();
include ROOT . 'views/pages/about/edit-job.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
