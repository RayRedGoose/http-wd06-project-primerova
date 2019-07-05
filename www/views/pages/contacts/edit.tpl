<?php
	function dataFromPost($fieldName){
		global $contacts;
		echo @$_POST[$fieldName] != '' ? @$_POST[$fieldName] : $contacts[$fieldName];
	}
?>


<div class="container">
	<div class="row">
		<div class="col-xl-12">
			<div class="title-1 m-0 pt-60">Редактировать данные</div>

			<?php require ROOT . "/views/parts/errors.tpl" ?>

			<form action="<?=HOST?>contacts-edit" method="POST" class="form mb-100 pb-20 pt-35">
				<div class="row fieldset">
					<div class="col-3">
						<label>
							<div class="fieldset__title">Имя</div>
							<input 	name="name"
									class="input"
									placeholder="Введите имя"
									value="<?php dataFromPost("name"); ?>"
									/>
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">Фамилия</div>
							<input 	name="lastname"
									class="input"
									placeholder="Введите фамилию"
									value="<?php dataFromPost("lastname"); ?>"
							 />
						</label>
					</div>
				</div>
				<div class="row fieldset">
					<div class="col-3">
						<label>
							<div class="fieldset__title">Email</div>
							<input
								name="email"
								class="input"
								type="email"
								placeholder="Введите email"
								value="<?php dataFromPost("email"); ?>"
								 />
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">Skype</div>
							<input
								name="skype"
								class="input"
								placeholder="Введите skype"
								value="<?php dataFromPost("skype"); ?>"
							 />
						</label>
					</div>
				</div>
				<div class="row fieldset">
					<div class="col-3">
						<label>
							<div class="fieldset__title">Вконтакте</div>
							<input
								name="vk"
								class="input"
								placeholder="Введите ссылку на профиль"
								value="<?php dataFromPost("vk"); ?>"
							/>
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">Facebook</div>
							<input
								name="fb"
								class="input"
								placeholder="Введите ссылку на профиль"
								value="<?php dataFromPost("fb"); ?>"
								/>
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">GitHub</div>
							<input
								name="github"
								class="input"
								placeholder="Введите ссылку на профиль"
								value="<?php dataFromPost("github"); ?>"
							/>
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">Twitter</div>
							<input
								name="twitter"
								class="input"
								placeholder="Введите ссылку на профиль"
								value="<?php dataFromPost("twitter"); ?>"
							/>
						</label>
					</div>
				</div>
				<div class="row fieldset mb-30">
					<div class="col-3">
						<label>
							<div class="fieldset__title">Телефон</div>
							<input
								name="phone"
								class="input"
								placeholder="Введите телефон"
								value="<?php dataFromPost("phone"); ?>"
							/>
						</label>
					</div>
					<div class="col-3">
						<label>
							<div class="fieldset__title">Адрес</div>
							<input
								name="address"
								class="input"
								placeholder="Введите адрес"
								value="<?php dataFromPost("address"); ?>"
							/>
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-auto pr-10">
						<input type="submit" name="contactsUpdate" class="button button--save" value="Сохранить">
					</div>
					<div class="col-md-auto pl-10">
						<a class="button" href="<?=HOST?>contacts">Отмена</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
