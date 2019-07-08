<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Удалить пост";
$post = R::load('posts', $_GET['id']);


if ( isset($_POST['postDelete']) ) {

	$postImgFolderLocation = ROOT . 'usercontent/blog/';
	$postImg = $post->post_img;
	if ( $postImg != "" && $postImg != "blog-no-image.jpg") {
		$picurl = $postImgFolderLocation . $postImg;
		// Удаляем аватар
		// die($picurl);
	    if ( file_exists($picurl) ) { unlink($picurl); }
		$picurl320 = $postImgFolderLocation . 'preview-' . $postImg;
	    if ( file_exists($picurl320) ) { unlink($picurl320); }
	}

	R::trash($post);
	header('Location: ' . HOST . "blog?result=postDeleted");
	exit();

}

ob_start();
include ROOT . 'views/pages/blog/post-delete.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
