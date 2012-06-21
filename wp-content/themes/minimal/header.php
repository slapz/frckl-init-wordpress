<!DOCTYPE html>
<!--[if lt IE 8]> <html class="no-js lt-ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" <?php language_attributes(); ?>> <!--<![endif]-->
<head>
  <meta charset="<?php bloginfo('charset'); ?>" />
  <title><?php
    wp_title('&mdash;', true, 'right'); bloginfo('name');
    $site_description = get_bloginfo('description', 'display');
    if ($site_description && (is_home() || is_front_page())) echo " &mdash; " . $site_description;
  ?></title>
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/main.css" />
  <script src="<?php echo get_template_directory_uri(); ?>/js/modernizr-2.5.3.min.js"></script>
  <meta name="viewport" content="width=device-width" />
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
  <?php if (is_singular() && get_option('thread_comments')) wp_enqueue_script('comment-reply'); ?>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
  <div class="container">

    <header class="header">
      <h1><a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a></h1>
      <h2><?php bloginfo('description'); ?></h2>
    </header>

    <nav class="nav">
      <ul>
        <?php wp_nav_menu(array('theme_location' => 'custom_nav', 'depth' => 1)); ?>
      </ul>
    </nav>
