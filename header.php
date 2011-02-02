<!DOCTYPE html>
<html <?php language_attributes() ?>>
<head>
  <meta charset="<?php bloginfo('charset'); ?>" />
  <title><?php
      wp_title('&mdash;', true, 'right');
      bloginfo('name');
      $site_description = get_bloginfo('description', 'display');
      if ($site_description && (is_home() || is_front_page())) echo " &mdash; " . $site_description;
  ?></title>
  
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/" />
  <link rel="shortcut icon" href="<?php echo home_url(); ?>/favicon.ico" />
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
  <meta name="description" content="<?php bloginfo('description'); ?>" />
  <script src="<?php echo get_template_directory_uri(); ?>/js/head.min.js"></script>
  <script>
    <?php /* Use a CDN after deployment, e.g. https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js */ ?>
    head.js("<?php echo get_template_directory_uri(); ?>/js/jquery-1.5.min.js", 
            "<?php echo get_template_directory_uri(); ?>/js/jquery.colorbox-min.js", 
            "<?php echo get_template_directory_uri(); ?>/js/enhancements.js", 
            "<?php echo get_template_directory_uri(); ?>/js/script.js");      
  </script>
  <?php if (is_singular() && get_option('thread_comments')) wp_enqueue_script('comment-reply'); ?>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
  <div id="container">
    
    <header id="header">
      <hgroup>
        <h1><a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a></h1>
        <h2><?php bloginfo('description'); ?></h2>
      </hgroup>
    </header>
    
    <nav id="nav">
      <?php wp_nav_menu(array('menu' => 'custom_menu', 'container' => 'none', 'menu_class' => 'clearfix')); ?>
    </nav>