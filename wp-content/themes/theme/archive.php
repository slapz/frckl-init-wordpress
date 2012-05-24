<?php get_header(); ?>

<section class="content">

<?php if (have_posts()) : ?>
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
<?php while (have_posts()) : the_post(); ?>

  <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <header class="article-header">
      <h1><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink f&uuml;r <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
      <p>Ver&ouml;ffentlicht von <?php the_author(); ?> am <?php the_date(); ?> um <?php the_time() ?> Uhr.</p>
    </header>
    <section class="article-content">
      <?php if (has_post_thumbnail()) the_post_thumbnail(); ?>
      <?php the_excerpt(); ?>
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

  <nav class="nav-posts">
    <p><?php posts_nav_link('&nbsp;|&nbsp;'); ?></p>
  </nav>

  <?php else : ?>
  <?php get_template_part('notfound'); ?>
  <?php endif; ?>

</section>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
