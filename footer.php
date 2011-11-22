    <footer id="footer">
      <p>
        &copy; <a href="<?php echo home_url(); ?>/" title="<?php bloginfo('name'); ?>"><?php bloginfo('name'); ?></a> |
        <a href="<?php bloginfo('rss2_url'); ?>" title="Abonniere den Blog-Feed">Artikel (RSS)</a> |
        <a href="<?php bloginfo('comments_rss2_url'); ?>" title="Abonniere den Feed f&uuml;r Kommentare">Kommentare (RSS)</a>
      </p>
    </footer>
  </div>
  <script>
    Modernizr.load({
      test : window.jQuery,
      yep  : ['<?php echo get_template_directory_uri(); ?>/js/plugins.js', '<?php echo get_template_directory_uri(); ?>/js/script.js'],
      nope : ['<?php echo get_template_directory_uri(); ?>/js/jquery-1.7.1.min.js', '<?php echo get_template_directory_uri(); ?>/js/plugins.js', '<?php echo get_template_directory_uri(); ?>/js/script.js']
    });
    <?php /* if you use google analytics, use this code snippet for async loading>
    window._gaq = [['_setAccount','UAXXXXXXXX1'],['_trackPageview'],['_trackPageLoadTime']];
    Modernizr.load({
      load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
    });
    */ ?>
  </script>
  <?php wp_footer(); ?>
</body>
</html>
