// init documentready-function
jQuery(document).ready(function($) {


// Add Colorbox to every csc-textpic element with click-enlarge
if ($('a[rel^="lightbox"]').length) {
  $('a[rel^="lightbox"]').colorbox({
    opacity: 0.5,
    loop: false,
    maxWidth: '90%',
    maxHeight: '90%',
    current: "Bild {current} von {total}",
    previous: "zurück",
    next: "weiter",
    close: 'schließen',
    onOpen: function() { $('#container').addClass('cboxBlurred'); },
    onClosed: function() { $('#container').removeClass('cboxBlurred'); }
  });
}
// YOUR STUFF HERE.



}); // end documentready

