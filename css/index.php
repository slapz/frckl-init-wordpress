<?php
/* This little Script takes all included css-files and
 * compresses them by removing comments, line-breaks and
 * useless space-characters
 */
header('Content-type: text/css');
// set offset to 365 days = 1 year
$offset = 60 * 60 * 24 * 365;
header('Expires: ' . gmdate("D, d M Y H:i:s", time() + $offset) . ' GMT');

ob_start('compress');
 
function compress($buffer) {
  // some of the following functions to minimize the css-output are directly taken
  // from the awesome CSS JS Booster: https://github.com/Schepp/CSS-JS-Booster
  // all credits to Christian Schaefer: http://twitter.com/derSchepp

  // remove comments
  $buffer = preg_replace('!/\*[^*]*\*+([^/][^*]*\*+)*/!', '', $buffer);

  // backup values within single or double quotes
  preg_match_all('/(\'[^\']*?\'|"[^"]*?")/ims', $buffer, $treffer, PREG_PATTERN_ORDER);
  for ($i=0; $i < count($treffer[1]); $i++) {
    $buffer = str_replace($treffer[1][$i], '##########' . $i . '##########', $buffer);
  }

  // remove traling semicolon of selector's last property
  $buffer = preg_replace('/;[\s\r\n\t]*?}[\s\r\n\t]*/ims', "}\r\n", $buffer);
  // remove any whitespace between semicolon and property-name
  $buffer = preg_replace('/;[\s\r\n\t]*?([\r\n]?[^\s\r\n\t])/ims', ';$1', $buffer);
  // remove any whitespace surrounding property-colon
  $buffer = preg_replace('/[\s\r\n\t]*:[\s\r\n\t]*?([^\s\r\n\t])/ims', ':$1', $buffer);
  // remove any whitespace surrounding selector-comma
  $buffer = preg_replace('/[\s\r\n\t]*,[\s\r\n\t]*?([^\s\r\n\t])/ims', ',$1', $buffer);
  // remove any whitespace surrounding opening parenthesis
  $buffer = preg_replace('/[\s\r\n\t]*{[\s\r\n\t]*?([^\s\r\n\t])/ims', '{$1', $buffer);
  // remove any whitespace between numbers and units
  $buffer = preg_replace('/([\d\.]+)[\s\r\n\t]+(px|em|pt|%)/ims', '$1$2', $buffer);
  // shorten zero-values
  $buffer = preg_replace('/([^\d\.]0)(px|em|pt|%)/ims', '$1', $buffer);
  // constrain multiple whitespaces
  $buffer = preg_replace('/\p{Zs}+/ims',' ', $buffer);
  // remove newlines
  $buffer = str_replace(array("\r\n", "\r", "\n"), '', $buffer);

  // Restore backupped values within single or double quotes
  for ($i=0; $i < count($treffer[1]); $i++) {
    $buffer = str_replace('##########' . $i . '##########', $treffer[1][$i], $buffer);
  }
  
  return $buffer;
  
}

/* the css-files to include and compress */ 
/* ============= EDIT HERE ============= */ 
include('reset.css');
include('style.css');
include('print.css');
include('colorbox.css');
 
ob_end_flush();
?>