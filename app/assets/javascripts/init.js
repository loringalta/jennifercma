// class Gridster
//   constructor: (@widget_margin, @widget_base_dimensions) ->
//     $('.gridster > ul').gridster(
//       widget_margins: [
//         @widget_margin
//         @widget_margin
//       ]
//       widget_base_dimensions: [
//         @widget_base_dimensions
//         @widget_base_dimensions
//       ]
//       avoid_overlapped_widgets: true
//       resize: enabled: true).data('gridster')
// #
// # gridster = undefined
// # $ ->
// #   gridster = $('.gridster > ul').gridster(
// #     widget_margins: [
// #       5
// #       5
// #     ]
// #     widget_base_dimensions: [
// #       100
// #       55
// #     ]).data('gridster')
// #   widgets = [
// #     [
// #       '<li>8</li>'
// #       1
// #       1
// #     ]
// #     [
// #       '<li>9</li>'
// #       2
// #       2
// #     ]
// #     [
// #       '<li>10</li>'
// #       1
// #       3
// #     ]
// #   ]
// #   $.each widgets, (i, widget) ->
// #     gridster.add_widget.apply gridster, widget
// #     return
// #   return
// # gridster = undefined
// # $ ->
// #   gridster = $('.gridster > ul').gridster(
// #     widget_margins: [
// #       5
// #       5
// #     ]
// #     widget_base_dimensions: [
// #       100
// #       55
// #     ]).data('gridster')
// #   widgets = [
// #     [
// #       '<li>8</li>'
// #       1
// #       1
// #     ]
// #   ]
// #   $.each widgets, (i, widget) ->
// #     gridster.add_widget.apply gridster, widget
// #     return
// #   #initWidgets(gridster, link_data)
// #   # $(document).on 'click', '.deleteWidget', ->
// #   #   correspondingPanel = $(this).closest('li')
// #   #   gridster.remove_widget correspondingPanel
// #   #   return
// # return
//
// initWidgets = (gridster, link_data) ->
//   if !$("#search-body").length
//     $.ajax(
//       type: 'GET'
//       url: 'find_food/dashboard').success (data) ->
//         #gridster.add_widget link_data, 5, 4
//         return
//         return

// var gridster;
//
// $(function() {
//   gridster = $(".gridster ul").gridster({
//     widget_margins: [10,10],
//     widget_base_dimensions: [70,70],
//     avoid_overlapped_widgets: true,
//     resize: {
//       enabled: true,
//     },
//   }).data('gridster');
//   var widgets = [
//     ['<li>0</li>', 1, 2],
//     ['<li>1</li>', 3, 2],
//     ['<li>2</li>', 3, 2],
//     ['<li>3</li>', 2, 1],
//     ['<li>4</li>', 4, 1],
//     ['<li>5</li>', 1, 2],
//     ['<li>6</li>', 2, 1],
//     ['<li>7</li>', 3, 2],
//     ['<li>8</li>', 1, 1],
//     ['<li>9</li>', 2, 2],
//     ['<li>10</li>', 1, 3]
//   ];
//
//   $.each(widgets, function(i, widget) {
//     gridster.add_widget.apply(gridster, widget)
//   });
//
// });
