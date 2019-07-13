<?php

$title = 'Все заказы - Магазин';

if ( isAdmin() ) {
	$orders = R::findAll( 'orders');
} else {
	header('Location: ' . HOST);
	exit();
}

ob_start();
include ROOT . 'views/pages/order/orders.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
