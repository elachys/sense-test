// Generated by CoffeeScript 1.3.3
(function() {
  var $, callback;

  $ = jQuery;

  callback = function(data) {
    $(document).append('<ol id="list"></ol>');
    return $(data).each(function(i, element) {
      return $('#list').append('<li>' + element.title + ' - ' + element.points + '</li>');
    });
  };

  $(document).ready(function() {
    return $.get('stories.json', null, callback, 'json');
  });

}).call(this);
