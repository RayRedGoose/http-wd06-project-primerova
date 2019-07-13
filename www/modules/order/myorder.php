<?php

$title = "Инфо о заказе - Магазин";

if ( !isLoggedIn() ) {
	header("Location: " . HOST);
	die();
}

$orderId = intval($_GET['id']);
$order = R::findOne( 'orders', 'id = '.$orderId );

if ( $order->user_id != $_SESSION['logged_user']['id']  ) {
	header("Location: " . HOST);
	die();
}

$orderItems = json_decode($order['items']);

ob_start();
include ROOT . 'views/pages/order/myorder.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
