// init documentready-function
jQuery(document).ready(function($) {

  // Add Colorbox to every .lightbox element with click-enlarge
  $('a.lightbox').colorbox({
    loop: false,
    maxWidth: '90%',
    maxHeight: '90%',
    slideshow: true,
    slideshowAuto: false,
    // german language
    slideshowStart: 'Diashow starten',
    slideshowStop: 'Diashow anhalten',
    current: "Bild {current} von {total}",
    previous: "zurück",
    next: "weiter",
    close: 'schließen'
  });
    
}); // end documentready

// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function(){
  log.history = log.history || [];   // store logs to an array for reference
  log.history.push(arguments);
  if(this.console){
    console.log( Array.prototype.slice.call(arguments) );
  }
};

// catch all document.write() calls
(function(doc){
  var write = doc.write;
  doc.write = function(q){ 
    log('document.write(): ',arguments); 
    if (/docwriteregexwhitelist/.test(q)) write.apply(doc,arguments);  
  };
})(document);