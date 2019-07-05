<div class="container mt-50">
	<?php if ( isAdmin() ) { ?>
		<div class="flex-wrap-button">
			<div class="mr-20">
				<a class="button button--edit" href="<?=HOST?>contacts-edit"> Редактировать</a>
			</div>
			<a class="button" href="<?=HOST?>messages">Сообщения</a>
		</div>
	<?php }  ?>

	<div class="row mb-80">
		<div class="col-md-10">
			<div class="row justify-content-between">
				<div class="col-md-6">
					<h2 class="title-2 extrabold">Контакты</h2>

					<?php function showContactItem($name, $title){
						global $contacts;
						if ( @$contacts[$name] != "") {  ?>

						<div class="row contact-item">
							<div class="col"><strong><?=$title?></strong></div>
							<div class="col">
								<?php if ( $name == 'email'){ ?>
									<a 	class="contacts-block-info__item-link" target="_blank"
										href="mailto:<?=$contacts[$name]?>">
										<?=$contacts[$name]?>
									</a>
								<?php } else if ( $name == 'phone' ) { ?>
									<a 	class="contacts-block-info__item-link" target="_blank"
										href="tel:<?=$contacts[$name]?>">
										<?=$contacts[$name]?>
									</a>
								<?php } else if ( $name == 'skype' ) { ?>
									<a 	class="contacts-block-info__item-link" target="_blank"
										href="skype:<?=$contacts[$name]?>?chat">
										<?=$contacts[$name]?>
									</a>
								<?php } else if ( $name == 'github' ) { ?>
									<a 	class="contacts-block-info__item-link" target="_blank"
										href="https://github.com/<?=$contacts[$name]?>">
										<?=$contacts[$name]?>
									</a>
								<?php } else { ?>
									<?=$contacts[$name]?>
								<?php } ?>

							</div>
						</div>

						<?php }
					} ?>

					<?php showContactItem('name', 'Имя'); ?>
					<?php showContactItem('lastname', 'Фамилия'); ?>
					<?php showContactItem('email', 'Email'); ?>
					<?php showContactItem('skype', 'Skype'); ?>
					<?php showContactItem('github', 'Github'); ?>

					<?php if ( @$contacts['vk'] != "" || @$contacts['fb'] != "" || @$contacts['twitter'] != "" ): ?>
						<div class="row contact-item">
							<div class="col"><strong>Социальные сети</strong></div>
							<div class="col">

								<?php if ( @$contacts['vk'] != "") {  ?>
									<a class="contact-social-link"
										href="<?=$contacts['vk']?>">Профиль Вконтакте</a>
								<?php } ?>

								<?php if ( @$contacts['fb'] != "") {  ?>
									<a class="contact-social-link"
										href="<?=$contacts['fb']?>">Профиль Facebook</a>
								<?php } ?>

								<?php if ( @$contacts['twitter'] != "") {  ?>
									<a class="contact-social-link"
										href="<?=$contacts['twitter']?>">Профиль Twitter</a>
								<?php } ?>

							</div>
						</div>
					<?php endif ?>


					<?php showContactItem('phone', 'Телефон'); ?>
					<?php showContactItem('address', 'Адрес'); ?>



				</div>
				<div class="col-md-5">
					<h2 class="title-2 extrabold">Связаться со мной</h2>
					<form class="form">
						<input class="input mb-10" placeholder="Введите имя" />
						<input class="input mb-10" placeholder="Email" />
						<textarea class="textarea" rows="5" placeholder="Сообщение"></textarea>
						<div class="fieldset__title mt-20">Прикрепить файл</div>
						<div class="comment-row">jpg, png, pdf, doc, весом до 2Мб.</div>
						<div class="control-row mt-20 mb-20">
							<div class="file">
								<label class="file__label">
									<input class="file__input" type="file" name="file3" />
									<span class="file__inner-label file__inner-label--large-radius">Выбрать файл</span>
								</label>
								<span class="file__inner-caption">Файлы не выбран</span>
							</div>
						</div>
						<a class="button button--save" href="#"> Отправить</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
