<?php

// ID товара  который  добавили в Корзину
$currentItemId = intval($_POST['itemId']);

// Определяем локальную корзину
if (isset($_COOKIE['cart'])) {
	// json_decode - ф-я которая преобразует JSON формат  в Объект
	// json_decode - ф-я которая преобразует JSON формат  в Ассоциативный массив, если 2-й параметр   true
	$cartLocal =  json_decode($_COOKIE['cart'], true);
} else {
	$cartLocal = array();
}

// Если такой товар уже есть в Корзине, тогда увеличеваем его кол-во на 1, если нет, то записываем его колл-во = 1
if ( isset( $cartLocal[$currentItemId] ) ) {
	$items = $cartLocal[$currentItemId];
	$items++;
	$cartLocal[$currentItemId] = $items;
} else {
	$cartLocal[$currentItemId] = 1;
}

// Сохраняем Cookies
/*
json_encode - ф-я кодирует ассоц. массив в JSON строку
*/
SetCookie("cart", json_encode($cartLocal));

// Если пользователь залогинен, то  сохраняем в БД
if ( isLoggedIn() ) {
	$currentUser = $_SESSION['logged_user'];
	$user = R::load('users', $currentUser->id);
	$user->cart = json_encode($cartLocal);
	R::store($user);
}

header("Location: " . HOST . "item?id=" . $currentItemId );
exit();

?>
