<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = 'Категории блога';

$cats = R::find('categories', 'ORDER BY cat_title ASC');

ob_start();
include ROOT . 'views/pages/categories/all.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
