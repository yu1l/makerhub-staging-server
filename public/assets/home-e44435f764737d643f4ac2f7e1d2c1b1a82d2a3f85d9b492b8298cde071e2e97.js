(function() {
  $(function() {
    $('.nav-toggle').click(function() {
      $(this).toggleClass('is-active');
      return $('.nav-menu').toggleClass('is-active');
    });
    $('.modal-close').on('click', function() {
      return $('#signin').removeClass('is-active');
    });
    $('#signin_button').on('click', function() {
      return $('#signin').addClass('is-active');
    });
    $('#records').click(function() {
      $(this).addClass('is-active');
      $('#streams').removeClass('is-active');
      $('#re').show();
      return $('#st').hide();
    });
    return $('#streams').click(function() {
      $(this).addClass('is-active');
      $('#records').removeClass('is-active');
      $('#st').show();
      return $('#re').hide();
    });
  });

}).call(this);
