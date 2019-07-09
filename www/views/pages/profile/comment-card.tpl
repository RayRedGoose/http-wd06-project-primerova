<div class="user-comment">
  <div class="user-comment-wrap">
    <div class="comment-wrap">
      <div class="user-name">
        <a href="<?=HOST?>post?id=<?=$comment['post_id']?>"><?=$comment['title']?></a>
      </div>
      <div class="user-date"><i class="far fa-clock"></i>
        <span class="user-date--dat"><?=$comment['date_time']?></span>
      </div>
    </div>
    <p class="user-text"><?=$comment['text']?></p>
  </div>
</div>
