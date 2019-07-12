<?php

if ( !isAdmin() ) {
	header("Location: " . HOST . "shop/");
	die();
}

$title = "Удалить товар - Магазин";

$item = R::load('goods', $_GET['id']);

if ( isset($_POST['itemDelete']) ) {

	$imgFolderLocation = ROOT . 'usercontent/shop/';
	$itemImg = $item->img;
	if ($itemImg != "" && $itemImg != "item-no-image.jpg") {
		$picurl = $imgFolderLocation . $itemImg;
	    if ( file_exists($picurl) ) { unlink($picurl); }
		$picurl320 = $imgFolderLocation . 'preview-' . $itemImg;
	    if ( file_exists($picurl320) ) { unlink($picurl320); }
	}

	R::trash($item);
	header('Location: ' . HOST . "shop?result=itemDeleted");
	exit();

}

ob_start();
include ROOT . 'views/pages/shop/item-delete.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
