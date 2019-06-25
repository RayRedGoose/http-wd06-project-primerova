<div class="header-user__block">
	<div class="header-user__profil float-left mr-20">
		<div class="avatar--small">
			<?php if ( $_SESSION['logged_user']['avatar_small'] != "") { ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$_SESSION['logged_user']['avatar_small']?>" alt="avatar-small" />
			<?php } ?>
		</div>
	</div>
	<div class="header-user__profil-block">
		<div class="header-user__name">
			<?=$_SESSION['logged_user']['name']?> 
			<?=$_SESSION['logged_user']['secondname']?>
		</div>
		<div class="header-user__rank">Пользователь</div>
		<div class="header-user__buttons-group">
			<div class="header-user__buttons-profile mr-10">
				<a class="button button--profile" href="<?=HOST?>profile"> Профиль</a>
			</div>
			<div class="header-user__buttons-signout">
				<a class="button button--profile" href="<?=HOST?>logout"> Выход</a>
			</div>
		</div>
	</div>
</div>