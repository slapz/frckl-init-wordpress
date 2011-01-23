<?php
/*
Template Name: Archiv
*/
?>
<?php get_header(); ?>

    <section id="content">

      <?php if (have_posts()) : ?>
      <?php while (have_posts()) : the_post(); ?>
      
      <article id="post-<?php the_ID(); ?>"  <?php post_class('clearfix'); ?>>
        <header class="articleHeader">
          <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink zu <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
          <p>Ver&ouml;ffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
        </header>
        <section class="articleContent">
          <h2>Archiv nach Monaten</h2>
          <ul>
            <?php wp_get_archives('type=monthly'); ?>
          </ul>
          <h2>Archiv nach Kategorien</h2>
          <ul>
            <?php wp_list_categories(); ?>
          </ul>
          <h2>Archiv nach Tags</h2>
          <?php wp_tag_cloud('format=list&smallest=14px&largest=14px'); ?>
        </section>
        <footer class="articleFooter">
          <?php wp_link_pages(array('before' => '<p><strong>Weiter zu Seite:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
        </footer>
      </article>

      <?php endwhile; else: ?>

      <article class="notFound">
        <h1>Nichts gefunden!</h1>
        <p>Leider wurde an dieser Stelle nicht der von Dir gew&uuml;nschte Beitrag gefunden. Aber Du kannst gerne den Blog durchsuchen:</p>
        <?php get_search_form(); ?>
      </article>

      <?php endif; ?>

    </section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>