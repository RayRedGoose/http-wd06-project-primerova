<div class="container mt-70 mb-120">
	<div class="title-1">Заказы в системе</div>

	<table class="table">
		<tbody>
			<?php foreach ($orders as $order) { ?>
			<?php include ROOT . "views/pages/order/parts/order-item-in-table.tpl" ?>
			<?php } ?>
		</tbody>
	</table>

</div>
