<div class="col-4">
	<div class="card card-post mb-50">
		<?php if ( $item->img_small != "") { ?>
		<img class="card-post__img" src="<?=HOST?>usercontent/shop/<?=$item->img_small?>" alt="<?=$item->title?>" />
		<?php } else { ?>
		<img class="card-post__img" src="<?=HOST?>usercontent/shop/item-no-image.jpg" alt="<?=$item->title?>" />
		<?php } ?>

		<div class="title-4">
			<?=mbCutString($item->title, 42)?>
		</div>

		<div class="card-price-holder">
			<div class="card__price">
				<?=price_format($item['price'])?> <span>рублей</span></div>
			<a class="button" href="<?=HOST?>item?id=<?=$item->id?>">Смотреть</a>
		</div>

	</div>
</div>
