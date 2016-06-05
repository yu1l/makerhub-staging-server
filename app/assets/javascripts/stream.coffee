$ ->
  $('.init').map ->
    elem = @
    $.ajax
      method: 'GET'
      url: "/api/v1/videos/#{$(@).attr('owner')}/#{$(@).attr('uid')}"
      success: (video) ->
        $(elem).attr('src', video.thumbnail)
        $(elem).removeClass('init')
