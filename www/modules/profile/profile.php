<?php

$currentUser = $_SESSION['logged_user'];

$title = 'Профиль пользователя';

ob_start();
include ROOT . '\views\pages\profile\profile.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
