$(document).on('page:change', function(){
  $('.sequence-button-js').on('click', function(){
    $.ajax({
            url: "/at_bats/at_bat_pitches_data",
            type: "GET",
            dataType: "json",
            data: { at_bat_id: $('table').attr('class') },
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      var pitches_data = data.pitches_data;
                      $('.sequence-button-js').removeClass('hidden')
                      graphPitches(pitches_data)
                      $('.sequence-button-js').addClass('hidden')
            },
            error: function() {
            }
    });
  })
})