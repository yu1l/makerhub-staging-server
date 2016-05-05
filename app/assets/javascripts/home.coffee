$ ->
  $('.modal-close').on 'click', ->
    $('#signin').removeClass('is-active')
  $('#signin_button').on 'click', ->
    $('#signin').addClass('is-active')
