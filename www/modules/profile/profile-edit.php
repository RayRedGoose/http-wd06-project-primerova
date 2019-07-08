<?php

$title = 'Редактировать профиля';

$currentUser = $_SESSION['logged_user'];

$user = R::load('users', $currentUser->id);

if (isset($_POST['deleteAvatar'])) {

	$avatarImg = $user->avatar;
	$avatarImgSm = $user->avatar_small;
	$avatarImgFolderLocation = ROOT . 'usercontent/avatar/';
	if ( $avatarImg != "" && $avatarImg !="no-avatar.jpg" && $avatarImgSm !="48-no-avatar.jpg") {
		$picurl = $avatarImgFolderLocation . $avatarImg;
		// Удаляем...
			if ( file_exists($picurl) ) { unlink($picurl); }
		$picurl48 = $avatarImgFolderLocation . '48-' . $avatarImg;
			if ( file_exists($picurl48) ) { unlink($picurl48); }
	}

	$user->avatar = "no-avatar.jpg";
	$user->avatar_small = "48-no-avatar.jpg";
	R::store($user);
	header('Location: ' . HOST . "profile-edit");
	exit();

}

if (isset($_POST['profile-update'])) {
  if ( trim($_POST['email']) == '' ) {
		$errors[] = ['title' => 'Введите Email'];
	}

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите Имя' ];
	}

  if ( trim($_POST['lastname']) == '') {
		$errors[] = ['title' => 'Введите Фамилию' ];
	}

	if(!preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $_POST['email'])) {
		$errors[] = ['title' => 'Неверное написание email'];
	}

	if ( empty($errors)) {
    $user->name = htmlentities($_POST['name']);
    $user->lastname = htmlentities($_POST['lastname']);
    $user->email = htmlentities($_POST['email']);
    $user->city = htmlentities($_POST['city']);
    $user->country = htmlentities($_POST['country']);

    // img - start
    if (isset($_FILES['avatar']['name']) && $_FILES["avatar"]["tmp_name"] != "") {

      // переменные параметров файла
      $fileName = $_FILES["avatar"]["name"];
			$fileTmpLoc = $_FILES["avatar"]["tmp_name"];
			$fileType = $_FILES["avatar"]["type"];
			$fileSize = $_FILES["avatar"]["size"];
			$fileErrorMsg = $_FILES["avatar"]["error"];
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

      // проверка установлен ли аватара
      $avatar = $user->avatar;
			$avatarFolderLocation = ROOT . 'usercontent/avatar/';

      if ( $avatar != "" && $avatar !="no-avatar.jpg" ) {
				$picurl = $avatarFolderLocation . $avatar;
				// Удаляем аватар
				// die($picurl);
			    if ( file_exists($picurl)) {unlink($picurl);}
				$picurl48 = $avatarFolderLocation . '48-' . $avatar;
			    if ( file_exists($picurl48) ) {unlink($picurl48);}
			}

      // Перемещаем загруженный файл в нужную директорию
			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;
			$uploadfile = $avatarFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

      if ($moveResult != true) {
				$errors[] = ['title' => 'Ошибка сохранения файла'];
			}

      include_once ROOT . 'libs/image_resize.php';

      $target_file =  $avatarFolderLocation . $db_file_name;
			$resized_file = $avatarFolderLocation . $db_file_name;
			$wmax = 222;
			$hmax = 222;
			$img = make_thumb($target_file, $resized_file, $wmax, $hmax);

			$user->avatar = $db_file_name;

			$target_file =  $avatarFolderLocation . $db_file_name;
			$small_file = $avatarFolderLocation . "48-" . $db_file_name;
			$wsmax = 48;
			$hsmax = 48;
			$img = make_thumb($target_file, $small_file, $wsmax, $hsmax);

      $user->avatarSmall = "48-" . $db_file_name;

    } else if ($user->avatar == "") {

      $user->avatar = "no-avatar.jpg";
      $user->avatar_small = "no-avatar.jpg";

    }
    // img - end

    R::store($user);
    $_SESSION['logged_user'] = $user;
    header('Location: ' . HOST . 'profile');
    exit();

  }
}

ob_start();
include ROOT . 'views/pages/profile/profile-edit.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
