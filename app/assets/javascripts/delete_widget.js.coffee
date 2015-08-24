delete_widget = (e) ->
  $(".gridly .delete-widget").live 'click', (e) ->
    $(this).closest('.brick').remove()

$(document).ready delete_widget
