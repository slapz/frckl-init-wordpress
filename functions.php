<?php
// set the content_width, required.
if (!isset($content_width)) $content_width = 640;

// activate support for automatic feed links, custom css and post thumbnails
add_theme_support('automatic-feed-links');
add_theme_support('nav-menus');
add_theme_support('post-thumbnails');
add_editor_style('css/index.php');

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
  register_nav_menu('custom_menu', 'Hauptmen&uuml;');
}

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
      <header class="commentHeader">
        <h3>
          <?php echo get_avatar($comment, 60); ?>
          <?php comment_author_link(); ?> am <?php comment_date(); ?> um <?php comment_time(); ?> Uhr |
          <a href="<?php echo esc_url(get_comment_link($comment->comment_ID)); ?>" title="Permalink zu diesem Kommentar">
            Link
          </a>
          <?php edit_comment_link('Bearbeiten', ' | ', ''); ?>
        </h3>
      </header>
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
      <header class="commentHeader">
        <h3>Pingback: <?php comment_author_link(); ?><?php edit_comment_link('Bearbeiten', ' | ', ''); ?></h3>
      </header>
    </article>

  <?php
      break;
  endswitch;
} // end function custom_comments
endif; // end if exists


?>