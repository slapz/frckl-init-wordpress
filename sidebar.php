<aside id="sidebar">
  <ul>
  <?php if (!dynamic_sidebar('sidebar')) : ?>

    <li class="widget widget_search">
      <h2 class="widget-title">Suche</h2>
      <?php get_search_form(); ?>
    </li>

    <li class="widget">
      <h2 class="widget-title">Meta</h2>
      <ul>
        <?php wp_register(); ?>
        <li><?php wp_loginout(); ?></li>
        <?php wp_meta(); ?>
      </ul>
    </li>

    <?php endif; // end primary widget area ?>
  </ul>
</aside>
