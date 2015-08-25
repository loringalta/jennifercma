$ ->
  $('#submit').click ->
    query = $('input[name=search_query]').val()
    results = $('input[name=result_number]').val()
    $.ajax(
      type: 'POST'
      url: '/find_foods'
      data: {'name': query, 'results': results}).success((data) ->
        $('#loading-image').show('slide')
        $.ajax(
          type: 'GET'
          # dataType: 'json'
          url: '/find_food/dashboard').success((data) ->
            $('#search-data').html(data)
            $('.gridly').gridly(
              base: 300
              gutter: 4
              'responsive': true
            )
            $.ajax(
              type: 'GET'
              dataType: 'json'
              url: 'find_food/food_info').success((data)->
                console.log(data)
                new_table = new ConstructTable(data)
                new_table.construct()
                $('#loading-image').hide('slide')
                )
            return
            )
        return
        return
    ).done
  return
