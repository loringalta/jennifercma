root = exports ? window

root.construct_table = (a, b) ->
  return a + b

class root.ConstructTable
  constructor: (@data) ->

  construct: ->
    if @data.empty
      $('.search_form h1').html("No Entries Found")
    id = 0
    for item in @data
      do (item) ->
        id++
        table = "<table class = 'pure-table'><thead><tr><th>#{item.name}</th><th>in 100 grams</th></tr></thead>"
        for nutrient in item.nutrients
          do (nutrient) ->
            table += "<tr><td>#{nutrient.name}</td><td>#{nutrient.value} #{nutrient.unit}</td></tr>"
        table += "<tr><td>Group</td><td>#{item.group}</td></tr>"
        # for measure in nutrient.measures
        #   do (measure) ->
        #     table += "<tr><td>#{measure.label} is</td><td>#{measure.eqv} g #{measure.value} g </td></tr>"
        table += "</tbody></table"
        brick = "<div class='brick large-#{id}'><a class = 'delete-widget' href = '#'>x</a>#{table}</div>"
        $('.gridly').append(brick)
