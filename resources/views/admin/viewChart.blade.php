<!DOCTYPE html>
<html>
<head>
  <script src="{{ asset('js/canvasjs.min.js') }}"></script>
</head>
<body>

</body>
</html>
<script>
$( document ).ready(function () {

var chart1 = new CanvasJS.Chart("chartContainer1", {
  animationEnabled: true,
  theme: "light2",
  title: {
    text: "Monthly Sales Data"
  },
  axisX: {
    valueFormatString: "MMM"
  },
  axisY: {
    prefix: "$",
    labelFormatter: addSymbols
  },
  toolTip: {
    shared: true
  },
  legend: {
    cursor: "pointer",
    itemclick: toggleDataSeries
  },
  data: [
  {
    type: "column",
    name: "Actual Sales",
    showInLegend: true,
    xValueFormatString: "MMMM YYYY",
    yValueFormatString: "$#,##0",
    dataPoints: [
      { x: new Date(2016, 0), y: 20000 },
      { x: new Date(2016, 1), y: 30000 },
      { x: new Date(2016, 2), y: 25000 },
      { x: new Date(2016, 3), y: 70000, indexLabel: "High Renewals" },
      { x: new Date(2016, 4), y: 50000 },
      { x: new Date(2016, 5), y: 35000 },
      { x: new Date(2016, 6), y: 30000 },
      { x: new Date(2016, 7), y: 43000 },
      { x: new Date(2016, 8), y: 35000 },
      { x: new Date(2016, 9), y:  30000},
      { x: new Date(2016, 10), y: 40000 },
      { x: new Date(2016, 11), y: 50000 }
    ]
  },
  {
    type: "line",
    name: "Expected Sales",
    showInLegend: true,
    yValueFormatString: "$#,##0",
    dataPoints: [
      { x: new Date(2016, 0), y: 40000 },
      { x: new Date(2016, 1), y: 42000 },
      { x: new Date(2016, 2), y: 45000 },
      { x: new Date(2016, 3), y: 45000 },
      { x: new Date(2016, 4), y: 47000 },
      { x: new Date(2016, 5), y: 43000 },
      { x: new Date(2016, 6), y: 42000 },
      { x: new Date(2016, 7), y: 43000 },
      { x: new Date(2016, 8), y: 41000 },
      { x: new Date(2016, 9), y: 45000 },
      { x: new Date(2016, 10), y: 42000 },
      { x: new Date(2016, 11), y: 50000 }
    ]
  },
  {
    type: "area",
    name: "Profit",
    markerBorderColor: "white",
    markerBorderThickness: 2,
    showInLegend: true,
    yValueFormatString: "$#,##0",
    dataPoints: [
      { x: new Date(2016, 0), y: 5000 },
      { x: new Date(2016, 1), y: 7000 },
      { x: new Date(2016, 2), y: 6000},
      { x: new Date(2016, 3), y: 30000 },
      { x: new Date(2016, 4), y: 20000 },
      { x: new Date(2016, 5), y: 15000 },
      { x: new Date(2016, 6), y: 13000 },
      { x: new Date(2016, 7), y: 20000 },
      { x: new Date(2016, 8), y: 15000 },
      { x: new Date(2016, 9), y:  10000},
      { x: new Date(2016, 10), y: 19000 },
      { x: new Date(2016, 11), y: 22000 }
    ]
  }]
});
chart1.render();

function addSymbols(e) {
  var suffixes = ["", "K", "M", "B"];
  var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);

  if(order > suffixes.length - 1)
    order = suffixes.length - 1;

  var suffix = suffixes[order];
  return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}




 var chart2 = new CanvasJS.Chart("chartContainer2", {
  animationEnabled: true,
  title:{
    text: "Daily report"
  },
  axisX: {
    valueFormatString: "DD MMM,YY"
  },
  axisY: {
    title: "",
    includeZero: false,

  },
  legend:{
    cursor: "pointer",
    fontSize: 16,
    itemclick: toggleDataSeries
  },
  toolTip:{
    shared: true
  },
  data: [{
    name: "Myrtle Beach",
    type: "spline",
    yValueFormatString: "#0.## °C",
    showInLegend: true,
    dataPoints: [
      { x: new Date(2017,6,24), y: 31 },
      { x: new Date(2017,6,25), y: 31 },
      { x: new Date(2017,6,26), y: 29 },
      { x: new Date(2017,6,27), y: 29 },
      { x: new Date(2017,6,28), y: 31 },
      { x: new Date(2017,6,29), y: 30 },
      { x: new Date(2017,6,30), y: 29 }
    ]
  },
  {
    name: "Martha Vineyard",
    type: "spline",
    yValueFormatString: "#0.## °C",
    showInLegend: true,
    dataPoints: [
      { x: new Date(2017,6,24), y: 20 },
      { x: new Date(2017,6,25), y: 20 },
      { x: new Date(2017,6,26), y: 25 },
      { x: new Date(2017,6,27), y: 25 },
      { x: new Date(2017,6,28), y: 25 },
      { x: new Date(2017,6,29), y: 25 },
      { x: new Date(2017,6,30), y: 25 }
    ]
  },
  {
    name: "Nantucket",
    type: "spline",
    yValueFormatString: "#0.## °C",
    showInLegend: true,
    dataPoints: [
      { x: new Date(2017,6,24), y: 22 },
      { x: new Date(2017,6,25), y: 19 },
      { x: new Date(2017,6,26), y: 23 },
      { x: new Date(2017,6,27), y: 24 },
      { x: new Date(2017,6,28), y: 24 },
      { x: new Date(2017,6,29), y: 23 },
      { x: new Date(2017,6,30), y: 23 }
    ]
  }]
});
chart2.render();

function toggleDataSeries(e) {
  if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
    e.dataSeries.visible = false;
  } else {
    e.dataSeries.visible = true;
  }
  e.chart.render();
}





var chart3 = new CanvasJS.Chart("chartContainer3", {
  theme: "light2", // "light1", "light2", "dark1", "dark2"
  exportEnabled: true,
  animationEnabled: true,
  title: {
    text: "Desktop Browser Market Share in 2018"
  },
  data: [{
    type: "pie",
    startAngle: 25,
    toolTipContent: "<b>{label}</b>: {y}%",
    showInLegend: "true",
    legendText: "{label}",
    indexLabelFontSize: 16,
    indexLabel: "{label} - {y}%",
    dataPoints: [
      { y: 51.08, label: "Chrome" },
      { y: 27.34, label: "Internet Explorer" },
      { y: 10.62, label: "Firefox" },
      { y: 5.02, label: "Microsoft Edge" },
      { y: 4.07, label: "Safari" },
      { y: 1.22, label: "Opera" },
      { y: 0.44, label: "Others" }
    ]
  }]
});
chart3.render();

});





</script>





<div class="container box">
    <div class="box-header with-border">
<div id="chartContainer1" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<div id="chartContainer2" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<div id="chartContainer3" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>

    </div>
</div>
