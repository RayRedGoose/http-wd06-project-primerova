<?php

$sqlPost = '
		SELECT
			posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.author_id, posts.cat, posts.update_time,
   			users.name, users.lastname,
    		categories.cat_title
		FROM `posts`
		INNER JOIN categories ON posts.cat = categories.id
		INNER JOIN users ON posts.author_id = users.id
		WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

$post = R::getAll($sqlPost);

if (empty($post)) {
	$sqlPost = '
			SELECT
				posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.author_id, posts.update_time,
				users.name, users.lastname
			FROM `posts`
			INNER JOIN users ON posts.author_id = users.id
			WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

	$post = R::getAll($sqlPost);
	$post = $post[0];

	$post['cat_title'] = "Категория не выбрана";

} else {
	$post = $post[0];
}

$title = $post['title'];

$sqlComments = 'SELECT
			comments.text, comments.date_time, comments.user_id,
			users.name, users.lastname, users.avatar_small
		FROM `comments`
		INNER JOIN users ON comments.user_id = users.id
		WHERE comments.post_id = ' . $_GET['id'] ;

$comments = R::getAll($sqlComments);

if (isset($_POST['addComment'])) {

	if (trim($_POST['commentText']) == '') {
		$errors[] = ['title' => 'Введите текст комментария'];
	}

	if (empty($errors)) {
		$comment = R::dispense('comments');
		$comment->postId = htmlentities($_GET['id']);
		$comment->userId = htmlentities($_SESSION['logged_user']['id']);
		$comment->text = htmlentities($_POST['commentText']);
		$comment->dateTime = R::isoDateTime();
		R::store($comment);

		$comments = R::getAll( $sqlComments );

	}
}


ob_start();
include ROOT . '\views\pages\blog\blog-post.tpl';
$content = ob_get_contents();
ob_end_clean();

include ROOT . '\views\parts\head.tpl';
include ROOT . '\views\parts\header.tpl';
include ROOT . '\views\template.tpl';
include ROOT . '\views\parts\footer.tpl';
include ROOT . '\views\parts\foot.tpl';

?>
