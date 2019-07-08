<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать пост";

$post = R::load('posts', $_GET['id']);
$cats = R::find('categories', 'ORDER BY cat_title ASC');

if (isset($_POST['deleteImg'])) {

	$postImg = $post->post_img;
	$postImgFolderLocation = ROOT . 'usercontent/blog/';
	if ( $postImg != "" && $postImg !="blog-no-image.jpg") {
		$picurl = $postImgFolderLocation . $postImg;
		// Удаляем...
			if ( file_exists($picurl) ) { unlink($picurl); }
		$picurl320 = $postImgFolderLocation . 'preview-' . $postImg;
			if ( file_exists($picurl320) ) { unlink($picurl320); }
	}

	$post->post_img = "blog-no-image.jpg";
	$post->post_img_preview = "blog-no-image.jpg";
	R::store($post);
	header('Location: ' . HOST . "post-edit?id=" .$_GET['id']);
	exit();
}

if (isset($_POST['postUpdate'])) {

	if ( trim($_POST['postTitle']) == '') {
		$errors[] = ['title' => 'Введите Название поста' ];
	}

	if ( trim($_POST['postText']) == '') {
		$errors[] = ['text' => 'Введите Текст поста' ];
	}


	if ( empty($errors)) {
		$post->title = htmlentities($_POST['postTitle']);
		$post->cat = htmlentities($_POST['postCat']);
		$post->text = $_POST['postText'];
		$post->authorId = $_SESSION['logged_user']['id'];
		$post->updateTime = R::isoDateTime();

		if ( isset($_FILES["postImg"]["name"]) && $_FILES["postImg"]["tmp_name"] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES["postImg"]["name"];
			$fileTmpLoc = $_FILES["postImg"]["tmp_name"];
			$fileType = $_FILES["postImg"]["type"];
			$fileSize = $_FILES["postImg"]["size"];
			$fileErrorMsg = $_FILES["postImg"]["error"];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			// Check file propertties on different conditions
			list($width, $height) = getimagesize($fileTmpLoc);
			if($width < 10 || $height < 10){
				$errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.' ];
			}

			if ( $fileSize > 4194304 ) {
				$errors[] = ['title' => 'Файл изображения не должен быть более 4 Mb' ];
			}

			if ( !preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName) ) {
				$errors[]  = [ 'title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>', ];
			}

			if ( $fileErrorMsg == 1 ) {
				$errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку' ];
			}

			// Перемещаем загруженный файл в нужную директорию
			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;
			$postImgFolderLocation = ROOT . 'usercontent/blog/';
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			// Если картинка поста  уже установлена, то удаляем файл
			$postImg = $post->post_img;
			if ( $postImg != "" && $postImg !="blog-no-image.jpg") {
				$picurl = $postImgFolderLocation . $postImg;
				// Удаляем аватар
				// die($picurl);
			    if ( file_exists($picurl) ) { unlink($picurl); }
				$picurl320 = $postImgFolderLocation . 'preview-' . $postImg;
			    if ( file_exists($picurl320) ) { unlink($picurl320); }
			}

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла' ];
			}

      include_once ROOT . 'libs/image_resize.php';

      $target_file =  $postImgFolderLocation . $db_file_name;
      $resized_file = $postImgFolderLocation . $db_file_name;
      $wmax = 920;
      $hmax = 620;
      $img = make_thumb($target_file, $resized_file, $wmax, $hmax);

      $post->postImg = $db_file_name;

      $target_file =  $postImgFolderLocation . $db_file_name;
      $small_file = $postImgFolderLocation . "preview-" . $db_file_name;
      $preview_wmax = 320;
      $preview_hmax = 140;
      $img = make_thumb($target_file, $small_file, $preview_wmax, $preview_hmax);

      $post->postImgPreview = "preview-" . $db_file_name;

		} else if ($post->postImg == "") {

      $post->postImg = "blog-no-image.jpg";
      $post->postImgPreview = "blog-no-image.jpg";

    }

		R::store($post);
		header('Location: ' . HOST . "post?id=" . $_GET['id'] . "&result=postUpdated");
		exit();

	}
}

ob_start();
include ROOT . 'views/pages/blog/post-edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
