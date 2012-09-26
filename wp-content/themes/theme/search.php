<?php if (have_posts()) : ?>

<article class="search-results">
  <h1>Suchergebnisse f&uuml;r &raquo;<?php the_search_query(); ?>&laquo;</h1>
  <ol class="searchResults">
    <?php while (have_posts()) : the_post(); ?>
    <li>
      <h2><a href="<?php the_permalink() ?>"><?php the_title(); ?></a></h2>
      <?php the_excerpt(); ?>
    </li>
    <?php endwhile; ?>
  </ol>
</article>

<nav class="nav-posts">
  <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
</nav>

<?php else : ?>
<?php get_template_part('notfound'); ?>
<?php endif; ?>

