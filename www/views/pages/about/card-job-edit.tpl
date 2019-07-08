<div class="user-message mb-20">
	<div class="user-message__header">
		<div class="user-message__date"><?=$job->period?></div>
		<div class="user-message__button">
			<a class="button button--del button--small" href="<?=HOST?>delete-job?id=<?=$job->id?>">Удалить</a>
		</div>
	</div>
	<div class="title-4"><?=$job->title?></div>
	<div class="user-message__text"><?=$job->description?></div>
</div>
