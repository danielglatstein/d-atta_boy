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
//= require_tree .

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
            },
            error: function() {
              debugger
            }
    });
  });
}

function buildMatchupsTable(matchups) {
  $("table").remove();
  
  var matchups = matchups;
  var table = d3.select('body').append('table');

  var columns = [
    { head: 'Date', cl: 'title', html: ƒ('date') },
    { head: 'Game', cl: 'center', html: ƒ('game') },
    { head: 'Inning', cl: 'title', html: ƒ('inning') },
    { head: 'Result', cl: 'center', html: ƒ('result') },
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
    debugger
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