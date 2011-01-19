    <footer id="footer">
      <p>
        &copy; <?php echo date('Y'); ?>
        <a href="<?php echo home_url(); ?>/" title="<?php bloginfo('name'); ?>"><?php bloginfo('name'); ?></a> | 
        <a href="<?php bloginfo('rss2_url'); ?>" title="Abonniere den Blog-Feed">Artikel (RSS)</a> | 
        <a href="<?php bloginfo('comments_rss2_url'); ?>" title="Abonniere den Feed für Kommentare">Kommentare (RSS)</a>
      </p>
    </footer>
    <?php wp_footer(); ?>
  </div>
</body>
</html>