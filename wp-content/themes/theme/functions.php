<?php
// GENERAL THEME CONFIG AND BACKEND STUFF
// ================================================================================
// SOMETIMES USED

// function delete_menu_items() {
//   if (current_user_can('editor')) {
//     remove_menu_page('edit.php'); // Posts
//     remove_menu_page('upload.php'); // Media
//     remove_menu_page('link-manager.php'); // Links
//     remove_menu_page('edit-comments.php'); // Comments
//     remove_menu_page('edit.php?post_type=page'); // Pages
//     remove_menu_page('plugins.php'); // Plugins
//     remove_menu_page('themes.php'); // Appearance
//     remove_menu_page('users.php'); // Users
//     remove_menu_page('tools.php'); // Tools
//     remove_menu_page('options-general.php'); // Settings
//   }
// }
// add_action('admin_init', 'delete_menu_items');
//
// function delete_submenu_items() {
//   if ( current_user_can( 'editor' )) {
//     remove_submenu_page( 'themes.php', 'widgets.php' );
//     remove_submenu_page( 'themes.php', 'theme-editor.php');
//   }
// }
// add_action( 'admin_init', 'delete_submenu_items' );

//function unregister_default_wp_widgets() {
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
//}
//add_action('widgets_init', 'unregister_default_wp_widgets', 1);

// get the the role object
// $role_object = get_role('editor');
// add $cap capability to this role object
// $role_object->add_cap('edit_theme_options');

if (!isset($content_width)) $content_width = 640;

// custom footer text in the backend
function custom_admin_footer_text($default_text) {
  return '<span id="footer-thankyou">Bei Fragen oder Problemen einfach eine Email an <a href="mailto:kontakt@webgefrickel.de">Steffen Becker</a></span>';
}
add_filter('admin_footer_text', 'custom_admin_footer_text');

// remove default jquery - remember to include jquery in your footer or load via modernizr
function custom_jquery() {
  if (!is_admin()) { wp_deregister_script('jquery'); }
}
add_action('init', 'custom_jquery');

// initialize the custom navigation menu for wordpress found in header.php
if (function_exists('register_nav_menu')) {
  register_nav_menus(array(
    'custom_nav' => 'Hauptnavigation'
  ));
}

// remove not often used stuff from <head>
add_filter('the_generator', create_function('', 'return "";'));
remove_action('wp_head', 'wp_generator');
remove_action('wp_head', 'rsd_link');
remove_action('wp_head', 'wlwmanifest_link');
add_action( 'widgets_init', function() {
  global $wp_widget_factory;
  remove_action('wp_head', array($wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style'));
});

// activate support for automatic feed links, custom css and post thumbnails
add_theme_support('automatic-feed-links');
add_theme_support('nav-menus');
add_theme_support('post-thumbnails');
add_editor_style('');
add_filter('show_admin_bar', '__return_false');

// no update notification for non-admins
function no_update_notification() {
  if (!current_user_can('activate_plugins')) remove_action('admin_notices', 'update_nag', 3);
}
add_action('admin_notices', 'no_update_notification', 1);

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

// some default options for the nav_menus -- no container, no fallback
function custom_wp_nav_menu_args($args = '') {
  $args['container'] = false;
  $args['fallback_cb'] = false;
  return $args;
}
add_filter('wp_nav_menu_args', 'custom_wp_nav_menu_args');

// remove ul form the wp_nav_menu
function custom_remove_ul ( $menu ){
  return preg_replace( array('#^<ul[^>]*>#', '#</ul>$#' ), '', $menu);
}
add_filter('wp_nav_menu', 'custom_remove_ul');

// remove gallery default styles
add_filter('gallery_style', create_function('$a', 'return preg_replace("%<style type=\'text/css\'>(.*?)</style>%s", "", $a);'));

/* Custom comments function */
if (!function_exists('custom_comments')) :
function custom_comments($comment, $args, $depth) {
  $GLOBALS['comment'] = $comment;
  switch ( $comment->comment_type ) :
    case '' :
  ?>
    <li>
    <article <?php comment_class(); ?> class="comment comment-<?php comment_ID(); ?>">
      <h3>
        <?php echo get_avatar($comment, 60); ?>
        <?php comment_author_link(); ?> am <?php comment_date(); ?> um <?php comment_time(); ?> Uhr |
        <a href="<?php echo esc_url(get_comment_link($comment->comment_ID)); ?>" title="Permalink zu diesem Kommentar">
          Link
        </a>
        <?php edit_comment_link('Bearbeiten', ' | ', ''); ?>
      </h3>
      <section class="comment-content">
        <?php if ( $comment->comment_approved == '0' ) : ?>
          <em>Dein Kommentar muss noch freigeschaltet werden.</em>
        <?php endif; ?>
        <?php comment_text(); ?>
      </section>
    </article>
  <?php
      break;
    case 'pingback'  :
    case 'trackback' :
  ?>
    <li>
    <article <?php comment_class('comment'); ?>>
      <h3>Pingback: <?php comment_author_link(); ?><?php edit_comment_link('Bearbeiten', ' | ', ''); ?></h3>
    </article>

  <?php
      break;
  endswitch;
} // end function custom_comments
endif; // end if exists

?>
