$ = jQuery
callback = (data) ->
	$('body').append('<ol id="list"></ol>');
	$(data).each (i, element) ->
		li = $('<li />').attr({
			'posted_at' : element.posted_at,
			'points' : element.points
		});

		a = $('<a />');
		a.attr('href', element.link);
		a.text(element.title);
		li.append(a);
		li.append('<span class="grey">' + element.points + ' ' + jQuery.timeago(parseInt(element.posted_at)) + '</span>');
		$('#list').append(li);


$.get 'stories.json', null , callback, 'json'

sortElements = (sortby) ->

	sorted = $('#list li').sort (a, b) ->
		aval = parseInt($(a).attr(sortby));
		bval = parseInt($(b).attr(sortby));

		return 0 if aval == bval
		return -1 if aval < bval
		return 1 if aval > bval
	$('#list').empty().append(sorted);

	
###
	trending function for extra credit
	velocity = distance / time
	... so ...
	trending = points / time
###
trendingSortElements = () ->

	sorted = $('#list li').sort (a, b) ->
		aVelocity = parseInt($(a).attr('points')) / parseInt($(a).attr('posted_at'));
		bVelocity = parseInt($(b).attr('points')) / parseInt($(b).attr('posted_at'));

		return 0 if aVelocity == bVelocity
		return -1 if aVelocity < bVelocity
		return 1 if aVelocity > bVelocity
	$('#list').empty().append(sorted);