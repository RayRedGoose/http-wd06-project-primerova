<?php 
	foreach ($success as $item) {
		if ( count($item) == 1) {  ?>

			<!-- Однострочная ошибка -->
			<div class="error error--success"><?=$item['title']?></div>

<?php 	} else if ( count($item) == 2 ) { ?>

			<!-- Ошибка с описанием -->
			<div class="error-with-desc error--success"><?=$item['title']?></div>
			<div class="error-with-desc-bottom">
				<?=$item['desc']?>
			</div>

<?php
		}
	}
 ?>
