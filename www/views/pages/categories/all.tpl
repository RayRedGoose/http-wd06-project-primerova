<div class="container pb-60 pt-50">

	<?php if ( isset($_GET['result'])) {
		include ROOT . "views/pages/categories/results.tpl";
	} ?>

	<?php require ROOT . "views/parts/errors.tpl" ?>

	<div class="row justify-content-between align-items-center pl-15 pr-15">
		<div class="title-1">Категории блога</div>
		<?php if ( isAdmin() ) {  ?>
		<div class="section-ui">
			<a class="button button--edit" href="<?=HOST?>category-new">Добавить категорию</a>
		</div>
		<?php } ?>
	</div>

	<table class="table">
		<thead class="thead-light">
			<tr>
				<th scope="col">id</th>
				<th scope="col">Название</th>
				<?php if ( isAdmin() ) {  ?>
				<th scope="col">Редактировать</th>
				<th scope="col">Удалить</th>
				<?php } ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($cats as $cat): ?>
			<tr>
				<th>
					<?=$cat['id']?>
				</th>
				<td>
					<?=$cat['cat_title']?>
				</td>
				<?php if ( isAdmin() && $cat['id'] != 1) {  ?>
				<td>
					<a href="<?=HOST?>category-edit?id=<?=$cat['id']?>">Редактировать</a>
				</td>
				<td>
					<a href="<?=HOST?>category-delete?id=<?=$cat['id']?>">Удалить</a>
				</td>
				<?php } ?>
			</tr>
			<?php endforeach ?>
		</tbody>

	</table>

</div>
