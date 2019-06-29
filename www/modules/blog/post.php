<?php

$sql = '
		SELECT
			posts.id, posts.title, posts.text, posts.post_img, posts.date_time, posts.author_id, posts.cat,
   			users.name, users.secondname,
    		categories.cat_title
		FROM `posts`
		INNER JOIN categories ON posts.cat = categories.id
		INNER JOIN users ON posts.author_id = users.id
		WHERE posts.id = ' . $_GET['id'] . ' LIMIT 1';

$post = R::getAll( $sql );
$post = $post[0];

$title = $post['title'];

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
