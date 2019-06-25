<div class="header-admin">
	<div class="header-admin__profil">
		<div class="avatar--small">
			<?php if ( $_SESSION['logged_user']['avatar_small'] != "") { ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="avatar-small" />
			<?php } ?>
		</div>
		<div class="header-admin__block">
			<div class="header-admin__name">
				<?=$_SESSION['logged_user']['name']?> 
      			<?=$_SESSION['logged_user']['secondname']?>
			</div>
			<a class="badge-link" href="<?=HOST?>profile">
				<div class="badge">Администратор</div>
			</a>
		</div>
	</div>
	<div class="header-admin-nav">
		<div class="header-admin-nav__items"><i class="fa fa-plus-circle header-admin-nav__icons"></i>
			<a class="header-admin-nav__link" href="link">Пост</a>
		</div>
		<div class="header-admin-nav__items"><i class="fa fa-plus-circle header-admin-nav__icons"></i>
			<a class="header-admin-nav__link" href="link">Работа</a>
		</div>
		<div class="header-admin-nav__items"><i class="fa fa-edit header-admin-nav__icons"></i>
			<a class="header-admin-nav__link" href="link">Обо мне</a>
		</div>
		<div class="header-admin-nav__items"><i class="fa fa-edit header-admin-nav__icons"></i>
			<a class="header-admin-nav__link" href="link">Контакты</a>
		</div>
		<div class="header-admin-nav__items"><i class="fa fa-envelope header-admin-nav__icons"></i>
			<a class="header-admin-nav__link" href="link">Сообщение</a>
		</div>
	</div>
	<div class="header-admin__signout">
		<s class="header-admin__signout"><i class="fa fa-sign-out-alt header-admin__signout-icon"></i>
			<a class="header-admin__signout-titile" href="<?=HOST?>logout">Выход</a>
		</s>
	</div>
</div>