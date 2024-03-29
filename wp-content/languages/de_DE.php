<?php
/*
 * @version 0.7.3
 * @date 14.04.2011 10:53:06
 * suggestion by Heiko Rabe (www.code-styling.de ), Frank Bueltge (bueltge.de ), Thomas Scholz (toscho.de )
 * special german permalink sanitize will be only needed at admin center and xmlrpc calls
 * avoid additional filtering at frontend html generation
 */

/* we need it only, if we are at admin center or processing offline blog software like LiveWriter */
if ( is_admin() || ( defined( 'XMLRPC_REQUEST' ) && XMLRPC_REQUEST ) ) {
	
	/* define it global */
	$umlaut_chars['in']    = array( chr(196), chr(228), chr(214), chr(246), chr(220), chr(252), chr(223) );
	$umlaut_chars['ecto']  = array( 'Ä', 'ä', 'Ö', 'ö', 'Ü', 'ü', 'ß' );
	$umlaut_chars['html']  = array( '&Auml;', '&auml;', '&Ouml;', '&ouml;', '&Uuml;', '&uuml;', '&szlig;' );
	$umlaut_chars['feed']  = array( '&#196;', '&#228;', '&#214;', '&#246;', '&#220;', '&#252;', '&#223;' );
	$umlaut_chars['utf8']  = array( 
		utf8_encode( 'Ä' ), utf8_encode( 'ä' ), utf8_encode( 'Ö' ), utf8_encode( 'ö' ), 
		utf8_encode( 'Ü' ), utf8_encode( 'ü' ), utf8_encode( 'ß' ) 
	);
	$umlaut_chars['perma'] = array( 'Ae', 'ae', 'Oe', 'oe', 'Ue', 'ue', 'ss' );
	
	/* sanitizes the titles to get qualified german permalinks with correct transliteration */
	function de_DE_umlaut_permalinks( $title, $raw_title = NULL ) {
		global $umlaut_chars;
		
		if ( !is_null( $raw_title ) )
			$title = $raw_title;
		
		if ( seems_utf8( $title ) ) {
			$invalid_latin_chars = array( 
				chr(197).chr(146) => 'OE', chr(197).chr(147) => 'oe', chr(197).chr(160) => 'S', 
				chr(197).chr(189) => 'Z', chr(197).chr(161) => 's', chr(197).chr(190) => 'z', 
				chr(226).chr(130).chr(172) => 'E' 
			);
			$title = utf8_decode( strtr( $title, $invalid_latin_chars) );
		}
		
		$title = str_replace( $umlaut_chars['ecto'], $umlaut_chars['perma'], $title );
		$title = str_replace( $umlaut_chars['in'], $umlaut_chars['perma'], $title );
		$title = str_replace( $umlaut_chars['html'], $umlaut_chars['perma'], $title );
		$title = remove_accents( $title );
		$title = sanitize_title_with_dashes( $title );
		$title = str_replace( '.', '-', $title );
		
		return $title;
	}
	
	function de_DE_replace_filename( $filename ) {
		$filename = strip_tags( $filename );
		// Preserve escaped octets.
		$filename = preg_replace( '|%([a-fA-F0-9][a-fA-F0-9])|', '---$1---', $filename );
		// Remove percent signs that are not part of an octet.
		$filename = str_replace( '%', '', $filename );
		// Restore octets.
		$filename = preg_replace( '|---([a-fA-F0-9][a-fA-F0-9])---|', '%$1', $filename );
	
		$filename = remove_accents( $filename );
		if (seems_utf8( $filename ) ) {
			if ( function_exists( 'mb_strtolower' ) )
				$filename = mb_strtolower( $filename, 'UTF-8' );
			$filename = utf8_uri_encode( $filename, 200);
		}
		
		$filename = strtolower( $filename );
		$filename = preg_replace( '/&.,+?;/', '', $filename ); // kill entities
		$filename = preg_replace( '/\s+/', '-', $filename );
		$filename = preg_replace( '|-+|', '-', $filename );
		$filename = trim( $filename, '-' );
		
		return $filename;
	}
	
	function de_DE_umlaut_xmlrpc_content( $content) {
		global $umlaut_chars;
		
		$content = str_replace( $umlaut_chars['html'], $umlaut_chars['utf8'], $content );
		$content = str_replace( $umlaut_chars['feed'], $umlaut_chars['utf8'], $content );
		
		return $content;
	}
	
	function de_DE_umlaut_filename( $filename ) {
		global $umlaut_chars;
		
		if ( seems_utf8( $filename ) ) {
			$invalid_latin_chars = array( 
				chr(197).chr(146) => 'OE', chr(197).chr(147) => 'oe', chr(197).chr(160) => 'S', 
				chr(197).chr(189) => 'Z', chr(197).chr(161) => 's', chr(197).chr(190) => 'z', 
				chr(226).chr(130).chr(172) => 'E' 
			);
			$filename = utf8_decode( strtr( $filename, $invalid_latin_chars) );
		}
		
		$filename = str_replace( $umlaut_chars['ecto'], $umlaut_chars['perma'], $filename );
		$filename = str_replace( $umlaut_chars['in'], $umlaut_chars['perma'], $filename );
		$filename = str_replace( $umlaut_chars['html'], $umlaut_chars['perma'], $filename );
		$filename = de_DE_replace_filename( $filename );
		
		return $filename;
	}
	
	/* enable cleaning of permalinks */
	remove_filter( 'sanitize_title', 'sanitize_title_with_dashes', 11 );
	add_filter( 'sanitize_title', 'de_DE_umlaut_permalinks', 10, 2 );
	
	/* enable cleaning of filename */
	add_filter( 'sanitize_file_name', 'de_DE_umlaut_filename', 10, 1 );
	
	if ( defined( 'XMLRPC_REQUEST' ) && XMLRPC_REQUEST ) {
	
		// referenced to: feed.php filters (extend it if nessessary)
		// ---------------------------------------------------------------------------
		// wp_title_rss | the_title_rss | the_content_rss | the_excerpt_rss | comment_text_rss | the_category_rss | the_permalink_rss
		
		// references to export.php filters extend it if nessessary): 
		// ---------------------------------------------------------------------------
		// the_content_export | the_excerpt_export
		
		//Window Live Writer and others Offline Blogging Tools needs to be corrected to UTF-8
		foreach ( 
			array( 
				'the_title', 
				'the_excerpt', 
				'the_content', 
				'comment_text', 
				'the_category', 
				'the_tags'
			) as $action ) {
			add_action( $action, 'de_DE_umlaut_xmlrpc_content' );
		}
	
	}
	
	//pre-select the german spell checker at TinyMCE
	function de_DE_spell_checker_default( $langs) {
		$arr = explode( ',', str_replace( '+','',$langs) );
		$res = array();
		foreach( $arr as $lang) {
			$res[] = ( preg_match( '/=de$/', $lang) ? '+'.$lang : $lang );
		}
		return implode( ',',$res);
	}
	add_filter( 'mce_spellchecker_languages', 'de_DE_spell_checker_default' );
	
	// change rss language to de
	function de_DE_rss_language() {
		if ( 'de' !== get_option( 'rss_language' ) )
			update_option( 'rss_language', 'de' );
	}
	add_action( 'admin_init', 'de_DE_rss_language' );
	
}
?>