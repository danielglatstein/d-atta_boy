$(function(){
  graphPitchesListener();
  pitchTypeListListener()
  checkBoxListener();
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
              .attr("class", "pitch_distribution")
              .attr("width", "450")
              .attr("height", "550");

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
              .attr("r", 4);

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
  buildPitchTypeList();
};

function buildPitchTypeList(uncheckedPitches) {
  pitchTypes = ["FA", "FF", "FT", "FC", "FS", "SL", "CH", "KC", "KN", "EP", "SI"];
  $data_points = d3.selectAll("circle")[0]
  
  var pitchTypeHash = {};
  pitchTypeHash["total"] = 0;
  var type;
  for(var i = 0; i < $data_points.length; i++) {
    type = $($data_points[i]).attr("class")
    if(!!pitchTypeHash[type]) {
      pitchTypeHash[type] = pitchTypeHash[type] + 1;
      pitchTypeHash["total"] = pitchTypeHash["total"] + 1;
    } else {
      pitchTypeHash[type] = 1;
      pitchTypeHash["total"] = pitchTypeHash["total"] + 1;
    }
  }  

  if(uncheckedPitches) {
    for(var i = 0; i < uncheckedPitches.length; i++) {
      if(pitchTypeHash[uncheckedPitches[i]]){
        delete pitchTypeHash[uncheckedPitches[i]];
      }
    }
  }

  var pitchTypeArr = [];
  Object.keys(pitchTypeHash).forEach(function (key) { 
    hash = {};
    hash["pitchType"] = key;
    hash["count"] = pitchTypeHash[key];
    pitchTypeArr.push(hash);
  });

  for(var i = 0; i < pitchTypes.length; i++) {
    if(pitchTypeHash[pitchTypes[i]]) {
      $("input[value='" + pitchTypes[i] + "']").prop("checked", true);
    } else {
      $("input[value='" + pitchTypes[i] + "']").prop("checked", false);
    }
  }  

  $("table").remove();

  var table = d3.select('#pitch_type_list').append('table').attr("class", "pitch_type_counts");
  var columns = [
    { head: 'Pitch Type', cl: 'pitchType', html: ƒ('pitchType') },
    { head: 'Count', cl: 'count', html: ƒ('count') },
  ]

  table.append('thead').append('tr')
        .selectAll('th')
        .data(columns).enter()
        .append('th')
        .attr('class', ƒ('cl'))
        .text(ƒ('head'));

  table.append('tbody')
        .selectAll('tr')
        .data(pitchTypeArr).enter()
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

        $.each($($("td")), function(index, value) {
          $(value).attr("class", $(value).text());
        });
}

function pitchTypeListListener() {
  $("#pitchers").on("change", function() {
    $("input[type='checkbox']").attr("checked", false);
    buildPitchTypeList();
  });
  $("").on("click", function() {
    $("." + $(this).attr("class")).toggle();
  });
}

function checkBoxListener() {
  $("input[type='checkbox']").on("click", function() {
    $("circle." + $(this).val()).toggle();
    checkedPitches = [];
    p = $("input:checkbox:not(:checked)").slice(0,$("input:checkbox:not(:checked)").length)
    $.each( p, function(index, box) {
      checkedPitches.push($(box).val());
    });
    $("input[type='checkbox']").attr("checked", false);
    buildPitchTypeList(checkedPitches);
  });
}