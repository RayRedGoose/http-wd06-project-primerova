<form id="loginForm" class="login-page-form" method="POST" action="<?=HOST?>login">
	<div class="login-page-form__header">Вход на сайт</div>


	<?php require ROOT . '\views\parts\errors.tpl'?>

	<div class="registration-page-form__row">
		<div class="error hidden">Введите email</div>
	</div>

	<div class="login-page-form__row">
		<input name="email" class="input" type="email" placeholder="E-mail" />
	</div>
	<div class="login-page-form__row">
		<input name="password" class="input" type="password" placeholder="Пароль" />
	</div>
	<div class="login-page-form__row">
		<div class="login-page-form__col">
			<div class="checkbox">
				<label class="checkbox__label">
					<input class="checkbox__input" type="checkbox" checked="checked" />
					<span class="checkbox__check-inner"></span>
					<span class="checkbox__check-inner-label">Запомнить меня</span>
				</label>
			</div>
		</div>
		<div class="login-page-form__col float-right">
			<a class="login-page__links" href="<?=HOST?>lost-password">Забыл пароль</a>
		</div>
	</div>
	<div class="login-page-form__footer">
		<input name="login" type="hidden" value="login" />
		<a class="button button--enter">Войти</a>
	</div>
</form>
