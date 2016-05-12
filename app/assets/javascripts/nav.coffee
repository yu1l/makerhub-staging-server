$ ->
  $('.nav-toggle').click ->
    $(@).toggleClass('is-active')
    $('.nav-menu').toggleClass('is-active')

  $('.modal-close').on 'click', ->
    $('#signin').removeClass('is-active')
  $('#signin_button').on 'click', ->
    $('#signin').addClass('is-active')
