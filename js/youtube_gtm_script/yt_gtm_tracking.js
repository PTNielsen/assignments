(function() {
  'use strict';

  let dataLayer = [];

  // Asynchronously loads script tag with YouTube iFrame API per documentation
  // https://developers.google.com/youtube/iframe_api_reference
  let tag   = document.createElement('script');
  tag.src   = "https://www.youtube.com/iframe_api";
  tag.async = true 
  let firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  let frameList = document.getElementsByTagName('iframe');

  // must bind this function to the global scope to work properly within iife
  window.onYouTubeIframeAPIReady = function onYouTubeIframeAPIReady() {
    // Creating a YT.Player for every iframe tag
    [...frameList].forEach(function(frame, i) {
      new YT.Player(frame.id, {
        events: {
          'onReady': onPlayerReady
        }
      });
    });
  };

  function onPlayerReady(event) {
    // Add onStateChange event listener here to prevent JS errors in Safari
    event.target.addEventListener('onStateChange', onPlayerStateChange);
  };

  function onPlayerStateChange(event) {
    if (event.data === YT.PlayerState.PLAYING) {
      // Keeping in mind that GTM is not set up, just pushing into an array named dataLayer
      dataLayer.push({
        'event': 'customVideoEvent',
        'page': document.title,
        'action': 'play'
      });
    }
  };
})();
