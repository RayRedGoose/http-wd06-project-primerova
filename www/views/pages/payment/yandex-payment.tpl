<div class="container mt-70 mb-120">
	<div class="title-2">Оплата заказа через Яндекс.Деньги</div>


	<form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">

		<input type="hidden" name="receiver" value="<?=YANDEX_WALLET?>">
		<input type="hidden" name="formcomment" value="Онлайн покупка: <?=SITE_NAME?>">
		<input type="hidden" name="short-dest" value="Онлайн покупка: <?=SITE_NAME?>">

		<input type="hidden" name="label" value="<?=$_SESSION['order']['id']?>">
		<input type="hidden" name="quickpay-form" value="shop">
		<input type="hidden" name="targets" value="Оплата в магазине <?=SITE_NAME?> заказ № <?=$_SESSION['order']['id']?>">
		<input type="hidden" name="sum" value="<?=$_SESSION['order']['total_price']?>" data-type="number">

		<input type="hidden" name="successURL" value="<?=HOST . 'after-payment'?>">

		<div class="control-row  mb-15">
			<div class="radio">
				<label class="radio__label">
					<input class="radio__input" type="radio" name="paymentType" value="PC">
					<span class="radio__check-inner"></span>
					<span class="radio__check-inner-label">Яндекс.Деньгами</span>
				</label>
			</div>
		</div>

		<div class="control-row mb-25">
			<div class="radio">
				<label class="radio__label">
					<input class="radio__input" type="radio" name="paymentType" value="AC">
					<span class="radio__check-inner"></span>
					<span class="radio__check-inner-label">Банковской картой</span>
				</label>
			</div>
		</div>

		<input class="button button--save" type="submit" value="Перевести">
	</form>



</div>
