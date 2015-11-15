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

$(document).on("click", 'p', function() {
    $.ajax({
                 url: "/players", // Route to the Script Controller method
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
    var table = d3.select('body')
        .append('table');

    var columns = [
    { head: 'Pitcher', cl: 'title', html: ƒ('0') },
    { head: 'Batter', cl: 'center', html: ƒ('1') },
    // { head: 'Length', cl: 'center', html: ƒ('length', length()) },
    // { head: 'Budget', cl: 'num', html: ƒ('budget', d3.format('$,')) },
    // { head: 'Rating', cl: 'num', html: ƒ('rating', d3.format('.1f')) }
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