$(window).load ->
  $('.chat').infinitePages
    debug: true
    buffer: 200 # load new page when within 200px of nav link
#    context: '.pane' # define the scrolling container (defaults to window)
    loading: ->
    # jQuery callback on the nav element
      $(this).text("Loading next page...")
    success: ->
    # called after successful ajax call
    error: ->
    # called after failed ajax call
      $(this).text("There was an error, please try again")