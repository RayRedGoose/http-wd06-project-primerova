<div class="container pt-70 pb-60">
	<div class="row">
		<div class="col-xl-3">
			<?php if (  $about->avatar != ""): ?>
			<div class="avatar">
				<img src="<?=HOST?>usercontent/about/<?=$about->avatar?>" alt="avatar-big" />
			</div>
			<?php endif ?>
		</div>
		<div class="col-xl-9">
			<div class="row">
				<div class="col-xl-6">
					<h1 class="section-main_name"><?=$about->name?></h1>
				</div>

				<?php if ( isAdmin() ) {  ?>
					<div class="col-xl-3 offset-3">
						<a class="button button--edit" href="<?=HOST?>edit-text">Редактировать</a>
					</div>
				<?php } ?>

			</div>
			<div class="row">
				<div class="col-xl-12 user-content about-text">
					<?=$about->description?>
				</div>
			</div>
		</div>
	</div>
</div>
