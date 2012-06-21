// prepend these files and you will have a nice script.min.js
// CODEKIT is required for this

// @codekit-prepend "debugging.js"
// @codekit-prepend "pagepaths.js"
// @codekit-prepend "jquery.colorbox.js"


// ================================================================================
// init documentready-function
// ================================================================================
jQuery(document).ready(function($) {

  // Add Colorbox to every csc-textpic element with click-enlarge
  if ($('a[rel^="lightbox"]').length) {
    $('a[rel^="lightbox"]').colorbox({
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

  // YOUR STUFF HERE.


}); // end documentready
