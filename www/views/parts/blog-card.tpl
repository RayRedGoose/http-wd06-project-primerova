<div class="col-4">
	<div class="card card-post mb-50">
		<?php if ( $post->post_img_preview != "") { ?>
		<img class="card-post__img" src="<?=HOST?>usercontent/blog/<?=$post->post_img_preview?>" alt="<?=$post->title?>" />
		<?php } else { ?>
		<img class="card-post__img" src="<?=HOST?>usercontent/blog/blog-no-image.jpg" alt="<?=$post->title?>" />
		<?php } ?>
		<div class="title-4">
			<?=mbCutString($post->title, 42)?>
		</div>
		<a class="button" href="<?=HOST?>post?id=<?=$post->id?>">Читать</a>
	</div>
</div>
