<?php
/*
Plugin Name: WP-Beautifier
Plugin URI: http://wordpress.pralinenschachtel.de/
Description: Beautifier provides several options to clean up WP's messy (X)HTML source code output, such as code indentation.
Version: 1.3.1
Author: Till Krüss
Author URI: http://pralinenschachtel.de/
License: GPLv3
*/

/**
 * This file contains all non-admin code of the WP-Beautifier plugin.
 *
 * Copyright 2010 Till Krüss  (email: till@pralinenschachtel.de)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * @package WP-Beautifier
 * @copyright 2010 Till Krüss
 *
 */

/**
 * Define WP-Beautifier's main plugin file variable.
 * @global string Relative path to the the main file of this plugin
 * @since 1.3
 */
$beautifier_file = __FILE__;

/**
 * Define WP-Beautifier's default configuration parameters.
 * @global array $beautifier_default_options WP-Beautifier's default configuration parameters
 * @since 1.0
 */
$beautifier_default_options = array(
	'wp_beautifier_indent_flag' => 1,
	'wp_beautifier_comments_flag' => 1,
	'wp_beautifier_quotes_flag' => 1,
	'wp_beautifier_regexps_flag' => 0,
	'wp_beautifier_feed_flag' => 1,
	'wp_beautifier_feed_regexps_flag' => 0,
	'wp_beautifier_ignored_tags' => 'pre, script, textarea',
	'wp_beautifier_ignored_attributes' => 'onabort, onblur, onchange, onclick, ondblclick, onerror, onfocus, onkeydown, onkeypress, onkeyup, onload, onmousedown, onmousemove, onmouseout, onmouseover, onmouseup, onreset, onselect, onsubmit, onunload',
	'wp_beautifier_regexps' => "# Remove all of WordPress's generator tags:\n~<meta name=(\"|')generator(\"|')[^>]+>|<generator.*?>.+?</generator>|<!-- generator=\".+?\" -->~\n\n# Un-comment to remove <link> tags which have the \"rel\" attribute: index, canonical, next or prev:\n# ~<link rel=(\"|')(index|canonical|next|prev)(\"|')[^>]+>~\n\n# Add you own regular expressions...\n# ~(unwanted string)~"
);

/**
 * Register plugin initialization callback function.
 */
add_action('plugins_loaded', 'beautifier_init', 0);

/**
 * Load backend code if needed.
 */
if (defined('WP_ADMIN')) {
	require_once dirname($beautifier_file).'/options.php';
}

/**
 * This is the callback function for the registerd action
 * 'plugins_loaded' which is called by WordPress itself. It does
 * three things. It checks for the existance of all plugin
 * options and set them if they don't exist, it populates the
 * global $beautifier_options array and it starts PHP's output
 * buffering if WP_USE_THEMES is and WP_ADMIN is not defined.
 *
 * @since 1.0
 * @global array $beautifier_default_options WP-Beautifier's default configuration parameters
 * @global array $beautifier_options Storage of WP-Beautifier's options
 * @uses WP_ADMIN To start output buffering only in the frontend
 */
function beautifier_init() {

	global $beautifier_default_options, $beautifier_options;

	foreach ($beautifier_default_options as $option => $value) {
		if (get_option($option) === FALSE) {
			add_option($option, $value);
		}
		$beautifier_options[$option] = get_option($option);
	}

	if (!defined('WP_ADMIN') && defined('WP_USE_THEMES')) {
		ob_start('beautifier_output_callback');
	}

}

/**
 * This function is the output buffering callback function which is
 * called in called in wp-includes/default-filters.php by WordPress's
 * default 'shutdown' action. It checks the first 100 characters of
 * the output buffer. If it contains a valid DOCTYPE Declaration
 * beautifier_do_xhtml() is called. If it is a XML-Feed it calls
 * beautifier_do_xml().
 *
 * @since 1.0
 * @global array $beautifier_options Storage of WP-Beautifier's options
 *
 * @see wp-includes/default-filters.php WordPress's default action and filters
 * @see wp_ob_end_flush_all() WordPress's default 'shutdown' action
 *
 * @param string $buffer String to apply all enabled beautification options
 * @return string Beautified given string
 */
