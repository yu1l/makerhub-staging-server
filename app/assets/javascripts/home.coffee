$ ->
  $('#records').click ->
    $(@).addClass('is-active')
    $('#streams').removeClass('is-active')
    $('#re').show()
    $('#st').hide()

  $('#streams').click ->
    $(@).addClass('is-active')
    $('#records').removeClass('is-active')
    $('#st').show()
    $('#re').hide()
