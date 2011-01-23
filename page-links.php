<?php
/*
Template Name: Links
*/
?>
<?php get_header(); ?>

    <section id="content">
      <article>
        <header class="articleHeader">
          <h1>Links</h1>
        </header>
        <section class="articleContent">
          <ul>
            <?php wp_list_bookmarks(); ?>
          </ul>
        </section>
      </article>
    </section>

<?php get_footer(); ?>