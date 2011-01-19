<?php get_header(); ?>

    <section id="content">

    <?php if (have_posts()) : ?>

      <?php $post = $posts[0]; ?>
      <?php if (is_category()) { ?>
      <h1>Archiv für die Kategorie &laquo;<?php single_cat_title(); ?>&raquo;</h1>

      <?php } elseif(is_tag()) { ?>
      <h1>Artikel die mit &laquo;<?php single_tag_title(); ?>&raquo; getaggt wurden</h1>

      <?php } elseif (is_day()) { ?>
      <h1>Archiv für den <?php get_the_date(); ?></h1>

      <?php } elseif (is_month()) { ?>
      <h1>Archiv für <?php get_the_date('F Y'); ?></h1>

      <?php } elseif (is_year()) { ?>
      <h1>Archiv für <?php get_the_date('Y'); ?></h1>

      <?php } elseif (is_author()) { ?>
      <h1>Archiv nach Autoren</h1>

      <?php } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
      <h1>Blog Archives</h1>

    <?php } ?>
    <?php while (have_posts()) : the_post(); ?>

      <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
        <header>
          <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink für <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
          <p>Veröffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
        </header>
        <section>
          <?php the_excerpt(); ?>
        </section>
        <footer>
          <p><?php the_tags('Tags: ', ', ', ' | '); ?> Kateogrien: <?php the_category(', '); ?> | <?php edit_post_link('Bearbeiten', '', ' | '); ?> <?php comments_popup_link('Einen Kommentar hinterlassen', 'Ein Kommentar', '% Kommentare'); ?></p>
        </footer>
      </article>

      <?php endwhile; ?>

      <nav>
        <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
      </nav>

      <?php else : ?>

      <article class="notFound">
        <h1>Nichts gefunden!</h1>
        <p>Leider wurde an dieser Stelle nicht der von Dir gewünschte Beitrag gefunden. Aber Du kannst gerne den Blog durchsuchen:</p>
        <?php get_search_form(); ?>
      </article>
      
      <?php endif; ?>

    </section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
