<div class="container">
	<div class="row">
		<div class="col-xl-10 offset-1">
			<div class="title-1 m-0 pt-60">Удалить место работы</div>

			<?php require ROOT . "views/parts/errors.tpl" ?>

			<form action="<?=HOST?>delete-job?id=<?=$job['id']?>" method="POST" class="form mb-100 pb-20 pt-35">

				<div class="fieldset">
					<p>Вы действительно хотите удалить <strong><?=$job['title']?></strong> с id = <?=$job['id']?> ?</p>
				</div>

				<div class="row">
					<div class="col-md-auto pr-10">
						<input type="submit" name="deleteJob" class="button button--del" style="height: 44px; font-size: 16px;" value="Удалить">
					</div>
					<div class="col-md-auto pl-10">
						<a class="button" href="<?=HOST?>edit-job">Отмена</a>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>
