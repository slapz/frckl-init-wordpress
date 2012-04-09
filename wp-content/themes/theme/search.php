<?php get_header(); ?>

<section id="content">

  <?php if (have_posts()) : ?>

  <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?>>
    <h1>Suchergebnisse f&uuml;r &raquo;<?php the_search_query(); ?>&laquo;</h1>
    <section class="articleContent">
      <ol class="searchResults">
        <?php while (have_posts()) : the_post(); ?>
        <li>
          <h3><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink f&uuml;r <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>
          <?php the_excerpt(); ?>
        </li>
        <?php endwhile; ?>
      </ol>
    </section>
  </article>

  <nav class="postsNavigation">
    <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
  </nav>

  <?php else : ?>
  <?php get_template_part('notfound'); ?>
  <?php endif; ?>

</section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
