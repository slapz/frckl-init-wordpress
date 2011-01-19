<?php get_header(); ?>

    <section id="content">

      <?php if (have_posts()) : ?>

      <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
        <h1>Suchergebnisse für &laquo;<?php the_search_query(); ?>&raquo;</h1>
        <ol>
          <?php while (have_posts()) : the_post(); ?>
          <li>
            <h3><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink für <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>
            <?php the_excerpt(); ?>
          </li>
          <?php endwhile; ?>
        </ol>
      </article>

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