add_food = ->
  $('#add-submit').click (e) ->
    e.preventDefault()
    e.stopPropagation()
    add_query = $('input[name=add-query]').val()
    $.ajax(
      type: 'POST'
      datatype: 'json'
      url: '/find_foods/add'
      data: {'add_name': add_query}).success((data) ->
        if data.error
          $('.search_form h1').html(data.error.add_name)
        else
          $('#loading-image').show('slide')
          $.ajax(
            type: 'PUT'
            datatype: 'json'
            url: '/find_foods/update').success((data) ->
              new_table = new ConstructTable(data)
              new_table.construct()
              $('#loading-image').hide('slide')
              )
        )

$(document).ready add_food
