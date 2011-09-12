<?php
// GENERAL THEME CONFIG AND BACKEND STUFF
// ================================================================================
// SOMETIMES USED
// remove links from the admin navigation in the backend
//function custom_admin_menu() {
  //remove_menu_page('link-manager.php');
//}
//add_action('admin_menu', 'custom_admin_menu');

// unregister all default WP Widgets
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

// custom footer text in the backend
function custom_admin_footer_text($default_text) {
  return '<span id="footer-thankyou">Bei Fragen oder Problemen einfach eine Email an <a href="mailto:webgefrickel@gmail.com">Steffen Becker</a></span>';
}
add_filter('admin_footer_text', 'custom_admin_footer_text');

function custom_jquery() {
  if (!is_admin()) {
    wp_deregister_script('jquery');
    wp_register_script('jquery', get_template_directory_uri() . '/js/jquery-1.6.3.min.js');
    wp_enqueue_script('jquery');
  }
}
add_action('init', 'custom_jquery');

if (!isset($content_width)) $content_width = 640;

// activate support for automatic feed links, custom css and post thumbnails
add_theme_support('automatic-feed-links');
add_theme_support('nav-menus');
add_theme_support('post-thumbnails');
add_editor_style('');
remove_action('wp_head', 'wp_generator');
add_filter('show_admin_bar', '__return_false');

// no update notification for non-admins
function no_update_notification() {
  if (!current_user_can('activate_plugins')) remove_action('admin_notices', 'update_nag', 3);
}
add_action('admin_notices', 'no_update_notification', 1);

// remove width/height from images - pagespeed does not like that
// flexible images and IE like it very much
add_filter('post_thumbnail_html', 'remove_thumbnail_dimensions', 10);
add_filter('image_send_to_editor', 'remove_thumbnail_dimensions', 10);
add_filter('the_content', 'remove_thumbnail_dimensions', 10);
function remove_thumbnail_dimensions($html) {
  $html = preg_replace('/(width|height)=\"\d*\"\s/', "", $html);
  return $html;
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

// initialize the custom navigation menu for wordpress found in header.php
if (function_exists('register_nav_menu')) {
  register_nav_menus(array(
    'custom_nav' => 'Hauptnavigation'
  ));
}

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

// remove inline styles in head for comments
add_action( 'widgets_init', function() {
  global $wp_widget_factory;
  remove_action('wp_head', array($wp_widget_factory->widgets['WP_Widget_Recent_Comments'], 'recent_comments_style'));
});

/* Custom comments function */
if (!function_exists('custom_comments')) :
function custom_comments($comment, $args, $depth) {
  $GLOBALS['comment'] = $comment;
  switch ( $comment->comment_type ) :
    case '' :
  ?>
    <li>
    <article <?php comment_class(); ?> id="comment-<?php comment_ID(); ?>">
      <h3>
        <?php echo get_avatar($comment, 60); ?>
        <?php comment_author_link(); ?> am <?php comment_date(); ?> um <?php comment_time(); ?> Uhr |
        <a href="<?php echo esc_url(get_comment_link($comment->comment_ID)); ?>" title="Permalink zu diesem Kommentar">
          Link
        </a>
        <?php edit_comment_link('Bearbeiten', ' | ', ''); ?>
      </h3>
      <section class="commentContent">
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
