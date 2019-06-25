<?php

$details = R::find('about');

$personName = $details[1]['name'];
$personDscrp = $details[1]['dscrp'];

ob_start();
include ROOT . '\views\parts\header.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
