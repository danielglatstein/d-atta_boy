var dataSetProperties = {
  label: 'Top Five Home Run Hitters 2015 MLB Playoffs', 
  fillColor: 'rgba(220,220,220,0.5)', 
  strokeColor: 'rgba(220,220,220,0.8)', 
  highlightFill: 'rgba(220,220,220,0.75)', 
  highlightStroke: 'rgba(220,220,220,1)'
}

$(function() {
  getHomeTop5RunHitters(success);
});

function extractNumberOfHomeRuns(players) {

  var numHomeRuns = []

  players.forEach(function(player){
    numHomeRuns.push(player.home_runs);
  });

  return numHomeRuns; 

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

function getHomeTop5RunHitters(callback){
  $.ajax({
    url:  "/home_run_leaders",
    method: "GET",
    dataType: "JSON" 
  }).success(function(data){ 
    callback(data.rankings);
  }); 
}

function success(parsedJSON) {

    var names = extractNames(parsedJSON);
    var numHomeRuns = extractNumberOfHomeRuns(parsedJSON);
    var chart = chartData(names, numHomeRuns);
    var wutang = $('#home-run-chart');
    var ctx = wutang[0].getContext('2d');
    var barChart = new Chart(ctx).Bar(chart);
}
