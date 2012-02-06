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
    <?php /* if you use google analytics use this async snippet
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
     */ ?>
  </script>
  <?php wp_footer(); ?>
</body>
</html>
