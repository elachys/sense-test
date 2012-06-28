$ = jQuery
callback = (data) ->
	alert(data)

$.get 'stories.json', null , callback, 'json'