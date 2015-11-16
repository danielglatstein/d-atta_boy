var dataSetProperties = {
  label: 'Top Five Strikeout Pitchers 2015 MLB Playoffs', 
  fillColor: 'rgba(220,220,220,0.5)', 
  strokeColor: 'rgba(220,220,220,0.8)', 
  highlightFill: 'rgba(220,220,220,0.75)', 
  highlightStroke: 'rgba(220,220,220,1)'
}

$(function() {
  getPitcherStrikeOuts(strikeoutSuccess);
});

function extractNumberOfStrikeOuts(players) {

  var numStrikeOuts = []

  players.forEach(function(player){
    numStrikeOuts.push(player.strike_outs);
  });

  return numStrikeOuts; 

}

function extractNames(players) {

  var playerNames = []

  players.forEach(function(player){
    playerNames.push(player.name);
  });

  return playerNames; 

}

function chartData(categories, inputData) {
  return { labels :  categories , datasets : [ { label: dataSetProperties.label, fillColor: dataSetProperties.fillColor, 
  strokeColor: dataSetProperties.strokeColor, highlightFill: dataSetProperties.highlightFill, highlightStroke: dataSetProperties.highlightStroke , data : inputData  } ] };
}

function getPitcherStrikeOuts(callback){
  $.ajax({
    url: '/strikeout_leaders',
    method: "GET",
    dataType: "JSON"
  }).success(function(data){
    callback(data.rankings);
  }); 
}

function strikeoutSuccess(parsedJSON) {
    var names = extractNames(parsedJSON);
    var numStrikeOuts = extractNumberOfStrikeOuts(parsedJSON);
    var chart = chartData(names, numStrikeOuts);
    var wutang = $('#strike-out-chart');
    var ctx = wutang[0].getContext('2d');
    var barChart = new Chart(ctx).Bar(chart);
}