function beautifier_output_callback($buffer) {

	$less = substr(trim($buffer), 0, 100);

	if (stripos($less, '<!DOCTYPE html') !== FALSE) {
		return beautifier_do_xhtml($buffer);
	} elseif (stripos($less, '<rss version') !== FALSE || stripos($less, 'w3.org/2005/Atom') !== FALSE) {
		return beautifier_do_xml($buffer);
	}

	return $buffer;

}

/**
 * This function applies all enabled (X)HTML beautification options
 * to the given string. Called by beautifier_output_callback().
 *
 * @since 1.3
 *
 * @param $xhtml String to apply all related beautification options
 * @return string Beautified given string
 */
function beautifier_do_xhtml($xhtml) {

	global $beautifier_options;

	if ($beautifier_options['wp_beautifier_regexps_flag'] == 1) {
		$xhtml = beautifier_apply_regexps($xhtml, $beautifier_options['wp_beautifier_regexps']);
	}

	if ($beautifier_options['wp_beautifier_quotes_flag'] == 1) {
		$xhtml = beautifier_convert_quotes($xhtml, $beautifier_options['wp_beautifier_ignored_attributes']);
	}

	// construct the regexp to preserve defined tags
	$ignored_tags_regexp = '~';
	$ignored_tags = explode(', ', $beautifier_options['wp_beautifier_ignored_tags']);
	for ($i = 0, $size = count($ignored_tags); $i < $size; ++$i) {
		$ignored_tags_regexp .= '<'.$ignored_tags[$i].'[^>]*>.*?<\/'.$ignored_tags[$i].'>' . ($i < $size - 1 ? '|' : '');
	}
	$ignored_tags_regexp .= '~s';

	// store the original contents of all ignored tags
	preg_match_all($ignored_tags_regexp, $xhtml, $original_tags);

	if ($beautifier_options['wp_beautifier_comments_flag'] == 1) {
		$xhtml = beautifier_remove_comments($xhtml);
	}

	if ($beautifier_options['wp_beautifier_indent_flag'] == 1) {
		$xhtml = beautifier_clean_whitespace($xhtml);
		$xhtml = beautifier_add_indention($xhtml);
	}

	// fetch all ignored tags which might been modified and restore them
	preg_match_all($ignored_tags_regexp, $xhtml, $modified_tags);
	foreach ($modified_tags[0] as $key => $match) {
		$xhtml = str_replace($match, $original_tags[0][$key], $xhtml);
	}

	return $xhtml;

}

/**
 * This function applies all enabled XML beautification options
 * to the given string. Called by beautifier_output_callback().
 *
 * @since 1.3
 *
 * @param $xml String to apply all related beautification options
 * @return string Beautified given string
 */
function beautifier_do_xml($xml) {

	global $beautifier_options;

	if ($beautifier_options['wp_beautifier_feed_regexps_flag'] == 1) {
		$xml = beautifier_apply_regexps($xml, $beautifier_options['wp_beautifier_regexps']);
	}

	if ($beautifier_options['wp_beautifier_feed_flag'] == 1) {

		$xml = beautifier_clean_whitespace($xml);

		// fetch all CDATA sections
		preg_match_all('~<!\[CDATA\[.*?\]\]>~s', $xml, $cdata_sections);

		// remove line breaks from CDATA sections
		foreach ($cdata_sections as $section) {
			$cleaned_section = preg_replace('~\r|\n~', '', $section);
			$xml = str_replace($section, $cleaned_section, $xml);
		}

        $xml = beautifier_add_indention($xml);

	}

	return $xml;

}

/**
 * Applies the given $regular_expressions to $string by passing it
 * through preg_replace() and replaces it with nothing. Empty lines
 * and lines starting with the number sign # are ignored. Be sure
 * provide a unix style line break \n separated list of regex patterns.
 *
 * @since 1.1
 *
 * @param string $string String on which the given regular expression patterns should be applied
 * @param string $regular_expressions Unix style line break separated list of regular expression patterns
 * @return string String after the application of the regular expression patterns
 */
function beautifier_apply_regexps($string, $regular_expressions) {

	$regular_expressions = explode("\n", html_entity_decode($regular_expressions, ENT_QUOTES));

	foreach ($regular_expressions as $regular_expression) {
		if (!empty($regular_expression) && $regular_expression{0} != '#') { // ignore empty lines and comments
			$string = preg_replace($regular_expression, '', $string);
		}
	}

	return $string;

}

/**
 * Removes all HTML style comments <!-- ... --> from given $string.
 * Conditional comments like <!--[if IE 6]> ... <![endif]> are ignored.
 *
 * @since 1.0
 *
 * @param string $string String from which HTML style comments should be removed
 * @return string String without HTML style comments
 */
