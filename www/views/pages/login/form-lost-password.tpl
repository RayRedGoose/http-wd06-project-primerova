<form id="lostForm" class="login-page-form" method="POST" action="<?=HOST?>lost-password">
	<div class="login-page-form__header">Забыл пароль</div>

	<?php require ROOT . '\views\parts\errors.tpl' ?>
	<?php require ROOT . '\views\parts\success.tpl' ?>

	<div class="registration-page-form__row">
		<div class="error hidden">Введите email</div>
	</div>

	<div class="login-page-form__row">
		<input name="email" class="input" type="email" placeholder="E-mail" />
	</div>
	<div class="login-page-form__row text-center">

		<div class="login-page-form__col text-center">
			<a class="login-page__links" href="<?=HOST?>login">Перейти на страницу входа</a>
		</div>
	</div>
	<div class="login-page-form__footer">
		<input name="lost-password" type="hidden" value="lost-password" />
		<a class="button button--lost">Восстановить пароль</a>
	</div>
</form>
