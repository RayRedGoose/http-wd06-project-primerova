<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = 'Удалить место работы';

$job = R::load('jobs', $_GET['id']);

if ( isset($_POST['deleteJob'])) {

	R::trash($job);
	header('Location: ' . HOST . "about");
	exit();

}

ob_start();
include ROOT . 'views/pages/about/delete-job.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
