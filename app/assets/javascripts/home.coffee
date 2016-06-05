$ ->
  $('.init').each ->
    elem = @
    $.ajax
      method: 'GET'
      url: "/api/v1/videos/#{$(@).attr('owner')}/#{$(@).attr('uid')}"
      success: (video) ->
        $(elem).attr('src', video.thumbnail)
        $(elem).removeClass('init')

  $('#records').click ->
    $(@).addClass('is-active')
    $('#streams').removeClass('is-active')
    $('#re').show()
    $('#st').hide()

  $('#streams').click ->
    console.log 'streams'
    $(@).addClass('is-active')
    $('#records').removeClass('is-active')
    $('#st').show()
    $('#re').hide()
