<form id="registrationForm" class="registration-page-form" method="POST" action="<?=HOST?>registration">
	<div class="registration-page-form__header">Регистрация</div>


	<?php require ROOT . '\views\parts\errors.tpl'?>

	<div class="registration-page-form__row">
		<div class="error hidden">Введите email</div>
	</div>

	<div class="registration-page-form__row error-busy-email-password">
		<div class="error-with-desc">Данный email уже занят</div>
		<div class="error-with-desc-bottom">
			<p>Используйте другой email, чтобы создать новый аккаунт </p>
				<div class="p mt-15">Или воспользуйтесь
					<a class="error-with-desc__link" href="#">восстановлением пароля</a> , чтобы войти на сайт.
			</div>
		</div>
	</div>
	<div class="registration-page-form__row">
		<input name="email" class="input" type="email" placeholder="E-mail" value="info@mail.com" />
	</div>
	<div class="registration-page-form__row">
		<input name="password" class="input" type="password" placeholder="Пароль" value="123456" />
	</div>
	<div class="registration-page-form__footer">
		<input name="register" type="hidden" value="register" />
		<a class="button button--registration">Регистрация</a>
	</div>
</form>
