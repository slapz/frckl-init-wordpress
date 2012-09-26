<?php if (have_posts()) : ?>
<?php while (have_posts()) : the_post(); ?>

<article <?php post_class(); ?>>
  <h1><a href="<?php the_permalink() ?>"><?php the_title(); ?></a></h1>
  <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
  <?php the_content(); ?>
  <?php wp_link_pages(array(
    'before' => '<p><strong>Weiter zu Seite:</strong> ',
    'after' => '</p>',
    'next_or_number' => 'number'
  )); ?>
</article>

<?php endwhile; else : ?>
<?php get_template_part('notfound'); ?>
<?php endif; ?>

