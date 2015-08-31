$ ->
  $('#submit').click ->
    query = $('input[name=search_query]').val()
    results = $('input[name=result_number]').val()
    $.ajax(
      type: 'POST'
      url: '/find_foods'
      dataType: 'json'
      data: {'name': query, 'results': results}).success((data) ->
        if data.error
          $('.search_form h1').html(data.error.num_results)
        else
          $('#loading-image').show('slide')
          $.ajax(
            type: 'GET'
            url: '/find_foods/show').success((data) ->
              $('.search-data').html(data)
              $('.gridly').gridly(
                base: 280
                gutter: 10
                'responsive': true
              )
              $.ajax(
                type: 'PUT'
                dataType: 'json'
                url: '/find_foods/update').success((data)->
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
