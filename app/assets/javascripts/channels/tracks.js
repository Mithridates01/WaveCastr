$(document).ready(function() {

var lobby = window.location.pathname.replace(/\/episodes\//, "");
App.tracks = App.cable.subscriptions.create({channel: "TracksChannel", lobby: lobby}, {
  connected: function() {
  },

  received: function(data) {
    $(data.template).hide().appendTo('#track-list').fadeIn('slow');
  }
});

});
