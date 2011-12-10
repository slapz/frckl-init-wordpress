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

  <?php /* USE THIS FOR THE LIVE VERSION AFTER CALLING _minify.php
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/minified.css" />
  */ ?>
  <?php /* USE THESE FOR DEVELOPMENT */ ?>
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/normalize.css" />
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/style.css" />
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/print.css" />
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/colorbox.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
  <?php if (is_singular() && get_option('thread_comments')) wp_enqueue_script('comment-reply'); ?>
  <?php wp_head(); ?>
  <script src="<?php echo get_template_directory_uri(); ?>/js/modernizr-2.0.6.custom.min.js"></script>
  <script src="<?php echo get_template_directory_uri(); ?>/js/plugins.js"></script>
  <script src="<?php echo get_template_directory_uri(); ?>/js/script.js"></script>
  <?php /* see footer for production javascript */ ?>
</head>
<body <?php body_class(); ?>>
  <div id="container">

    <header id="header">
      <h1><a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a></h1>
      <h2><?php bloginfo('description'); ?></h2>
    </header>

    <nav id="nav">
      <ul>
        <?php wp_nav_menu(array('theme_location' => 'custom_nav', 'depth' => 1)); ?>
      </ul>
    </nav>
