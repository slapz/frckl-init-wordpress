<!DOCTYPE html>
<!--[if lt IE 8]> <html class="no-js lt-ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" <?php language_attributes(); ?>> <!--<![endif]-->
<head>
  <meta charset="<?php bloginfo('charset'); ?>" />
  <title><?php bloginfo('name'); ?> | <?php bloginfo('description'); ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/main.css" />
  <script src="<?php echo get_template_directory_uri(); ?>/js/libs/modernizr.min.js"></script>
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
  <div class="container">

    <header class="header" role="banner">
      <h1><a href="<?php echo home_url(); ?>/"><?php bloginfo('name'); ?></a></h1>
      <h2><?php bloginfo('description'); ?></h2>
    </header>

    <nav class="nav" role="navigation">
      <?php wp_nav_menu(array('theme_location' => 'custom_nav', 'depth' => 1)); ?>
    </nav>
