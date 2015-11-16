$(function(){
  graphPitchesListener();
});

function graphPitchesListener() {
  $("#pitchers").on("change", function() {
    $.ajax({
          url: "/pitches",
          type: "GET",
          dataType: "json",
          data: { pitcher_id: $("#pitchers").val() }, // This goes to Controller in params hash, i.e. params[:file_name]
          complete: function() {},
          success: function(data, textStatus, xhr) {
                    var pitches = data.pitches
                    graphPitches(pitches)
          },
          error: function() {
            debugger
          }
    });
  });
}

function graphPitches(data) {
  $("svg").remove();

  //Width and height
  var w = 300;
  var h = 300;
  var padding = 30;

  var svg = d3.select("#viz")
              .append("svg")
              .attr("width", "1000")
              .attr("height", "1000");

  var xScale = d3.scale.linear()
             .domain([200, 20])
             .range([400, 20]);
  var yScale = d3.scale.linear()
             .domain([200, 20])
             .range([400, 20]);



  svg.selectAll("circle")
              .data(data)
              .enter()
              .append("circle")
              .attr("cx", function(d) {
                  return xScale(d.x);
              })
              .attr("cy", function(d) {
                  return yScale(d.y);
              })
              .attr("class", function(d) {
                return d.type
              })
              .attr("r", 3);

  var xAxisBottom = d3.svg.axis()
              .scale(xScale)
              .orient("bottom");

  svg.append("g")
              .attr("transform", "translate(5,520)")
              .call(xAxisBottom);

  var xAxisTop = d3.svg.axis()
              .scale(xScale)
              .orient("top");

  svg.append("g")
              .attr("transform", "translate(5,140)")
              .call(xAxisTop);

  var yAxisLeft = d3.svg.axis()
              .scale(yScale)
              .orient("left");

  svg.append("g")
              .attr("transform", "translate(20,120)")
              .call(yAxisLeft);

  var yAxisRight = d3.svg.axis()
              .scale(yScale)
              .orient("right");

  svg.append("g")
              .attr("transform", "translate(410,120)")
              .call(yAxisRight);


  checkBoxListener();

};

function checkBoxListener() {
  
}