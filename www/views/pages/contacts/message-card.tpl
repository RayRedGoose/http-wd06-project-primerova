<div class="user-message mb-20">

	<div class="user-message__header">
		<div class="user-message__date">
			<?=$message->date_time?>
		</div>
		<div class="user-message__button">
			<a class="button button--del button--small" href="<?=HOST?>delete-message?id=<?=$message['id']?>">Удалить</a>
		</div>
	</div>

	<div class="user-message__from">

		<?php if ( $message->name != '') { ?>
			<div class="user-message__name">
				<?=$message->name?>
			</div>
		<?php } ?>

		<a class="user-message__email user-message__a" href="mailto:<?=$message->email?>">
			<?=$message->email?>
		</a>
	</div>

	<?php if ( $message->message != '') { ?>
		<div class="user-message__text"><?=$message->message?></div>
	<?php } ?>

	<?php if ( $message->message_file != '') { ?>
		<div class="user-message__attachments">
			<div class="user-message__attachments-caption">Прикрепленный файл:</div>
			<a 	class="user-message__attachments-name user-message__a"
				href="<?=HOST?>usercontent/upload_files/<?=$message->message_file?>"
				target="_blank">
				<?=$message->message_file_name_original?>
			</a>
		</div>
	<?php } ?>

</div>
