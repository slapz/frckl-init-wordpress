<aside class="sidebar" role="complementary">
  <ul>
    <?php if (!dynamic_sidebar('sidebar')) : ?>

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
