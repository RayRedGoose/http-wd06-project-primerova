<?php if ( $_GET['result'] == 'postDeleted' ) { ?>
<div class="error" data-notify-hide>
	Пост был удален.
</div>
<?php  } ?>

<?php if ( $_GET['result'] == 'postCreated' ) { ?>
<div class="error error--success" data-notify-hide>
	Новый пост добавлен.
</div>
<?php  } ?>

<?php if ( $_GET['result'] == 'postUpdated' ) { ?>
<div class="error error--success" data-notify-hide>
	Пост успешно отредактирован.
</div>
<?php  } ?>
