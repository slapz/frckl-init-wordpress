<?php get_header(); ?>

<section class="content">

  <?php if (have_posts()) : ?>
  <?php while (have_posts()) : the_post(); ?>

  <article id="post-<?php the_ID(); ?>" <?php post_class('clearfix'); ?>>
    <header class="article-header">
      <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink zu <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
      <p>Ver&ouml;ffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
    </header>
    <section class="article-content">
      <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
      <?php the_content('Weiterlesen &raquo;'); ?>
    </section>
    <footer class="article-footer">
      <p>
        <?php the_tags('Tags: ', ', ', ' | '); ?> Kateogrien: <?php the_category(', '); ?> |
        <?php edit_post_link('Bearbeiten', '', ' | '); ?>
        <?php comments_popup_link('Einen Kommentar hinterlassen', 'Ein Kommentar', '% Kommentare'); ?>
      </p>
    </footer>
  </article>

  <?php endwhile; ?>

  <nav class="postsNavigation">
    <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
  </nav>

  <?php else : ?>
  <?php get_template_part('notfound'); ?>
  <?php endif; ?>

</section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
