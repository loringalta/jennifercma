createSearchFinding = (id, data) ->
  stockWidget = '<li><div class = "widget-container" id = "chart-border"><div class = "hanging-button">'
  + '<button class = "deleteWidget">Delete it</button>'
  + '</div>'
  + '<div id="search-body-'
  + id + '"/></div></li>';

  gridster.add_widget.apply gridster, [
    stockWidget
    4
    4
  ]
  data
