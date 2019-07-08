<div class="container mt-60 mb-100">
	<div class="row">
		<div class="col-xl-6 offset-3">
			<div class="title-1 experience_title">Опыт работы</div>
		</div>
		<?php if ( isAdmin() ) {  ?>
		<div class="col text-right">
			<a class="button button--edit" href="<?=HOST?>edit-jobs">Редактировать</a>
		</div>
		<?php } ?>
	</div>
	<div class="row">
		<div class="col-xl-9 offset-3">
			<?php if (!empty($jobs)) {
				foreach ($jobs as $job) {
					include ROOT . "views/pages/about/card-job.tpl";
				}
			} else { ?>
				<div class="user-message mt-20 mb-20">
					<p class="about-work">Опыт работы не указан</p>
				</div>
			<?php   } 			?>

		</div>
	</div>
</div>
