<div class="container mt-70 mb-120">

	<?php if ( count(@$cartGoods) > 0) { ?>
		<div class="title-1">Корзина</div>
		<table class="table cart-table">
			<thead>
				<tr class="table-total">
					<td></td>
					<td>Наименование</td>
					<td>Количество</td>
					<td width="200">Стоимость за ед.</td>
					<td width="200">Стоимость всего</td>
					<td></td>
				</tr>
			</thead>
			<tfoot>
				<tr class="table-total">
					<td></td>
					<td></td>
					<td><?=$cartGoodsCount?> шт.</td>
					<td></td>
					<td><?=price_format($cartGoodsTotalPrice)?> руб.</td>
					<td></td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach ($cartGoods as $item) { ?>
				<?php include ROOT . "views/pages/cart/cart-item-in-table.tpl" ?>
				<?php } ?>
			</tbody>
		</table>
		<div class="row mt-20">
			<div class="col-md-auto pr-10">
				<a href="<?=HOST?>order-create" class="button button--save">Оформить заказ</a>
			</div>
			<div class="col-md-auto pl-10">
				<a class="button" href="<?=HOST?>cart">Отмена</a>
			</div>
		</div>

	<?php } else { ?>

		<div class="highlight">
			<div class="title-2">Корзина пуста</div>
		</div>

	<?php } ?>


</div>
