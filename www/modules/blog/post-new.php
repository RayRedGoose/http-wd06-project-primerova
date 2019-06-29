<?php

if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = 'Добавить новый пост';

$cats = R::find('categories', 'ORDER BY cat_title ASC');

if (isset($_POST['postNew'])) {

  if ( trim($_POST['postTitle']) == '' ) {
		$errors[] = ['title' => 'Введите название поста'];
	}

	if ( trim($_POST['postText']) == '') {
		$errors[] = ['title' => 'Введите текст поста' ];
	}

  	if ( empty($errors)) {
      $post = R::dispense('posts');
      $post->title = htmlentities($_POST['postTitle']);
      $post->cat = htmlentities($_POST['postCat']);
      $post->text = $_POST['postText'];
      $post->authorId = $_SESSION['logged_user']['id'];
      $post->dateTime = R::isoDateTime();

      // img start

      if (isset($_FILES['postImg']['name']) && $_FILES['postImg']['tmp_name']) {

        // переменные параметров файла
        $fileName = $_FILES["postImg"]["name"];
        $fileTmpLoc = $_FILES["postImg"]["tmp_name"];
        $fileType = $_FILES["postImg"]["type"];
        $fileSize = $_FILES["postImg"]["size"];
        $fileErrorMsg = $_FILES["postImg"]["error"];
        $kaboom = explode(".", $fileName);
        $fileExt = end($kaboom);

        list($width, $height) = getimagesize($fileTmpLoc);

        // проверка ширины и высоты изображения
        if ($width < 10 || $height < 10) {
          $errors[] = ['title' => 'Изображение не имеет размеров. Загрузите изображение побольше.'];
        }

        // проверка размера файла
        if ( $fileSize > 4194304 ) {
          $errors[] = ['title' => 'Слишком большой файл', 'desc' => '<p>Файл изображения не должен быть более 4 Mb.</p>'];
        }

        // проверка расширения
        if (!preg_match("/\.(gif|jpg|jpeg|png)$/i", $fileName)) {
          $errors[]  = ['title' => 'Неверный формат файла', 'desc' => '<p>Файл изображения должен быть в формате gif, jpg, jpeg, или png.</p>', ];
        }

        // проверка ошибок
        if ( $fileErrorMsg == 1 ) {
          $errors[] = ['title' => 'При загрузке изображения произошла ошибка. Повторите попытку'];
        }

        // Перемещаем загруженный файл в нужную директорию
        $db_file_name = rand(100000000000,999999999999) . "." . $fileExt;
        $postImgFolderLocation = ROOT . '/usercontent/blog/';
        $uploadfile = $postImgFolderLocation . $db_file_name;
        $moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

        if ($moveResult != true) {
          $errors[] = ['title' => 'Ошибка сохранения файла'];
        }

        include_once ROOT . '\libs\image_resize.php';

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

      // img end

      R::store($post);
      header('Location: ' . HOST . "blog?result=postCreated");
      exit();

    }


}


ob_start();
include ROOT . '\views\pages\blog\post-new.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
