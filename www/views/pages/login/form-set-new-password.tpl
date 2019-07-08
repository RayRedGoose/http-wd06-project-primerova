<form id="setNewPasswordForm" class="login-page-form" method="POST" action="<?=HOST?>set-new-password">
	<?php if ( $newPasswordReady == false ): ?>
		<div class="login-page-form__header">Введите новый пароль</div>
	<?php endif ?>

  <?php require ROOT . 'views/parts/errors.tpl' ?>
	<?php require ROOT . 'views/parts/success.tpl' ?>

	<div class="registration-page-form__row">
		<div class="error hidden"></div>
	</div>

	<?php if ( $newPasswordReady == false ): ?>
		<div class="login-page-form__row">
			<input name="resetpassword" class="input" type="password" placeholder="Новый пароль" />
		</div>
	<?php endif ?>
	<div class="login-page-form__row text-center">
		<div class="login-page-form__col text-center">
			<a class="login-page__links" href="<?=HOST?>login">Перейти на страницу входа</a>
		</div>
	</div>
	<div class="login-page-form__footer">
		<?php if ( $newPasswordReady == false ): ?>
			<input type="hidden" name="resetemail" value="<?=$_GET['email']?>">
			<input type="hidden" name="onetimecode" value="<?=$_GET['code']?>">
			<input name="set-new-password" type="hidden" value="set-new-password" />
			<a class="button button--set-new-password">Установить новый пароль</a>
		<?php endif ?>
	</div>
</form>
