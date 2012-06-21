<?php
/*
Template Name: Custom Template
*/
?>
<?php get_header(); ?>

<section class="content">

  <?php if (have_posts()) : ?>
  <?php while (have_posts()) : the_post(); ?>

  <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?>>
    <header class="articleHeader">
      <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink zu <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
      <p>Ver&ouml;ffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
    </header>
    <section class="articleContent">
      <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
      <?php the_content('Weiterlesen &raquo;'); ?>
    </section>
    <footer class="articleFooter">
      <?php wp_link_pages(array('before' => '<p><strong>Weiter zu Seite:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
    </footer>
  </article>

  <?php endwhile; else: ?>
  <?php get_template_part('notfound'); ?>
  <?php endif; ?>

</section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
