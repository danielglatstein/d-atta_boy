$(document).ready( function() {
  $("#pitcher_id").on("change", function() {

    $.ajax({
            url: "/players/batters",
            type: "GET",
            dataType: "json",
            data: { pitcher_id: $("#pitcher_id").val() }, // This goes to Controller in params hash, i.e. params[:file_name]
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      $('svg').hide()
                      $('.sequence-button-js').addClass('hidden')
                      var batters = data.batters
                      appendBatterOptions(batters);
                      batterIdListener();
            },
            error: function() {
            }
    });
  });
});

function batterIdListener() {
  $("#batter_id").on("change", function() {
    $.ajax({
            url: "/players/matchups",
            type: "GET",
            dataType: "json",
            data: { pitcher_id: $("#pitcher_id").val(), batter_id: $("#batter_id").val() },
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      var matchups = data.matchups;
                      buildMatchupsTable(matchups);
                      rowClickListener();
                      $('svg').hide()
                      $('.sequence-button-js').addClass('hidden')
            },
            error: function() {
            }
    });
  });
}

function rowClickListener() {
  $(".matchup_row").on("click", function() {
    $.ajax({
            url: "/players/pitches_data",
            type: "GET",
            dataType: "json",
            data: { at_bat_id: $(this.children[4]).text() },
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      var pitches_data = data.pitches_data;
                      var at_bat_id = data.at_bat_id
                      buildPitchesTable(pitches_data, at_bat_id);
                      $('.sequence-button-js').removeClass('hidden')
            },
            error: function() {
            }
    });
  });
}

function buildPitchesTable(pitches_data, at_bat_id) {
  $("table").remove();
  var pitches_data = pitches_data;
  var at_bat_id = at_bat_id
  var table = d3.select('#pitches-table').append('table');
  table.attr('class', at_bat_id)
  var columns = [
    { head: 'Result', cl: 'result', html: ƒ('result') },
    { head: 'Type', cl: 'type', html: ƒ('type') },
    { head: 'nasty', cl: 'nasty', html: ƒ('nasty') },
    { head: 'On 1b', cl: 'on_1b', html: ƒ('on_1b') },
    { head: 'On 2b', cl: 'on_2b', html: ƒ('on_2b') },
    { head: 'On 3b', cl: 'on_3b', html: ƒ('on_3b') },
    { head: 'pfx_x', cl: 'pfx_x', html: ƒ('pfx_x') },
    { head: 'pfx_z', cl: 'pfx_z', html: ƒ('pfx_z') },
    { head: 'Break Angle', cl: 'break_angle', html: ƒ('break_angle') },
    { head: 'Break Length', cl: 'break_length', html: ƒ('break_length') },
    { head: 'Spin Rate', cl: 'spin_rate', html: ƒ('spin_rate') },
    { head: 'Start Speed', cl: 'start_speed', html: ƒ('start_speed') },
    { head: 'End Speed', cl: 'end_speed', html: ƒ('end_speed') }
    ];
    

    table.append('thead').append('tr')
        .selectAll('th')
        .data(columns).enter()
        .append('th')
        .attr('class', ƒ('cl'))
        .text(ƒ('head'));
    
    table.append('tbody')
        .selectAll('tr')
        .data(pitches_data).enter()
        .append('tr')
        .attr('class', 'matchup_row')
        .selectAll('td')
        .data(function(row, i) {
            return columns.map(function(c) {
                // compute cell values for this specific row
                var cell = {};
                d3.keys(c).forEach(function(k) {
                    cell[k] = typeof c[k] == 'function' ? c[k](row,i) : c[k];
                });
                return cell;
            });
        }).enter()
        .append('td')
        .html(ƒ('html'))
        .attr('class', ƒ('cl'));
        $(".at_bat_id").hide();
}

function appendBatterOptions(batters) {
  $(".batter").remove();
  for(var i = 0; i < batters.length; i++){
    $("#batter_id").append('<option class="batter" value="' + batters[i].id + '">' + batters[i].name + '</option>');
  }
}

function buildMatchupsTable(matchups) {
  $("table").remove();
  
  var matchups = matchups;
  var table = d3.select('body').append('table');
  var columns = [
    { head: 'Date', cl: 'date', html: ƒ('date') },
    { head: 'Game', cl: 'game', html: ƒ('game') },
    { head: 'Inning', cl: 'inning', html: ƒ('inning') },
    { head: 'Result', cl: 'result', html: ƒ('result') },
    { head: 'at_bat_id', cl: 'at_bat_id', html: ƒ('at_bat_id') }
    ];
    

    table.append('thead').append('tr')
        .selectAll('th')
        .data(columns).enter()
        .append('th')
        .attr('class', ƒ('cl'))
        .text(ƒ('head'));
    
    table.append('tbody')
        .selectAll('tr')
        .data(matchups).enter()
        .append('tr')
        .attr('class', 'matchup_row')
        .selectAll('td')
        .data(function(row, i) {
            return columns.map(function(c) {
                // compute cell values for this specific row
                var cell = {};
                d3.keys(c).forEach(function(k) {
                    cell[k] = typeof c[k] == 'function' ? c[k](row,i) : c[k];
                });
                return cell;
            });
        }).enter()
        .append('td')
        .html(ƒ('html'))
        .attr('class', ƒ('cl'));
        $(".at_bat_id").hide();
}

function appendBatterOptions(batters) {
  $(".batter").remove();
  for(var i = 0; i < batters.length; i++){
    $("#batter_id").append('<option class="batter" value="' + batters[i].id + '">' + batters[i].name + '</option>');
  }
}