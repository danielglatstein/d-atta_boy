$(document).on('page:change', function(){
  //*******************************************************************
  //  CREATE MATRIX AND MAP
  //*******************************************************************
  d3.csv('assets/javascripts/world_series.csv', function (error, data) { 
    var mpr = chordMpr(data);
    mpr
      .addValuesToMap('has')
      .setFilter(function (row, a, b) {
        return (row.has === a.name && row.prefers === b.name)
      })
      .setAccessor(function (recs, a, b) {
        if (!recs[0]) return 0;
        return +recs[0].count;
      });
    drawChords(mpr.getMatrix(), mpr.getMap());
  });
  //*******************************************************************
  //  DRAW THE CHORD DIAGRAM
  //*******************************************************************
  function drawChords (matrix, mmap) {
    var w = 980, h = 800, r1 = h / 2, r0 = r1 - 100;

    var fill = d3.scale.ordinal()
        .domain(d3.range(32))
        .range(["#FDB827", "#0D2B56", "#FD5A1E", "#003831", "#CC3433", "#000000", "#0C2C56", "#BD3039", "#CE1141", "#E81828", "#284898", "#C6011F", "#E31937", "#003087", "#E4002B", "#C41E3A", "#005A9C", "#FF6600", "#002B5C", "#DF4601", "#FF5910", "#B6922E", "#05143F", "#004687", "#134A8E", "#008080", "#A71930", "#EB6E1F", "#333366", "#8FBCE6", "#C0111F", "#BA0021"]);

    var chord = d3.layout.chord()
        .padding(.02)
        .sortSubgroups(d3.descending)
        .sortChords(d3.descending);

    var arc = d3.svg.arc()
        .innerRadius(r0)
        .outerRadius(r0 + 20);

    var svg = d3.select("#world-series-js").append("svg:svg")
        .attr("width", w)
        .attr("height", h)
      .append("svg:g")
        .attr("id", "circle")
        .attr("transform", "translate(" + w / 2 + "," + h / 2 + ")");

        svg.append("circle")
            .attr("r", r0 + 20);

    var rdr = chordRdr(matrix, mmap);
    chord.matrix(matrix);

    var g = svg.selectAll("g.group")
        .data(chord.groups())
      .enter().append("svg:g")
        .attr("class", "group")
        .on("mouseover", mouseover)
        .on("mouseout", function (d) {d3.select("#tooltip").style("visibility", "hidden") });

    g.append("svg:path")
        .style("stroke", "black")
        .style("fill", function(d) { return fill(d.index); })
        .attr("d", arc);

    g.append("svg:text")
        .each(function(d) { d.angle = (d.startAngle + d.endAngle) / 2; })
        .attr("dy", ".35em")
        .style("font-family", "helvetica, arial, sans-serif")
        .style("font-size", "10px")
        .attr("text-anchor", function(d) { return d.angle > Math.PI ? "end" : null; })
        .attr("transform", function(d) {
          return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")"
              + "translate(" + (r0 + 26) + ")"
              + (d.angle > Math.PI ? "rotate(180)" : "");
        })
        .text(function(d) { return rdr(d).gname; });

      var chordPaths = svg.selectAll("path.chord")
            .data(chord.chords())
          .enter().append("svg:path")
            .attr("class", "chord")
            .style("stroke", function(d) { return d3.rgb(fill(d.target.index)).darker(); })
            .style("fill", function(d) { return fill(d.target.index); })
            .attr("d", d3.svg.chord().radius(r0))
            .on("mouseover", function (d) {
              d3.select("#tooltip")
                .style("visibility", "visible")
                .html(chordTip(rdr(d)))
                .style("top", function () { return (d3.event.pageY - 100)+"px"})
                .style("left", function () { return (d3.event.pageX - 100)+"px";})
            })
            .on("mouseout", function (d) { d3.select("#tooltip").style("visibility", "hidden") });

      function chordTip (d) {
        var p = d3.format(".2%"), q = d3.format(",.3r")
        return "Chord Info:<br/>"
          + d.sname + " beat the " + d.tname +" "+
          + q(d.svalue) + " times"
          + (d.sname === d.tname ? "": ("<br/>while...<br/>"
          + d.tname + " beat the " + d.sname +" "+
          + q(d.tvalue) + " times"))
      }

      function groupTip (d) {
        var p = d3.format(".1%"), q = d3.format(",.2r")
        return d.gname + " have won<br/>" + q(d.gvalue) + " World Series titles"
      }

      function mouseover(d, i) {
        d3.select("#tooltip")
          .style("visibility", "visible")
          .html(groupTip(rdr(d)))
          .style("top", function () { return (d3.event.pageY - 80)+"px"})
          .style("left", function () { return (d3.event.pageX - 130)+"px";})

        chordPaths.classed("fade", function(p) {
          return p.source.index != i
              && p.target.index != i;
        });
      }
  }
}); 
