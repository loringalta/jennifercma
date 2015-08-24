delete_food = ->
  $("#delete-submit").click ->
    $.ajax(
      type: "DELETE"
      url: "/find_food/delete").success((data) ->
        console.log("why")
        $('#search-data').html(data)
      )
$(document).ready delete_food
