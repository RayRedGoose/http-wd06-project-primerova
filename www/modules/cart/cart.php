<?php

$title = "Корзина - Магазин";

if (isset($_COOKIE['cart'])) {
	$cookieCartArray = json_decode($_COOKIE['cart'], true);

	// Запрашиваем Cookie
	if ( count( $cookieCartArray ) > 0 ) {
		$cartItems = array();
		foreach ( $cookieCartArray as $key => $value) {
			$cartItems[] = $key;
		}

		// На основе Cookie отправляем запрос в БД на товрары в корзине
		$cartGoods = R::findLike('goods', [
		    'id' => $cartItems
		], ' ORDER BY id ASC ');

	} else {
		$cartGoods = array();
	}
}

$cartItemsArray = json_decode($_COOKIE['cart'], true);

$cartGoodsCount = 0;
$cartGoodsCount = array_sum($cartItemsArray);

$cartGoodsTotalPrice = 0;
foreach ($cartGoods as $item) {
	$cartGoodsTotalPrice += $cartItemsArray[$item->id ] * $item->price;
}

ob_start();
include ROOT . 'views/pages/cart/cart.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';


?>
