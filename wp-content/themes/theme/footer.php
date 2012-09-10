    <footer class="footer">
      <p>
        &copy; <a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a>
      </p>
    </footer>
  </div>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
  <script>
    Modernizr.load({
      test : window.jQuery,
      yep  : ['<?php echo get_template_directory_uri(); ?>/js/script.min.js'],
      nope : ['<?php echo get_template_directory_uri(); ?>/js/jquery-1.8.1.min.js',
              '<?php echo get_template_directory_uri(); ?>/js/script.min.js']
    });
    <?php /* if you use google analytics use this snippet - you really dont need a plugin for sth like that
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
     */ ?>
  </script>
  <?php wp_footer(); ?>
</body>
</html>
