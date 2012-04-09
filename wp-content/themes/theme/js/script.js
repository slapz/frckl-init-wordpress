// usage: log('inside coolFunc', this, arguments); -- paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
// you can remove this when deploying - there should be no log functions then
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};
(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

// init documentready-function
// ================================================================================
jQuery(document).ready(function($) {

  // page and path enhancements -- adding path-classes to the body
  (function(a){var b=location.pathname.split("/");a.each(b,function(c,d){b.length>2&&b[c+1]!==undefined?c&&a("html").addClass(b.slice(1,c+1).join("-")):c===0&&a("html").addClass("root")})})(jQuery)

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
