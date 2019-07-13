<div class="container mt-70 mb-120">
	<div class="title-1">Мои заказы</div>

	<table class="table">
		<tbody>
			<?php foreach ($myOrders as $order) { ?>
			<?php include ROOT . "views/pages/order/parts/myorder-item-in-table.tpl" ?>
			<?php } ?>
		</tbody>
	</table>

</div>
