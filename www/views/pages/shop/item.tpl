<div class="container mt-70 mb-120 justify-content-center">
	<div class="blog-full-post">

		<?php if ( isAdmin() ) {  ?>
		<div class="row flex-content-end">
			<div class="blog-full-post__button-edit position-static">
				<a class="button button--edit" href="<?=HOST?>item-edit?id=<?=$item['id']?>">Редактировать</a>
				<a class="button button--del" style="height: 40px;" href="<?=HOST?>item-delete?id=<?=$item['id']?>">Удалить</a>
			</div>
		</div>
		<?php } ?>

		<!-- row -->
		<div class="row">

			<?php if ( $item['img'] != "") { ?>
			<div class="col">
				<div class="blog__image">
					<img src="<?=HOST?>usercontent/shop/<?=$item['img']?>" alt="<?=$item['title']?>" />
				</div>
			</div>
			<?php } ?>

			<!-- Item desc  -->
			<div class="col pt-40">
				<h1 class="blog__heading"><?=$item['title']?></h1>

				<div class="price-holder">
					<?php if ( $item['price_old'] ): ?>
					<div class="price-old">
						<?=price_format($item['price_old'])?>
					</div>
					<?php endif ?>

					<div class="price">
						<?=price_format($item['price'])?> <span>рублей</span>
					</div>
				</div>

				<form id="addToCart" method="POST" action="<?=HOST.'addtocart'?>">
					<input type="hidden" name="itemId" id="itemId" value="<?=$item['id']?>">
					<input type="submit" class="button mb-15" name="addToCart" value="В корзину">
				</form>

				<div class="user-content">
					<?=$item['desc']?>
				</div>
			</div>
			<!-- // Item desc  -->
		</div>
		<!-- // row -->

	</div>
</div>
