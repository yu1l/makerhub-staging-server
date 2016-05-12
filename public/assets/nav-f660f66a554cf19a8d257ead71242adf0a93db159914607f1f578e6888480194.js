(function() {
  $(function() {
    $('.nav-toggle').click(function() {
      $(this).toggleClass('is-active');
      return $('.nav-menu').toggleClass('is-active');
    });
    $('.modal-close').on('click', function() {
      return $('#signin').removeClass('is-active');
    });
    return $('#signin_button').on('click', function() {
      return $('#signin').addClass('is-active');
    });
  });

}).call(this);
