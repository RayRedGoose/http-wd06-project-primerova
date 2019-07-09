<?php

$currentUser = $_SESSION['logged_user'];

$title = 'Профиль пользователя';

$sqlComments = 'SELECT
			comments.text, comments.date_time, comments.user_id, comments.post_id,
			users.name, users.lastname, users.avatar_small,
      posts.title
		FROM `comments`
		INNER JOIN users ON comments.user_id = users.id
    INNER JOIN posts ON comments.post_id = posts.id
		WHERE comments.user_id = ' . $_SESSION['logged_user']['id'];

$comments = R::getAll($sqlComments);

ob_start();
include ROOT . 'views/pages/profile/profile.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . 'views/parts/head.tpl';
include ROOT . 'views/parts/header.tpl';
include ROOT . 'views/template.tpl';
include ROOT . 'views/parts/footer.tpl';
include ROOT . 'views/parts/foot.tpl';

?>
