<?php
	if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1 && $_SESSION['role'] == 'admin'   ) {
		include ROOT . 'views/parts/admin-panel.tpl';
	}
?>

<div class="header">
	<div class="header--vignette">
		<div class="header__top mb-0">
			<?php include( ROOT . 'views/parts/header-logo.tpl'); ?>

			<?php
				if ( isset($_SESSION['logged_user']) && $_SESSION['login'] == 1  ) {

					// Пользователь на сайте
					if ( $_SESSION['role'] != 'admin' ) {
						include( ROOT . 'views/parts/header-user-profile.tpl');
					}

				} else {
					// Нет  пользователя
					include( ROOT . 'views/parts/header-user-login-links.tpl');
				}
			?>

		</div>
		<?php include( ROOT . 'views/parts/header-nav.tpl'); ?>
	</div>
</div>
