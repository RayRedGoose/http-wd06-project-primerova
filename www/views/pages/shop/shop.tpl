<div class="main-wrapper">
	<div class="container container--center pt-50">
		<?php if ( isset($_GET['result'])) {
			include ROOT . "views/pages/shop/parts/results.tpl";
		} ?>

		<div class="row justify-content-between align-items-center pl-15 pr-15 ">
			<div class="title-1">Магазин</div>
			<?php if ( isAdmin() ) {  ?>
			<div class="section-ui">
				<a class="button button--edit" href="<?=HOST?>item-new">Добавить товар</a>
			</div>
			<?php } ?>
		</div>

		<div class="row">
			<?php foreach ($goods as $item) { ?>
			<?php include ROOT . "views/pages/shop/parts/item-card.tpl" ?>
			<?php } ?>
		</div>

	</div>
</div>
