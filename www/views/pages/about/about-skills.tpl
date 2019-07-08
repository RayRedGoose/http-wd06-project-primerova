<?php function showIndicator($title, $value, $color = ''){
	$indicatorWidth = 120;
	$radius = ($indicatorWidth - 20) / 2;
	$perimetr = 2 * pi() * $radius;
	$offset = $perimetr * ( 1 - intval($value)/100);
?>

<!-- Green -->
<div class="col-xl-2">
	<div class="indicator">
		<svg
			width="<?=$indicatorWidth?>"
			height="<?=$indicatorWidth?>"
			class="circle"
			viewbox="0 0 <?=$indicatorWidth?> <?=$indicatorWidth?>"
			>
			<circle class="circle__bg" cx="<?=$indicatorWidth/2?>" cy="<?=$indicatorWidth/2?>" r="<?=$radius?>"></circle>
			<circle
					<?php if ( $color == '') {  ?>
						class="circle__indicator"
					<? } else { ?>
						class="circle__indicator circle__indicator--<?=$color?>"
					<? } ?>
					stroke-dasharray="<?=$perimetr?>"
					stroke-dashoffset="<?=$offset?>"
					cx="<?=$indicatorWidth/2?>" cy="<?=$indicatorWidth/2?>" r="<?=$radius?>">
				></circle>
		</svg>
		<div class="indicator__value"><?=$title?></div>
	</div>
</div>
<?php } ?>


<div class="section-technologi">
	<div class="container pb-60 pt-60">
		<div class="row">
			<div class="col-xl-4 mb-50 pl-30" style="margin-left: 21%;">
				<h2 class="title-1 mb-10 mt-0">Технологии</h2>
				<span class="title-medium">Которые использую в работе</span>
			</div>
			<?php if ( isAdmin() ) {  ?>
			<div class="col text-right" style="margin-right: 4%;">
				<a class="button button--edit" href="<?=HOST?>edit-skills"> Редактировать</a>
			</div>
			<?php } ?>
		</div>
		<div class="row stack">
			<div class="col-xl-3 text-center pr-0">
				<div class="title-3">Frontend</div>
			</div>

			<?php showIndicator('HTML5', $skills['html'], 'green' ); ?>
			<?php showIndicator('CSS3', $skills['css'], 'green' ); ?>
			<?php showIndicator('JS', $skills['js'], 'green' ); ?>
			<?php showIndicator('jQuery', $skills['jquery'], 'green' ); ?>

		</div>

		<div class="row stack">
			<div class="col-xl-3 text-center pr-0">
				<div class="title-3">Backend</div>
			</div>

			<?php showIndicator('PHP', $skills['php'], 'blue' ); ?>
			<?php showIndicator('MySql', $skills['mysql'], 'blue' ); ?>

		</div>

		<div class="row stack">
			<div class="col-xl-3 text-center pr-0">
				<div class="title-3">Workflow</div>
			</div>

			<?php showIndicator('Git', $skills['git'], 'yellow' ); ?>
			<?php showIndicator('Gulp', $skills['gulp'], 'yellow' ); ?>
			<?php showIndicator('NPM', $skills['npm'], 'yellow' ); ?>
			<?php showIndicator('Yarn', $skills['yarn'], 'yellow' ); ?>

		</div>
	</div>
</div>
