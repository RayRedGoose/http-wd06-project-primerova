<?php

if (!isAdmin()) {
	header('Location: ' . HOST);
	exit();
}

$title = 'Заказы - Магазин';

$orderId = intval($_GET['id']);
$order = R::findOne( 'orders', 'id = '.$orderId );
$orderItems = json_decode($order['items']);


ob_start();
include ROOT . 'views/pages/order/order.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
