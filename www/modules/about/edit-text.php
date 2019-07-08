<?php


if ( !isAdmin() ) {
	header("Location: " . HOST);
	die();
}

$title = "Редактировать - Об авторе";

$about = R::load('about', 1);

if ( isset($_POST['textUpdate'])) {

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

	if ( trim($_POST['description']) == '') {
		$errors[] = ['title' => 'Введите описание' ];
	}

	if ( empty($errors)) {
		// $about = R::dispense('about');
		$about->name = htmlentities($_POST['name']);
		$about->description = $_POST['description'];

		if ( isset($_FILES["photo"]["name"]) && $_FILES["photo"]["tmp_name"] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES["photo"]["name"];
			$fileTmpLoc = $_FILES["photo"]["tmp_name"];
			$fileType = $_FILES["photo"]["type"];
			$fileSize = $_FILES["photo"]["size"];
			$fileErrorMsg = $_FILES["photo"]["error"];
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
			$postImgFolderLocation = ROOT . 'usercontent/about/';
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

      // Если картинка поста  уже установлена, то удаляем файл
      $postImg = $about->avatar;
      if ( $postImg != "" && $postImg !="no-avatar.jpg") {
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
			$wmax = 222;
			$hmax = 222;
			$img = make_thumb($target_file, $resized_file, $wmax, $hmax);

			$about->avatar = $db_file_name;

		}

		R::store($about);
		header('Location: ' . HOST . "about");
		exit();
	}
}

ob_start();
include ROOT . 'views/pages/about/edit-text.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
