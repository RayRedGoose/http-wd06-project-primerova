<div class="header__nav-block">
	<ul class="header__nav">
		<li class="header__nav-items">
			<a class="header__nav-link<?=($uri[0] == "") ? "--active" : ""?>" href="<?=HOST?>">Главная</a>
		</li>
		<li class="header__nav-items">
			<a class="header__nav-link<?=($uri[0] == "about") ? "--active" : ""?>" href="<?=HOST?>about">Обо мне</a>
		</li>
		<li class="header__nav-items">
			<a class="header__nav-link<?=($uri[0] == "shop") ? "--active" : ""?>" href="<?=HOST?>shop">Магазин</a>
		</li>
		<li class="header__nav-items">
			<a class="header__nav-link<?=($uri[0] == "blog") ? "--active" : ""?>" href="<?=HOST?>blog">Блог</a>
		</li>
		<li class="header__nav-items">
			<a class="header__nav-link<?=($uri[0] == "contacts") ? "--active" : ""?>" href="<?=HOST?>contacts">Контакты</a>
		</li>
	</ul>
</div>
