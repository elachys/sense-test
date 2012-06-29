$ = jQuery
callback = (data) ->
	$(data).each(index, element) =>
		alert(element.title)

$.get 'stories.json', null , callback, 'json'