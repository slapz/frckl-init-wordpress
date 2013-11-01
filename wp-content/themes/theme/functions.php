<?php

/* backend config and backend-restrictionos for normal editor-users
====================================================================== */

// add automatic updates even if we version-control this site
add_filter('automatic_updates_is_vcs_checkout', '__return_false');

// delete menu items for editors
add_action('admin_init', function() {
  if (current_user_can('editor')) {
    // remove_menu_page('edit.php'); // Posts
    // remove_menu_page('upload.php'); // Media
    // remove_menu_page('edit-comments.php'); // Comments
    // remove_menu_page('edit.php?post_type=page'); // Pages
    // remove_menu_page('plugins.php'); // Plugins
    // remove_menu_page('themes.php'); // Appearance
    // remove_submenu_page('themes.php', 'widgets.php');
    // remove_submenu_page('themes.php', 'themes.php');
    // remove_submenu_page('themes.php', 'theme-editor.php');
    // remove_submenu_page('themes.php', 'customize.php');
    // remove_menu_page('users.php'); // Users
    // remove_menu_page('tools.php'); // Tools
    // remove_menu_page('options-general.php'); // Settings
  }
});

// hide stuff in the backend via custom css
add_action('admin_head', function () {
  echo '<style>
    #something-in-the-backend {
      display: none;
    }
  </style>';
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


/* tinymce RTE config using tinyMCE advanced plugin
====================================================================== */

if (!function_exists('base_custom_mce_format')) {
  add_filter('tiny_mce_before_init', function($init) {
    // Add block format elements you want to show in dropdown
    $init['theme_advanced_blockformats'] = 'Absatz=p,Überschrift 1=h1,Überschrift 2=h2,Überschrift 3=h3,Überschrift 4=h4,Zitat=blockquote,Code=pre';

    // Add block style elements you want to show in dropdown
    $init['theme_advanced_styles'] = 'Spezial=special-class';

    return $init;
  });
}


/* theme paths wrappers for cleaner code
====================================================================== */

/* usage like this: http://scribu.net/wordpress/theme-wrappers.html
 * wrapper-{template}.php > wrapper.php
 *  {template}.php
 *      header-{template}.php > header.php
 *      sidebar-{template}.php > sidebar.php
 *      footer-{template}.php > footer.php
 */

function custom_template_path() {
  return CustomWrapper::$main_template;
}

function custom_template_base() {
  return CustomWrapper::$base;
}

class CustomWrapper {

  static $main_template;
  static $base;

  static function wrap($template) {
    self::$main_template = $template;
    self::$base = substr(basename(self::$main_template), 0, -4);

    if ('index' == self::$base) self::$base = false;
    $templates = array('wrapper.php');
    if (self::$base) array_unshift($templates, sprintf('wrapper-%s.php', self::$base));
    return locate_template($templates);
  }
}

add_filter('template_include', array('CustomWrapper', 'wrap'), 99);


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

// remove ids from menu items
add_filter('nav_menu_item_id', function($var) {
  return is_array($var) ? array() : '';
}, 100, 1);


/* adding stuff to the frontend
====================================================================== */

// adding the slug to the body class
add_filter('body_class', function($classes) {
  global $post;
  if (is_home()) {
    $key = array_search('blog', $classes);
    if ($key > -1) {
      unset($classes[$key]);
    };
  } elseif (is_page()) {
    $classes[] = sanitize_html_class($post->post_name);
  } elseif (is_singular()) {
    $classes[] = sanitize_html_class($post->post_name);
  };

  return $classes;
});


/* theme and frontend options
====================================================================== */

// the default content width
if (!isset($content_width)) {
  $content_width = 640;
}

// activate support for automatic feed links, custom css and post thumbnails
add_theme_support('automatic-feed-links');
add_theme_support('menus');
add_theme_support('post-thumbnails');

// define custom images sizes
// add_image_size('custom-thumb', 220, 180, true); // cropped
// add_image_size('custom-thumb', 220, 180, false); // non-cropped

// initialize the custom navigation menu for wordpress found in header.php
if (function_exists('register_nav_menu')) {
  register_nav_menus(array(
    'nav' => 'Navigation'
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


/* custom post types
====================================================================== */

// add_action('init', function() {
//   register_post_type('custom_thing', array(
//     'labels' => array(
//       'name' => 'Dinge',
//       'singular_name' => 'Ding',
//       'add_new' => 'Hinzufügen',
//       'all_items' => 'Alle Dinge',
//       'add_new_item' => 'Neues Ding hinzufügen',
//       'edit_item' => 'Ding bearbeiten',
//       'new_item' => 'Neues Ding',
//       'view_item' => 'Ding anzeigen',
//       'search_items' => 'Dinge durchsuchen',
//       'not_found' => 'Keine Dinge gefunden',
//       'not_found_in_trash' => 'Keine Dinge im Papierkorb',
//       'parent_item_colon' => 'Übergeordnete Dinge',
//       'menu_name' => 'Dinge',
//     ),
//     'description' => 'Alle Dinge der Welt',
//     'public' => true,
//     'has_archive' => true,
//     'exclude_from_search' => false,
//     'menu_icon' => null,
//     'hierarchical' => false,
//     // 'menu_position' => 5,
//     // 'supports' => array('title', 'editor', 'author', 'thumbnail', 'excerpt', 'custom-fields', 'comments') // etc.
//     // 'taxonomies' => array('custom_taxonomy'),
//     // for more options see http://codex.wordpress.org/Function_Reference/register_post_type
//   ));

  /* and a custom taxonomy, if you want it
  register_taxonomy('kategorien', array('custom_thing'), array(
    'labels' => array(
      'name' => 'Kategorien',
      'singular' => 'Kategorie',
      'search' => 'Kategorien durchsuchen',
      'popular' => 'Beliebte Kategorien',
      'all' => 'Alle Kategorien',
      'parent' => 'Übergeordnete Kategorie',
      'parent' => 'Übergeordnete Kategorie:',
      'edit' => 'Kategorie bearbeiten',
      'update' => 'Kategorie ändern',
      'add' => 'Neue Kategorie',
      'new' => 'Neue Kategorie',
      'separate' => 'Kommasepariert:',
      'add' => 'Kategorien bearbeiten',
      'choose' => 'BeliebteKkategorien',
      'menu' => 'Kategorien',
    ),
    'public' => true,
    'show_in_nav_menus' => true,
    'show_ui' => true,
    'show_tagcloud' => false,
    'hierarchical' => true,
    'rewrite' => true,
    'query_var' => true
  ));
  */
// });