function beautifier_remove_comments($string) {

	// conditional comments will be ignored
	return preg_replace('/<!--(?![\s]?\[if)(.|\s)*?-->/i', '', $string);

}

/**
 * Converts single quoted tag attributes like <link rel='...'> into
 * double quoted attributes <link rel="..."> in given $string, if the
 * attribute is not listed in $ignored_attributes.
 *
 * @since 1.1
 *
 * @param string $string String with single quoted tag attribute values to convert
 * @param string $ignored_attributes Comma separated list of all tag attributes to ignore
 * @return string Given string with converted quotes
 */
function beautifier_convert_quotes($string, $ignored_attributes) {

	$ignored_attributes = explode(', ', $ignored_attributes);
	preg_match_all("~<[a-z]+[^<>]*='[^<>]*>~i", $string, $matched_tags);

	// loop through tags that contain an attribute with single quotes
	foreach ($matched_tags[0] as $tag) {

		unset($converted_tag);
		preg_match_all("~\s([a-z]+)='(.*?)'~", $tag, $matched_attributes);

		// loop through all attributes of this tag
		foreach ($matched_attributes[0] as $key => $attributes_string) {

			// convert the attribute quotes, if it's not on our ignore list
			if (isset($matched_attributes[1][$key], $matched_attributes[2][$key]) && !in_array($matched_attributes[1][$key], $ignored_attributes)) {
				if (!isset($converted_tag)) {
					$converted_tag = $tag;
				}
				$converted_tag = str_replace(trim($attributes_string), $matched_attributes[1][$key].'="'.$matched_attributes[2][$key].'"', $converted_tag);
			}

		}

		// replace tag if we made changes to it
		if (isset($converted_tag)) {
			$string = str_replace($tag, $converted_tag, $string);
		}

	}

	return $string;

}

/**
 * Removes whitespace from given $string. Converts all line endings into
 * unix-style \n and removes all whitespace from the end and the beginning
 * of each line and from the document in its entirety. It also removes
 * all empty lines and whitespace between text and tags.
 *
 * @since 1.1.1
 *
 * @param string $string String to clean
 * @return string Cleaned given string
 */
function beautifier_clean_whitespace($string) {

	// replace \r\n with \n
	$string = preg_replace('~\r\n~ms', "\n", $string);

	// replace \r with \n
	$string = preg_replace('~\r~ms', "\n", $string);

	// remove whitespace from the beginnig
	$string = preg_replace('~^\s+~s', '', $string);

	// remove whitespace from the end
	$string = preg_replace('~\s+$~s', '', $string);

	// remove whitespace from the beginning of each line
	$string = preg_replace('~^\s+~m', '', $string);

	// remove whitespace from the end of each line
	$string = preg_replace('~\s+$~m', '', $string);

	// removes empty lines
	$string = preg_replace('~\n\s*(?=\n)~ms', '', $string);

	// removes whitespace between text
	$string = preg_replace('~([^>\s])(\s+)([^<\s])~', '$1 $3', $string);

	// remove tabs between tags
	$string = preg_replace('~(?:(?<=\>)|(?<=\/\>))\t+(?=\<\/?)~', '', $string);

	return $string;

}

/**
 * Adds line indentation to given $string. Pass string previously
 * through beautifier_clean_whitespace() to remove whitespace.
 *
 * @since 1.2
 * @see beautifier_clean_whitespace() Use to remove whitespace from a string
 *
 * @param string $string String to indent (works best with a (X)HTML document)
 * @return string Indented given string
 */
function beautifier_add_indention($string) {

	$indent = 0;
	$string = explode("\n", $string);
	foreach ($string as $line_num => $line) {
		$correction = intval(substr($line, 0, 2) == '</'); // correct indention, if line starts with closing tag
		$string[$line_num] = str_repeat("  ", $indent - $correction).$line;
		$indent += substr_count($line, '<'); // indent every tag
		$indent -= substr_count($line, '<!'); // subtract doctype declaration and CDATA sections
		$indent -= substr_count($line, '<?'); // subtract processing instructions
		$indent -= substr_count($line, '/>'); // subtract self closing tags
		$indent -= substr_count($line, '</') * 2; // subtract closing tags
	}
	$string = implode("\n", $string);

	return $string;

}

?>