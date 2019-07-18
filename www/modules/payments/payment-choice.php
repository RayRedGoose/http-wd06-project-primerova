<?php

$title = "Выбор типа оплаты - Магазин";

if ( isset($_GET['id']) && isLoggedIn() ) {
	// Пользователь залогинен
	// Проверяем что это заказ пользователя
	$orderId = intval($_GET['id']);
	$order = R::findOne('orders', 'id = ' . $orderId);
	if ( $order->user_id != $_SESSION['logged_user']['id'] ) {
		header("Location: " . HOST);
		die();
	}
	$_SESSION['order'] = $order;
} elseif ( isset($_SESSION['current_order'])  ) {
	$orderId = $_SESSION['current_order'];
	$order = R::findOne('orders', 'id = ' . $orderId);
	$_SESSION['order'] = $order;
} else {
	header("Location: " . HOST);
	die();
}

ob_start();
include ROOT . 'views/pages/payment/payment-choice.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
