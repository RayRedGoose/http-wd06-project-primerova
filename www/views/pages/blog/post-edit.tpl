<div class="container">
	<div class="row">
		<div class="col-xl-10 offset-1">
			<div class="title-1 m-0 pt-60">Редактировать пост</div>

			<?php require ROOT . "/views/parts/errors.tpl" ?>

			<form action="<?=HOST?>post-edit?id=<?=$post['id']?>" method="POST" enctype="multipart/form-data" class="form mb-100 pb-20 pt-35">

				<div class="fieldset">
					<label>
						<div class="fieldset__title">Название</div>
						<input class="input" placeholder="Введите название" name="postTitle" value="<?=$post['title']?>" />
					</label>
				</div>

				<div class="fieldset">
					<label>
						<div class="fieldset__title">Категория</div>
						<select name="postCat">

							<?php foreach ($cats as $cat): ?>
							<option value="<?=$cat['id']?>"
									<?php echo ($post['cat']==$cat['id'] ) ? "selected" : ""; ?>
								>
								<?=$cat['cat_title']?>
							</option>
							<?php endforeach ?>

						</select>
					</label>
				</div>

				<div class="fieldset">
					<div class="fieldset__title">Изображение</div>

					<div class="comment-row">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
					<div class="control-row">
						<div class="file">
							<label class="file__label">
								<input class="file__input" type="file" name="postImg" />
								<span class="file__inner-label">Выбрать файл</span>
							</label>
							<span class="file__inner-caption">Файл не выбран</span>
						</div>
					</div>
					<?php if ( $post['post_img_preview'] != "") { ?>
					<div class="control-row mt-30">
						<div class="uploaded-image">
							<img class="uploaded-image__img" src="<?=HOST?>usercontent/blog/<?=$post['post_img_preview']?>" alt="Загруженное изображение" />
							<div class="uploaded-image__button">
								<?php if ( $post['post_img_preview'] != "" && $post['post_img_preview'] != "blog-no-image.jpg") { ?>
								<input type="submit" name="deleteImg" class="button button--del button--small" value="Удалить">
								<?php }  ?>
							</div>
						</div>
					</div>
					<?php }  ?>
				</div>

				<div class="fieldset">
					<label>
						<div class="fieldset__title">Содержание</div>
						<textarea id="ckEditor" name="postText" class="textarea height-200" rows="7" placeholder="Введите описание"><?=$post['text']?></textarea>
						<?php include_once ROOT . "/views/parts/ckEditorConnect.tpl" ?>

					</label>
				</div>
				<div class="row">
					<div class="col-md-auto pr-10">
						<input type="submit" name="postUpdate" class="button button--save" value="Сохранить">
					</div>
					<div class="col-md-auto pl-10">
						<a class="button" href="<?=HOST?>blog">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
