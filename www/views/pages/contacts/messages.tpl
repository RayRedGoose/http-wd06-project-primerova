<div class="container">
	<div class="row">
		<div class="col-xl-10 offset-1 pb-90">
			<div class="title-1 m-0 pt-60 pb-35">Сообщения от пользователей</div>

				<?php if (!empty($messages)) {
					foreach ($messages as $message){
						include ROOT . "/views/pages/contacts/message-card.tpl";
					}
        } else { ?>

          <div class="user-message mb-20">
            <div class="user-message__from pb-0">
              <div class="user-message__text mt-20">Сообщения отсутствуют!</div>
            </div>
          </div>
      	<?php   } 			?>

		</div>
	</div>
</div>
