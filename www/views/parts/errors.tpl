<?php

	foreach ($errors as $error) {
		if ( count($error) == 1) {  ?>

			<!-- Однострочная ошибка -->
			<div class="error"><?=$error['title']?></div>

<?php 	} else if ( count($error) == 2 ) { ?>

			<!-- Ошибка с описанием -->
			<div class="error-with-desc"><?=$error['title']?></div>
			<div class="error-with-desc-bottom">
				<p><?=$error['desc']?></p>	
			</div>

<?php
		}
	}
 ?>
