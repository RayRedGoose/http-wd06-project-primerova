<?php

$title = 'Контакты';

$contacts = R::load('contacts', 1);

if ( isset($_POST['newMessage'])) {

	if ( trim($_POST['email']) == '') {
		$errors[] = ['title' => 'Введите Email' ];
	} else if(!preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $_POST['email'])) {
    $errors[] = ['title' => 'Неверное написание email'];
  }

	if ( trim($_POST['name']) == '') {
		$errors[] = ['title' => 'Введите имя'];
	}

	if ( trim($_POST['message']) == '') {
		$errors[] = ['title' => 'Введите сообщение'];
	}

	if ( !isset($_FILES["file"]["name"])) {
		if($_FILES["file"]["size"] > 4194304) {
			$errors[] = ['title' => 'Your image file was larger than 4mb' ];
		} else if (!preg_match("/\.(gif|jpg|png|pdf|doc)$/i", $_FILES["file"]["name"]) ) {
			$errors[] = ['title' => 'Неверный формат файла', 'desc' => 'Файл должен иметь следующие расширения: jpg, gif, png, pdf, doc' ];
		} else if ($_FILES["file"]["error"] == 1) {
			$errors[] = ['title' => 'An unknown error occurred'];
		}
	}


	if ( empty($errors)) {

		$message = R::dispense('messages');
		$message->email = htmlentities($_POST['email']);
		$message->name = htmlentities($_POST['name']);
		$message->message = htmlentities($_POST['message']);
		$message->dateTime = R::isoDateTime();

		if ( isset($_FILES["file"]["name"]) && $_FILES["file"]["tmp_name"] != "" ) {

			// Write file image params in variables
			$fileName = $_FILES["file"]["name"];
			$fileTmpLoc = $_FILES["file"]["tmp_name"];
			$fileType = $_FILES["file"]["type"];
			$fileSize = $_FILES["file"]["size"];
			$fileErrorMsg = $_FILES["file"]["error"];
			$kaboom = explode(".", $fileName);
			$fileExt = end($kaboom);

			$db_file_name = rand(100000000000,999999999999) . "." . $fileExt;

			$postImgFolderLocation = ROOT . 'usercontent/upload_files/';

			// Перемещаем загруженный файл в нужную директорию
			$uploadfile = $postImgFolderLocation . $db_file_name;
			$moveResult = move_uploaded_file($fileTmpLoc, $uploadfile);

			if ($moveResult != true) {
				$errors[] = ['title' => 'File upload failed' ];
			}

			$message->message_file_name_original = $fileName;
			$message->message_file = $db_file_name;

		}

		R::store($message);

		$success[] = ['title' => 'Сообщение было успешно отправлено!'];


	}
}

ob_start();
include ROOT . 'views/pages/contacts/contacts.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
