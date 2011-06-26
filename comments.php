<section id="comments">
<?php if (post_password_required()) : ?>
  <p class="nopassword">Dieser Artikel ist passwortgesch&uuml;tzt. Du musst das Passwort eingeben und Kommentare sehen zu k&ouml;nnen.</p>
</section><!-- #comments -->
  <?php return; endif; ?>

  <h2><?php comments_number('Keine Kommentare', 'Ein Kommentar', '% Kommentare'); ?> zu &raquo;<?php the_title(); ?>&laquo;</h2>
  <?php if (have_comments()) : ?>
  <ol>
    <?php wp_list_comments('type=comment&callback=custom_comments'); ?>
  </ol>

  <?php if (get_comment_pages_count() > 1 && get_option('page_comments')) : ?>
  <nav class="commentsNavigation">
    <?php previous_comments_link('&Auml;ltere Kommentare'); ?>
    <?php next_comments_link('Neuere Kommentare'); ?>
  </nav>
  <?php endif; // check for comment navigation ?>
<?php endif; ?>
</section><!-- #comments -->

<?php /* not using <?php comment_form(); ?> because this function is not really customizable */ ?>

<section id="respond">
  <h3>Schreibe einen Kommentar</h3>

  <?php if (get_option('comment_registration') && !$user_ID) : ?>
  <p>Du musst  <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?redirect_to=<?php echo urlencode(get_permalink()); ?>">angemeldet</a> sein um einen Kommentar schreiben zu d&uuml;rfen.</p>
  <?php else : ?>
  <p>Deine E-Mail-Adresse wird nicht ver&ouml;ffentlicht. Erforderliche Felder sind mit <span class="required">*</span> markiert.</p>

  <form action="<?php echo get_option('siteurl'); ?>/wp-comments-post.php" method="post">
    <?php if ($user_ID) : ?>
    <p>
      Eingeloggt als <a href="<?php echo get_option('siteurl'); ?>/wp-admin/profile.php"><?php echo $user_identity; ?></a> |
      <a href="<?php echo get_option('siteurl'); ?>/wp-login.php?action=logout" title="Ausloggen">Ausloggen</a>
    </p>
    <fieldset>
      <legend>Dein Kommentar</legend>
      <ol>
      <?php else : ?>
    <fieldset>
      <legend>Dein Kommentar</legend>
      <ol>
        <li>
          <label for="author">Dein Name <span class="required">*</span></label>
          <input type="text" name="author" id="author" value="<?php echo $comment_author; ?>" size="30" tabindex="1" />
        </li>
        <li>
          <label for="email">Deine Email-Adresse <span class="required">*</span></label>
          <input type="text" name="email" id="email" value="<?php echo $comment_author_email; ?>" size="30" tabindex="2" />
        </li>
        <li>
          <label for="url">Deine Webseite</label>
          <input type="text" name="url" id="url" value="<?php echo $comment_author_url; ?>" size="30" tabindex="3" />
        </li>
      <?php endif; ?>
        <li>
          <label for="comment">Dein Kommentar <span class="required">*</span></label>
          <textarea name="comment" id="comment" cols="30" rows="10" tabindex="4"></textarea>
        </li>
      </ol>
      <p>
        <input name="submit" type="submit" id="submit" tabindex="5" value="Kommentar abschicken" />
        <input type="hidden" name="comment_post_ID" value="<?php echo $id; ?>" />
        <?php do_action('comment_form', $post->ID); ?>
      </p>
    </fieldset>
  </form>
  <?php endif; ?>

</section> <!-- respond -->
