<div class="container">
	<div class="title-1 m-0 pt-60">Создать товар</div>

	<?php require ROOT . "views/parts/errors.tpl" ?>

	<form action="<?=HOST?>item-new" method="POST" enctype="multipart/form-data" class="form mb-100 pb-20 pt-35">

		<div class="fieldset">
			<label>
				<div class="fieldset__title">Название</div>
				<input type="text" class="input" placeholder="Введите название" name="title" />
			</label>
		</div>

		<div class="row">
			<div class="col">
				<div class="fieldset">
					<label>
						<div class="fieldset__title">Цена</div>
						<input type="text" class="input" placeholder="" name="price" />
					</label>
				</div>
			</div>
			<div class="col">
				<div class="fieldset">
					<label>
						<div class="fieldset__title">Старая цена</div>
						<input type="text" class="input" placeholder="" name="priceOld" />
					</label>
				</div>
			</div>
		</div>


		<div class="fieldset">
			<div class="fieldset__title">Изображение</div>
			<div class="comment-row">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
			<div class="control-row">
				<div class="file">
					<label class="file__label">
						<input class="file__input" type="file" name="itemImg" />
						<span class="file__inner-label">Выбрать файл</span>
					</label>
					<span class="file__inner-caption">Файл не выбран</span>
				</div>
			</div>
		</div>

		<div class="fieldset">
			<label>
				<div class="fieldset__title">Описание</div>
				<textarea id="ckEditor" name="itemDesc" class="textarea height-200" rows="7" placeholder="Введите описание"></textarea>
				<?php include_once ROOT . "views/parts/ckEditorConnect.tpl" ?>
			</label>
		</div>

		<div class="row">
			<div class="col-md-auto pr-10">
				<input type="submit" name="itemNew" class="button button--save" value="Сохранить">
			</div>
			<div class="col-md-auto pl-10">
				<a class="button" href="<?=HOST?>shop">Отмена</a>
			</div>
		</div>

	</form>
</div>
