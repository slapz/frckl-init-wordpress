<section class="comments">
<?php if (post_password_required()) : ?>
  <p class="nopassword">
    Dieser Artikel ist passwortgesch&uuml;tzt. Du musst das Passwort
    eingeben und Kommentare sehen zu k&ouml;nnen.
  </p>
</section><!-- #comments -->
  <?php return; endif; ?>

  <h2><?php comments_number('Keine Kommentare', 'Ein Kommentar', '% Kommentare'); ?> zu &raquo;<?php the_title(); ?>&laquo;</h2>
  <?php if (have_comments()) : ?>
  <ol class="comment-list">
    <?php wp_list_comments(array('callback' => 'custom_comments')); ?>
  </ol>

  <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : ?>
  <nav class="nav-comments">
    <?php previous_comments_link('&Auml;ltere Kommentare'); ?>
    <?php next_comments_link('Neuere Kommentare'); ?>
  </nav>
  <?php endif; // check for comment navigation ?>
<?php endif; ?>
</section><!-- #comments -->

<?php comment_form(); ?>
