<?php

$title = "Оплата заказа совершена - Магазин";

unset($_SESSION['current_order']);
unset($_SESSION['order']);

ob_start();
include ROOT . 'views/pages/payment/after-payment.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
