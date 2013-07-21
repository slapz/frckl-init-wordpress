    <footer class="footer" role="contentinfo">
      <p>
        &copy; <a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a>
      </p>
    </footer>
  </div>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script>
    Modernizr.load({
      test : window.jQuery,
      yep  : ['<?php echo get_template_directory_uri(); ?>/js/script.min.js'],
      nope : ['<?php echo get_template_directory_uri(); ?>/js/libs/jquery.min.js',
              '<?php echo get_template_directory_uri(); ?>/js/script.min.js']
    });
    <?php /* if you use google analytics use this snippet - you really dont need a plugin for sth like that

    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
    function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
    e=o.createElement(i);r=o.getElementsByTagName(i)[0];
    e.src='//www.google-analytics.com/analytics.js';
    r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X');ga('send','pageview');

     */ ?>
  </script>
  <?php wp_footer(); ?>
</body>
</html>
