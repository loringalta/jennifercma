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
        )

$(document).ready add_food
