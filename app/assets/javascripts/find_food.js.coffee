$ ->
  $('#submit').click ->
    query = $('input[name=search_query]').val()
    $.ajax(
      type: 'POST'
      url: '/find_foods'
      data: {'name': query}).success((data) ->
        $('.loading-image').css('display', 'inline-block')
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
                if data.empty
                  $('.search_form h1').html(data.empty)
                id = 0
                for item in data
                  do (item) ->
                    id++
                    table = "<table class = 'pure-table'><thead><tr><th>#{item.name}</th></tr></thead>"
                    for nutrient in item.nutrients
                      do (nutrient) ->
                        table += "<tr><td>#{nutrient.name}</td><td>#{nutrient.value} #{nutrient.unit}</td></tr>"
                    table += "</tbody></table"
                    brick = "<div class='brick large-#{id}'><a class = 'delete-widget' href = '#'>x</a>#{table}</div>"
                    $('.gridly').append(brick)
                $('.loading-image').hide('slide')
                )
            return
            )
        return
        return
    ).done
  return
