<?php get_header(); ?>

    <section id="content" class="g8">

    <?php if (have_posts()) : ?>
      <header class="archiveHeader">
        <?php $post = $posts[0]; ?>
        <?php if (is_category()) { ?>
        <h1>Archiv f&uuml;r die Kategorie &raquo;<?php single_cat_title(); ?>&laquo;</h1>

        <?php } elseif(is_tag()) { ?>
        <h1>Artikel die mit &raquo;<?php single_tag_title(); ?>&laquo; getaggt wurden</h1>

        <?php } elseif (is_day()) { ?>
        <h1>Archiv f&uuml;r den <?php get_the_date(); ?></h1>

        <?php } elseif (is_month()) { ?>
        <h1>Archiv f&uuml;r <?php get_the_date('F Y'); ?></h1>

        <?php } elseif (is_year()) { ?>
        <h1>Archiv f&uuml;r <?php get_the_date('Y'); ?></h1>

        <?php } elseif (is_author()) { ?>
        <h1>Archiv nach Autoren</h1>

        <?php } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
        <h1>Blog Archiv</h1>
    <?php } ?>
      </header>
    <?php while (have_posts()) : the_post(); ?>

      <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
        <header class="articleHeader">
          <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink f&uuml;r <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
          <p>Ver&ouml;ffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
        </header>
        <section class="articleContent">
          <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
          <?php the_excerpt(); ?>
        </section>
        <footer class="articleFooter">
          <p><?php the_tags('Tags: ', ', ', ' | '); ?> Kateogrien: <?php the_category(', '); ?> | <?php edit_post_link('Bearbeiten', '', ' | '); ?> <?php comments_popup_link('Einen Kommentar hinterlassen', 'Ein Kommentar', '% Kommentare'); ?></p>
        </footer>
      </article>

      <?php endwhile; ?>

      <nav class="postsNavigation">
        <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
      </nav>

      <?php else : ?>

      <article class="notFound">
        <h1>Nichts gefunden!</h1>
        <p>Leider wurde an dieser Stelle nicht der von Dir gew&uuml;nschte Beitrag gefunden. Aber Du kannst gerne den Blog durchsuchen:</p>
        <?php get_search_form(); ?>
      </article>
      
      <?php endif; ?>

    </section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
