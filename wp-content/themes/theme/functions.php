<?php

/* backend config and backend-restrictionos for normal editor-users
====================================================================== */

// delete menu items for editors
add_action('admin_init', function() {
  if (current_user_can('editor')) {
    // remove_menu_page('edit.php'); // Posts
    // remove_menu_page('upload.php'); // Media
    // remove_menu_page('link-manager.php'); // Links
    // remove_menu_page('edit-comments.php'); // Comments
    // remove_menu_page('edit.php?post_type=page'); // Pages
    // remove_menu_page('plugins.php'); // Plugins
    // remove_menu_page('themes.php'); // Appearance
    // remove_menu_page('users.php'); // Users
    // remove_menu_page('tools.php'); // Tools
    // remove_menu_page('options-general.php'); // Settings
    // remove_submenu_page('themes.php', 'widgets.php');
    // remove_submenu_page('themes.php', 'theme-editor.php');
  }
});

// remove unused widgets
add_action('widgets_init', function() {
  //unregister_widget('WP_Widget_Pages');
  //unregister_widget('WP_Widget_Calendar');
  //unregister_widget('WP_Widget_Archives');
  //unregister_widget('WP_Widget_Links');
  //unregister_widget('WP_Widget_Meta');
  //unregister_widget('WP_Widget_Search');
  //unregister_widget('WP_Widget_Categories');
  //unregister_widget('WP_Widget_Recent_Posts');
  //unregister_widget('WP_Widget_Recent_Comments');
  //unregister_widget('WP_Widget_RSS');
  //unregister_widget('WP_Widget_Tag_Cloud');
}, 1);

// add capabilities to the editor
// $role_object = get_role('editor');
// $role_object->add_cap('edit_theme_options');

// custom footer text in the backend
add_filter('admin_footer_text', function() {
  return '<span id="footer-thankyou">Bei Fragen oder Problemen einfach eine Email an <a href="mailto:kontakt@webgefrickel.de">Steffen Becker</a></span>';
});

// no update notification for non-admins
add_action('admin_notices', function() {
  if (!current_user_can('activate_plugins')) remove_action('admin_notices', 'update_nag', 3);
}, 1);

// custom styling for the rte
add_editor_style('');


/* removing stuff from the frontend
====================================================================== */

// remove default jquery - remember to include jquery in your footer or load via modernizr
add_action('init', function() {
  if (!is_admin()) wp_deregister_script('jquery');
});

// remove not often used stuff from <head>
add_filter('the_generator', function() {
  return '';
});

// no recent comments widget stuff
add_action('widgets_init', function() {
  global $wp_widget_factory;
  remove_action('wp_head', array($wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style'));
});

// remove other stuff from the header
remove_action('wp_head', 'wp_generator');
remove_action('wp_head', 'rsd_link');
remove_action('wp_head', 'wlwmanifest_link');

// we don't want that stupid admin bar.
add_filter('show_admin_bar', '__return_false');

// remove gallery default styles
add_filter('gallery_style', function($text) {
  return preg_replace("%<style type=\'text/css\'>(.*?)</style>%s", "", $a);
});

// some default options for the nav_menus -- no container, no fallback
add_filter('wp_nav_menu_args', function($args = '') {
  $args['container'] = false;
  $args['fallback_cb'] = false;
  return $args;
});


/* theme and frontend options
====================================================================== */

// the default content width
if (!isset($content_width)) {
  $content_width = 640;
}

// activate support for automatic feed links, custom css and post thumbnails
add_theme_support('automatic-feed-links');
add_theme_support('nav-menus');
add_theme_support('post-thumbnails');


// initialize the custom navigation menu for wordpress found in header.php
if (function_exists('register_nav_menu')) {
  register_nav_menus(array(
    'custom_nav' => 'Hauptnavigation'
 ));
}

// register the sidebars
add_action('widgets_init', function() {
  register_sidebar(array(
    'name' => 'Sidebar',
    'id' => 'sidebar',
    'before_widget' => '<li id="%1$s" class="widget %2$s">',
    'after_widget' => '</li>',
    'before_title' => '<h2 class="widgettitle">',
    'after_title' => '</h2>',
 ));
});


