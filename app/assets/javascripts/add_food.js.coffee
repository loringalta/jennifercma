add_food = ->
  $('#add-submit').click ->
    $.ajax(
      type: 'POST'
      url: '/add_foods'
      data: {'name': }
    )
