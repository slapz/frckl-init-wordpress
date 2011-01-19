<?php

if (!isset($content_width)) $content_width = 640;

add_theme_support('automatic-feed-links');
  
function default_register_sidebars() {
  register_sidebar(array(
    'name' => 'Sidebar rechts',
    'id' => 'sidebarright',
    'before_widget' => '<li id="%1$s" class="widget %2$s">',
    'after_widget' => '</li>',
    'before_title' => '<h2 class="widgettitle">',
    'after_title' => '</h2>',
  ));

  register_sidebar(array(
    'name' => 'Sidebar links',
    'id' => 'sidebarleft',
    'before_widget' => '<li id="%1$s" class="widget %2$s">',
    'after_widget' => '</li>',
    'before_title' => '<h2 class="widgettitle">',
    'after_title' => '</h2>',
  ));
}

// register the sidebars by calling the oper_register_sidebars
add_action('widgets_init', 'default_register_sidebars');

?>