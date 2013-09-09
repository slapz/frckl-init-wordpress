<!DOCTYPE html>
<!--[if lt IE 8]> <html class="no-js lt-ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 9]> <html class="no-js ie9" <?php language_attributes(); ?>> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" <?php language_attributes(); ?>> <!--<![endif]-->
<head>
  <meta charset="<?php bloginfo('charset'); ?>" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php bloginfo('name'); ?> | <?php bloginfo('description'); ?></title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link rel="stylesheet" href="<?php echo get_template_directory_uri(); ?>/css/main.css" />
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
  <script src="<?php echo get_template_directory_uri(); ?>/js/libs/modernizr.min.js"></script>
  <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
  <div class="container">

    <header class="header" role="banner">

      <a href="<?php echo home_url(); ?>" class="site-logo">
        <img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="<?php bloginfo('name'); ?>" class="site-logo__image">
      </a>

      <p class="site-description"><?php bloginfo('description'); ?></p>

    </header>

    <nav class="nav" role="navigation">
      <?php wp_nav_menu(array('theme_location' => 'nav', 'depth' => 1)); ?>
    </nav>
