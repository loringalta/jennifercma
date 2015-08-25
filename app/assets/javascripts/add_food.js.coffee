add_food = ->
  $('#add-submit').click (e) ->
    e.preventDefault()
    e.stopPropagation()
    add_query = $('input[name=add-query]').val()
    $.ajax(
      type: 'POST'
      url: '/find_food/add_food'
      data: {'add_name': add_query}).success((data) ->
        $('.loading-image').css('display', 'inline-block')
        $.ajax(
          type: 'GET'
          datatype: 'json'
          url: '/find_food/food_info').success((data) ->
            new_table = new ConstructTable(data)
            new_table.construct()
            $('.loading-image').hide('slide')
            )
        )

$(document).ready add_food
