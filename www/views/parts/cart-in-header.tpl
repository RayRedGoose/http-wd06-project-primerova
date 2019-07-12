<?php if ( isset($_COOKIE['cart']) ) { ?>
<?php
	$cartFromCookie = $_COOKIE['cart'];
	$cartArray = json_decode($cartFromCookie, true);
	$itemsInCart = array_sum($cartArray);
?>
	<?php if ( $itemsInCart > 0 ) { ?>
		<div class="cart">
			<a href="<?=HOST?>cart">
				<i class="fas fa-shopping-cart"></i>
				<?php itemsNumber( count($itemsInCart) );?>
			</a>
		</div>
	<?php }	?>
<?php }	?>
