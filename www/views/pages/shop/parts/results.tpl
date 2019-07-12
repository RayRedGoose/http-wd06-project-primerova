<?php if ( $_GET['result'] == 'itemDeleted' ) { ?>
<div class="error" data-notify-hide>
	Товар был удален.
</div>
<?php  } ?>

<?php if ( $_GET['result'] == 'itemCreated' ) { ?>
<div class="error error--success" data-notify-hide>
	Новый товар добавлен.
</div>
<?php  } ?>

<?php if ( $_GET['result'] == 'itemUpdated' ) { ?>
<div class="error error--success" data-notify-hide>
	Товар успешно отредактирован.
</div>
<?php  } ?>
