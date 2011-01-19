<?php get_header(); ?>

    <section id="content">
      
      <?php if (have_posts()) : ?>
      <?php while (have_posts()) : the_post(); ?>

      <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
        <header>
          <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink zu <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
        </header>
        <section>
          <?php the_content('Weiterlesen &raquo;'); ?>
        </section>
        <footer>
          <?php wp_link_pages(array('before' => '<p><strong>Weiter zu Seite:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
          <?php the_tags( '<p>Tags: ', ', ', '</p>'); ?>

          <p>
            Dieser Artikel wurde von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr in den
            Kategorien <?php the_category(', ') ?> veröffentlicht. Du kannst den 
            <?php post_comments_feed_link('RSS-Feed zu den Kommentaren'); ?> dieses Artikels hier abonnieren.

            <?php if (('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
              // kommentare und pings erlaubt ?>
              Du kannst <a href="#respond">einen Kommentar hinterlassen</a> oder einen 
              <a href="<?php trackback_url(); ?>" rel="trackback">Trackback</a> von Deiner Seite schicken.

            <?php } elseif (!('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
              // nur anpingen erlaubt ?>
              Kommentare zu diesem Artikel sind deaktiviert, aber Du kannst einen 
              <a href="<?php trackback_url(); ?> " rel="trackback">Trackback</a> von Deiner Seite schicken.

            <?php } elseif (('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
              // Kommentare erlaubt, trackbacks nicht ?>
              Du kannst gerne <a href="#respond">einen Kommentar hinterlassen</a>, Trackbacks sind deaktiviert.

            <?php } elseif (!('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
              // beides nicht erlaubt ?>
              Sowohl Kommentare als auch Trackbacks sind deaktiviert.

            <?php } edit_post_link('Bearbeiten','','.'); ?>
          </p>
        </footer>
      </article>

      <?php comments_template(); ?>

      <nav>
        <p><?php previous_post_link(); ?> | <?php next_post_link(); ?></p>
      </nav>
    
      <?php endwhile; else: ?>

      <article class="notFound">
        <h1>Nichts gefunden!</h1>
        <p>Leider wurde an dieser Stelle nicht der von Dir gewünschte Beitrag gefunden. Aber Du kannst gerne den Blog durchsuchen:</p>
        <?php get_search_form(); ?>
      </article>

      <?php endif; ?>
  
    </section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>