$ = jQuery
callback = (data) ->
	$('body').append('<ol id="list"></ol>');
	$(data).each (i, element) ->
		li = $('<li />');
		li.text(element.title + ' - ' + element.points);
		li.data(element);
		$('#list').append(li);


$.get 'stories.json', null , callback, 'json'

sortElements = (sortby) ->
	elements = $('#list li').sort (a, b) ->
		return 0 if $(a).data(sortby) == $(b).data(sortby) 
		return -1 if $(a).data(sortby) < $(b).data(sortby)
		return 1 if $(a).data(sortby) > $(b).data(sortby)
