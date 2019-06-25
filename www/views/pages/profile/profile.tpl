<div class="container">
	<div class="row align-items-center mt-40">
		<div class="col offset-md-1">
			<div class="title-1 color">Профиль</div>
		</div>
		<div class="col text-right">
			<a class="button button--edit" href="<?=HOST?>profile-edit">Редактировать</a>
		</div>
	</div>
	<div class="row offset-md-1">
		<div class="col-md-auto">
			<div class="avatar">
			<?php if ( $_SESSION['logged_user']['avatar'] != "") { ?>
			<img src="<?=HOST?>usercontent/avatar/<?=$currentUser->avatar?>" alt="<?=$currentUser->name?> <?=$currentUser->lastname?>" />
			<?php } ?>

			</div>
		</div>
		<div class="col">
			<div class="user-info">
				<div class="user-info__title">Имя и фамилия</div>
				<div class="user-info__desc"><?=$currentUser->name?> <?=$currentUser->lastname?></div>
			</div>
			<div class="user-info">
				<div class="user-info__title">Email</div>
				<div class="user-info__desc">
					<a href="mailto:google.com"><?=$currentUser->email?></a>
				</div>
			</div>
			<div class="user-info">
				<div class="user-info__title">Страна, Город</div>
				<div class="user-info__desc"><?=$currentUser->country?> <?=$currentUser->city?></div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-10">
			<div class="title-2 color">Комментарии пользователя</div>
			<div class="profile-comments mb-100">
				<div class="user-comment">
					<div class="user-comment-wrap">
						<div class="comment-wrap">
							<div class="user-name">
								<a href="#">Поездка в LA</a>
							</div>
							<div class="user-date"><i class="far fa-clock"></i>
								<span class="user-date--dat">05 Мая 2017 года в 15:45</span>
							</div>
						</div>
						<p class="user-text">Замечательный парк, обязательно отправлюсь туда этим летом.</p>
					</div>
				</div>
				<div class="user-comment">
					<div class="user-comment-wrap">
						<div class="comment-wrap">
							<div class="user-name">
								<a href="#">Ноутбук для веб-разработчика</a>
							</div>
							<div class="user-date"><i class="far fa-clock"></i>
								<span class="user-date--dat">15 Мая 2017 года в 10:02</span>
							</div>
						</div>
						<p class="user-text">Замечательный парк, обязательно отправлюсь туда этим летом.</p>
					</div>
				</div>
				<div class="user-comment">
					<div class="user-comment-wrap">
						<div class="comment-wrap">
							<div class="user-name">
								<a href="#">Настройка Sublime</a>
							</div>
							<div class="user-date"><i class="far fa-clock"></i>
								<span class="user-date--dat">12 Мая 2017 года в 20:39</span>
							</div>
						</div>
						<p class="user-text">Замечательный парк, обязательно отправлюсь туда этим летом.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
