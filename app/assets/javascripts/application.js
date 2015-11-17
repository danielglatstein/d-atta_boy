// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks


$(document).ready( function() {
  $("#pitcher_id").on("change", function() {

    $.ajax({
            url: "/players",
            type: "GET",
            dataType: "json",
            data: { pitcher_id: $("#pitcher_id").val() }, // This goes to Controller in params hash, i.e. params[:file_name]
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      var batters = data.batters
                      appendBatterOptions(batters);
                      batterIdListener();
            },
            error: function() {
              debugger
            }
    });
  });
});

function batterIdListener() {
  $("#batter_id").on("change", function() {
    $.ajax({
            url: "/players",
            type: "GET",
            dataType: "json",
            data: { pitcher_id: $("#pitcher_id").val(), batter_id: $("#batter_id").val() },
            complete: function() {},
            success: function(data, textStatus, xhr) {
                      var matchups = data.matchups;
                      buildMatchupsTable(matchups);
                      rowClickListener();
            },
            error: function() {
              debugger
            }
    });
  });
}

function rowClickListener() {
  $(".matchup_row").on("click", function() {
    $.ajax({
            url: "/players",
            type: "GET",
            dataType: "json",
            data: { at_bat_id: $(this.children[4]).text() },
            complete: function() {},
            success: function(data, textStatus, xhr) {
  
                      var pitches_data = data.pitches_data;
                      buildPitchesTable(pitches_data);
            },
            error: function() {
              debugger
            }
    });
  });
}

function buildPitchesTable(pitches_data) {
  $("table").remove();
  var pitches_data = pitches_data;
  var table = d3.select('body').append('table');
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


$(document).on("click", '#update_players', function() {



  $.ajax({
               url: "/players",
              type: "GET",
          dataType: "json",
              data: { players_limit: $("#players_limit").val() }, // This goes to Controller in params hash, i.e. params[:file_name]
          complete: function() {},
           success: function(data, textStatus, xhr) {
                      // Do something with the response here

                      drawTable(data);
                      editor.setValue(data.file_content) // Show the file contents in our editor.
                                                         // editor is defined somewhere above 
                                                         // 'file_content' is the key we use to respond
                                                         // in the controller function below
                    },
             error: function() {
              debugger
                    }
  });
});



function drawTable(players) {
  $("table").remove();
    var players = players.data;
    var table = d3.select('body').append('table');

    var columns = [
    { head: 'First', cl: 'title', html: ƒ('0') },
    { head: 'Last', cl: 'center', html: ƒ('1') },
    ];

    // create table header
    table.append('thead').append('tr')
        .selectAll('th')
        .data(columns).enter()
        .append('th')
        .attr('class', ƒ('cl'))
        .text(ƒ('head'));

    // create table body
    table.append('tbody')
        .selectAll('tr')
        .data(players).enter()
        .append('tr')
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
}