$ ->
  $('#submit').click ->
    query = $('input[name=search_query]').val()
    $.ajax(
      type: 'POST'
      url: '/find_foods'
      data: {'name': query}).success((data) ->
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
              #data: {dashboard_size: dashboard_size}
              url: 'find_food/food_info').success((data)->
                $('input#add-submit').show('slide')
                $('input#add-query').show('slide')
                id = 0
                for item in data
                  do (item) ->
                    #$(".brick-large-#{id}").width(dashboard_size)
                    id++
                    table = "<table class = 'pure-table'><thead><tr><th>#{item.name}</th></tr></thead>"
                    for nutrient in item.nutrients
                      do (nutrient) ->
                        table += "<tr><td>#{nutrient.name}</td><td>#{nutrient.value} #{nutrient.unit}</td></tr>"
                    table += "</tbody></table"
                    brick = "<div class='brick-large-#{id}'>#{table}<div class='delete'></div></div>"
                    $('.gridly').append(brick)
                )
            return
            )
        return
        return
    ).done
  return
