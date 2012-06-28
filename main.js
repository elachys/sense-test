// Generated by CoffeeScript 1.3.3
var $, callback, sortElements;

$ = jQuery;

callback = function(data) {
  $('body').append('<ol id="list"></ol>');
  return $(data).each(function(i, element) {
    var a, li, span;
    li = $('<li />').attr({
      'posted_at': element.posted_at,
      'points': element.points
    });
    a = $('<a />');
    a.attr('href', element.link);
    a.text(element.title);
    li.append(a);
    span = '<span />';
    span.addClass('grey');
    span.text(element.points + ' ' + jQuery.timeago(parseInt(element.posted_at)));
    li.append(span);
    return $('#list').append(li);
  });
};

$.get('stories.json', null, callback, 'json');

sortElements = function(sortby) {
  var current, sorted;
  current = new Date().getTime();
  sorted = $('#list li').sort(function(a, b) {
    var aval, bval;
    if (sortby === 'trending') {
      aval = parseInt($(a).attr('points')) / (current - parseInt($(a).attr('posted_at')));
      bval = parseInt($(b).attr('points')) / (current - parseInt($(b).attr('posted_at')));
    } else {
      aval = parseInt($(a).attr(sortby));
      bval = parseInt($(b).attr(sortby));
    }
    if (aval === bval) {
      return 0;
    }
    if (aval < bval) {
      return 1;
    }
    if (aval > bval) {
      return -1;
    }
  });
  return $('#list').empty().append(sorted);
};
