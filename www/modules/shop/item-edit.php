<?php

if ( !isAdmin() ) {
	header("Location: " . HOST . "shop/");
	die();
}

$title = 'Редактировать товар - Магазин';

$item = R::load('goods', $_GET['id']);

if ( isset($_POST['itemUpdate'])) {

	if ( trim($_POST['title']) == '') {
		$errors[] = ['title' => 'Введите Название товара' ];
	}

	if ( trim($_POST['price']) == '') {
		$errors[] = ['title' => 'Введите Стоимость товара' ];
	}

	if ( empty($errors)) {

		$item->title = htmlentities($_POST['title']);
		$item->price = htmlentities($_POST['price']);
		$item->priceOld = htmlentities($_POST['priceOld']);
		$item->desc = $_POST['itemDesc'];

		if ( isset($_FILES["img"]["name"]) && $_FILES["img"]["tmp_name"] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES["img"]["name"];
			$fileTmpLoc = $_FILES["img"]["tmp_name"];
			$fileType = $_FILES["img"]["type"];
			$fileSize = $_FILES["img"]["size"];
			$fileErrorMsg = $_FILES["img"]["error"];
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
			$itemImgFolderLocation = ROOT . 'usercontent/shop/';
			$uploadfile = $itemImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			// Если картинка поста  уже установлена, то удаляем файл
			$itemImg = $item->img;
			if ( $itemImg != "" && $itemImg != "item-no-image.jpg") {
				$picurl = $itemImgFolderLocation . $itemImg;
				// Удаляем аватар
				// die($picurl);
			    if ( file_exists($picurl) ) { unlink($picurl); }
				$picurl320 = $itemImgFolderLocation . 'preview-' . $itemImg;
			    if ( file_exists($picurl320) ) { unlink($picurl320); }
			}

			if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла' ];
			}

			include_once ROOT . 'libs/image_resize.php';

      $target_file =  $itemImgFolderLocation . $db_file_name;
      $resized_file = $itemImgFolderLocation . $db_file_name;
      $wmax = 920;
      $hmax = 620;
      $img = make_thumb($target_file, $resized_file, $wmax, $hmax);

			$item->img = $db_file_name;

      $target_file =  $itemImgFolderLocation . $db_file_name;
      $small_file = $itemImgFolderLocation . "preview-" . $db_file_name;
      $preview_wmax = 320;
      $preview_hmax = 140;
      $img = make_thumb($target_file, $small_file, $preview_wmax, $preview_hmax);

			$item->imgSmall = "preview-" . $db_file_name;

		} else if ($item->img == "") {

      $item->img = "item-no-image.jpg";
      $item->imgSmall = "preview-item-no-image.jpg";

    }

		R::store($item);
		header('Location: ' . HOST . "shop?result=itemUpdated");
		exit();

	}

}

ob_start();
include ROOT . 'views/pages/shop/item-edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
