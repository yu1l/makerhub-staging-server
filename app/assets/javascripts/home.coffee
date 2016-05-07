$ ->
  $('.header-toggle').click ->
    $(@).toggleClass('is-active')
    $('.header-menu').toggleClass('is-active')

  $('.modal-close').on 'click', ->
    $('#signin').removeClass('is-active')
  $('#signin_button').on 'click', ->
    $('#signin').addClass('is-active')
