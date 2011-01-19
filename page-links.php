<?php
/*
Template Name: Links
*/
?>
<?php get_header(); ?>

    <section id="content">
      <article>
        <h1>Links</h1>
        <ul>
          <?php wp_list_bookmarks(); ?>
        </ul>
      </article>
    </section>

<?php get_footer(); ?>