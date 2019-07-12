<?php

if ( !isset($_GET['id']) ) {
	header("Location: " . HOST . "shop/");
	exit();
}

$item = R::load('goods', $_GET['id']);
$title = $item['title'];

ob_start();
include ROOT . 'views/pages/shop/item.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
