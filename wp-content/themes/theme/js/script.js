// when using jshint - define your global vars from other files/modules here
/*global console: true*/
/*global Modernizr: true*/

// ================================================================================
// init documentready-function
// ================================================================================
jQuery(document).ready(function($) {

  // Add Colorbox to every csc-textpic element with click-enlarge
  if ($('a.lightbox').length) {
    $('a.lightbox').colorbox({
      opacity: 0.8,
      loop: false,
      maxWidth: '90%',
      maxHeight: '90%',
      current: "Bild {current} von {total}",
      previous: "zurück",
      next: "weiter",
      close: 'schließen'
    });
  }

  // YOUR STUFF HERE

}); // end documentready
