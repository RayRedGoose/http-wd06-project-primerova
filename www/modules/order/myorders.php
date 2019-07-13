<?php

$title = 'Мои заказы - Магазин';

if ( isLoggedIn() ) {
	$myOrders = R::find( 'orders', ' user_id = ' .$_SESSION['logged_user']['id'] );
} else {
	header('Location: ' . HOST);
	exit();
}

ob_start();
include ROOT . 'views/pages/order/myorders.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
