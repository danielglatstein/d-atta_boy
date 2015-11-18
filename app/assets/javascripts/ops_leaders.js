var dataSetProperties = {
  label: 'Top Ten OPS 2015 MLB Playoffs', 
  fillColor: 'rgba(220,220,220,0.5)', 
  strokeColor: 'rgba(220,220,220,0.8)', 
  highlightFill: 'rgba(220,220,220,0.75)', 
  highlightStroke: 'rgba(220,220,220,1)'
}

$(function() {
  getOPS(opsSuccess);
});

function extractOPS(players) {

  var opsArray = []

  players.forEach(function(player){
    opsArray.push(player.ops);
  });

  return opsArray; 

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

function getOPS(callback){
  $.ajax({
    url: '/ops_leaders',
    method: "GET",
    dataType: "JSON"
  }).success(function(data){
    callback(data.rankings);
  }); 
}

function opsSuccess(parsedJSON) {
    var names = extractNames(parsedJSON);
    var opsLeaders = extractOPS(parsedJSON);
    var chart = chartData(names, opsLeaders);
    var wutang = $('#ops-leader-chart');
    var ctx = wutang[0].getContext('2d');
    var barChart = new Chart(ctx).Bar(chart);
}