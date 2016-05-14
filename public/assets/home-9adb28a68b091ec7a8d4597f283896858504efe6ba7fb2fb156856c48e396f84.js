(function() {
  $(function() {
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
