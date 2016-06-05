update = ->
  toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-center",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "300",
    "timeOut": "1000",
    "extendedTimeOut": "300",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
  toastr.success('更新しました')

$ ->
  $('#integration').click ->
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#it').show()
    $('#it').siblings().hide()

  $('#description').click ->
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#de').show()
    $('#de').siblings().hide()

  $('#record').click ->
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#re').show()
    $('#re').siblings().hide()

  $('#following').click ->
    $('body').get(0).scrollHeight
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#fing').show()
    $('#fing').siblings().hide()

  $('#follower').click ->
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#fwer').show()
    $('#fwer').siblings().hide()

  $('#setting').click ->
    $(this).addClass('is-active')
    $(this).siblings().removeClass('is-active')
    $('#set').show()
    $('#set').siblings().hide()

  $('#stream_title').click ->
    $(this).hide()
    $('.title_form').show()
    $('.update_title').focus()

  $('.update_title').focusout ->
    $('.title_form').hide()
    $('#stream_title').show()

  $('.category').change ->
    update()
    $(".category > select option:selected").each ->
      $.ajax
        method: 'POST'
        url: "/profile/category"
        data:
          user:
            category: $(this).val()

  $('form').submit ->
    _title = $('.update_title').val()
    $('#stream_title').show()
    $('#stream_title').text(_title)
    $('.title_form').hide()
    $('.update_title').focusout()
    $('.update_title').val(_title)
    update()
    $.ajax
      method: 'POST'
      url: '/profile/update'
      data:
        user:
          title: _title
