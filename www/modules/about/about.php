<?php

$title = "Об авторе";
$about = R::load('about', 1);
$skills = R::load('skills', 1);
$jobs = R::find('jobs', 'ORDER BY id DESC');

ob_start();
include ROOT . 'views/pages/about/about.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
