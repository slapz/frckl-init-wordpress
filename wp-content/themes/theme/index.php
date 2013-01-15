<?php if (have_posts()) : ?>
<?php while (have_posts()) : the_post(); ?>

<article <?php post_class(); ?>>
  <h1><a href="<?php the_permalink() ?>"><?php the_title(); ?></a></h1>
  <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
  <?php the_content(); ?>
</article>

<?php endwhile; ?>

<nav class="nav-posts" role="navigation">
  <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
</nav>

<?php else : ?>
<?php get_template_part('notfound'); ?>
<?php endif; ?>
