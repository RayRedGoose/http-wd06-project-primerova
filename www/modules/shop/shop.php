<?php

$pagintation = pagination(6, 'goods');

$title = "Все товары - Магазин";

$goods = R::find('goods', 'ORDER BY id DESC ' . $pagintation['sql_pages_limit']);

ob_start();
include ROOT . 'views/pages/shop/shop.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
