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
            dashboard_size = Math.round(($(window).width()*.75) / 4)
            $('.gridly').gridly(
              base: dashboard_size
              gutter: 4
              columns: 4
            )
            $.ajax(
              type: 'GET'
              dataType: 'json'
              data: {dashboard_size: dashboard_size}
              url: 'find_food/food_info').success((data)->
                id = 0
                for item in data
                  do (item) ->
                    $(".brick-large-#{id}").width(dashboard_size)
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
    ).done () ->
      $(window).resize ->
          columns = undefined
          winwid = $(window).width()
          if 500 > winwid > 100
            columns = 1
          else if 800 > winwid > 500
            columns = 2
          else if 1500 > winwid > 800
            columns = 3
          else if winwid > 1501
            columns = 4
          console.log(columns)
          dashboard_size = Math.round(($(window).width()*.75) / columns)
          console.log(dashboard_size)
          $('.gridly').gridly(
            base: dashboard_size
            gutter: 4
            columns: columns
          )
          i = 30
          while i >= 0
            $(".brick-large-#{i}").width(dashboard_size)
            i--
  return
  return
