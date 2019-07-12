<div class="container">
	<div class="title-1 m-0 pt-60">Удалить товар</div>

	<form action="<?=HOST?>item-delete?id=<?=$item['id']?>" method="POST" class="form mb-100 pb-20 pt-35">

		<div class="fieldset">
			<p>Вы действительно хотите удалить товар
				<strong>
					<?=$item['title']?>
				</strong> с id =
				<?=$item['id']?> ?</p>
		</div>

		<div class="row">
			<div class="col-md-auto pr-10">
				<input type="submit" name="itemDelete" class="button button--del" value="Удалить">
			</div>
			<div class="col-md-auto pl-10">
				<a class="button" href="<?=HOST?>shop">Отмена</a>
			</div>
		</div>

	</form>
</div>
