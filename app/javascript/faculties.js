$(document).on('turbolinks:load', function() {
  $('#filter-form').on('change', function() {
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'script'
    });
    return false;
  });
});
