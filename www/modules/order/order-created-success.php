<?php

$title = "Заказ создан успешно - Магазин";

if ( !isset($_SESSION['current_order']) ) {
	header('Location: ' . HOST . "shop");
	exit();
}

ob_start();
include ROOT . 'views/pages/order/order-created-success.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
