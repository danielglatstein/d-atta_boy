$(document).on('page:change', function(){
  $('.sequence-button-js').on('click', function(){
    $.ajax({
            url: "/at_bats/at_bat_pitches_data",
            type: "GET",
            dataType: "json",
            data: { at_bat_id: $('table').attr('class') },
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      debugger; 
                      var pitches_data = data.pitches_data;

                      buildPitchesTable(pitches_data);
                      $('.sequence-button-js').removeClass('hidden')
            },
            error: function() {
            }
    });
  })
})