    <aside>      
      <ul>
      <?php if ( ! dynamic_sidebar('sidebarright') ) : ?>

        <li class="widget-container widget_search">
          <?php get_search_form(); ?>
        </li>

        <li class="widget-container">
          <h3 class="widget-title">Meta</h3>
          <ul>
            <?php wp_register(); ?>
            <li><?php wp_loginout(); ?></li>
            <?php wp_meta(); ?>
          </ul>
        </li>

        <?php endif; // end primary widget area ?>
      </ul>
    </aside>