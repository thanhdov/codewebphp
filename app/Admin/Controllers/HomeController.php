<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopOrder;
use App\Models\ShopProduct;
use App\User;
use DB;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Table;

class HomeController extends Controller
{
    public function index()
    {
        Admin::js('/vendor/chartjs/dist/Chart.bundle.min.js');
        return Admin::content(function (Content $content) {
            $content->header('Trang tổng quát');
            // $content->description('Description...');

            $content->row(function ($row) {
                $row->column(4, new InfoBox('Tổng sản phẩm', 'tags', 'aqua', '/' . config('admin.route.prefix') . '/shop_product', ShopProduct::all()->count()));
                $row->column(4, new InfoBox('Tổng đơn hàng', 'shopping-cart', 'green', '/' . config('admin.route.prefix') . '/shop_order', ShopOrder::all()->count()));
                $row->column(4, new InfoBox('Tổng số khách hàng', 'user', 'yellow', '/' . config('admin.route.prefix') . '/shop_customer', User::all()->count()));
            });

            $content->row(function (Row $row) {
//===============Days in month=========================
                $row->column(12, function (Column $column) {
                    $totals = ShopOrder::select(DB::raw('DATE(created_at) as date, sum(total) as total_amount, count(id) as total_order'))
                        ->groupBy('date')
                        ->having('date', '>=', date('Y-m') . '-01')
                        ->having('date', '<=', date('Y-m-d'))
                        ->get();
                    $day             = (int) date('d');
                    $arrDays         = [];
                    $arrTotalsOrder  = [];
                    $arrTotalsAmount = [];
                    for ($i = 1; $i <= $day; $i++) {
                        $arrDays[$i]         = $i . '/' . date('m');
                        $arrTotalsAmount[$i] = 0;
                        $arrTotalsOrder[$i]  = 0;
                    }
                    foreach ($totals as $key => $value) {
                        $day                   = (int) date('d', strtotime($value->date));
                        $arrTotalsAmount[$day] = $value->total_amount;
                        $arrTotalsOrder[$day]  = $value->total_order;
                    }
                    $max_order = max($arrTotalsOrder);
                    //Doanh số cộng dồn
                    foreach ($arrTotalsAmount as $key => $value) {
                        if ($key != 1) {
                            $key_first = $key - 1;
                            $arrTotalsAmount[$key] += $arrTotalsAmount[$key_first];
                        }
                    }
                    $arrDays         = '["' . implode('","', $arrDays) . '"]';
                    $arrTotalsAmount = '[' . implode(',', $arrTotalsAmount) . ']';
                    $arrTotalsOrder  = '[' . implode(',', $arrTotalsOrder) . ']';
                    $html            = <<<HTML
<div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Đơn hàng trong tháng</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <!-- /.col -->
                <canvas id="chart-days-in-month" width="700" height="200"></canvas>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>

<script>
function format_number(n) {
    return n.toFixed(0).replace(/./g, function(c, i, a) {
        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
    });
}

$(document).ready(function($) {
var ctx = document.getElementById('chart-days-in-month').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        // type: 'category',
        labels: $arrDays,
        datasets: [


        {
            label: "Doanh số",
            backgroundColor: 'rgba(225,0,0,0.4)',
            borderColor: "rgb(231, 53, 253)",
            borderCapStyle: 'square',
          pointHoverRadius: 8,
          pointHoverBackgroundColor: "yellow",
          pointHoverBorderColor: "brown",
            data: $arrTotalsAmount,
            showLine: true, // disable for a single dataset,
            yAxisID: "y-axis-gravity",
            fill: false,
            type: 'line',
            lineTension: 0.1,
        },
        {
            label: "Total order",
            backgroundColor: 'rgb(138, 199, 214)',
            borderColor: 'rgb(138, 199, 214)',
      pointHoverRadius: 8,
      pointHoverBackgroundColor: "brown",
      pointHoverBorderColor: "yellow",
            data: $arrTotalsOrder,
            showLine: true, // disable for a single dataset,
            yAxisID: "y-axis-density",
            spanGaps: true,
            lineTension: 0.1,

        },

        ]
    },

    // Configuration options go here
    options: {
        responsive: true,
        legend: {
          display: true,
        },
        layout: {
            padding: {
                left: 10,
                right: 10,
                top: 0,
                bottom: 0
            }
        },
        scales: {
            yAxes: [
            {
              position: "left",
              id: "y-axis-density",
                ticks: {
                    beginAtZero:true,
                    max: $max_order + 5,
                    min: 0,
                    stepSize: 2,
                },
                  scaleLabel: {
                     display: true,
                     labelString: 'Total order',
                     fontSize: 15,

                  }
            },
            {
              position: "right",
              id: "y-axis-gravity",
              ticks: {
                    beginAtZero:true,
                    callback: function(label, index, labels) {
                        return format_number(label);
                    },
                },
                scaleLabel: {
                     display: true,
                     labelString: 'Doanh số (VNĐ)',
                     fontSize: 15
                  }
            }
            ]
        },

        tooltips: {
            callbacks: {
                label: function(tooltipItem, data) {
                    var label = data.datasets[tooltipItem.datasetIndex].label || '';

                    if (label) {
                        label += ': ';
                    }
                    label += format_number(tooltipItem.yLabel);
                    return label;
                }
            }
        }
    }
});
});
</script>
HTML;
                    $column->append($html);

                });

            });

//===================12 months  ==============================
            $content->row(function (Row $row) {
                $row->column(12, function (Column $column) {
                    for ($i = 12; $i >= 0; $i--) {
                        $months1[$i]              = date("m/Y", strtotime(date('Y-m-01') . " -$i months"));
                        $months2[$i]              = date("Y-m", strtotime(date('Y-m-01') . " -$i months"));
                        $arrTotalsAmount_year[$i] = 0;
                    }

                    $totals_month = ShopOrder::select(DB::raw('DATE_FORMAT(created_at, "%Y-%m") as ym, sum(total) as total_amount, count(id) as total_order'))
                        ->groupBy('ym')
                        ->having('ym', '>=', $months2[12])
                        ->having('ym', '<=', $months2[0])
                        ->get();
                    foreach ($totals_month as $key => $value) {
                        $key_month                        = array_search($value->ym, $months2);
                        $arrTotalsAmount_year[$key_month] = $value->total_amount;
                    }
                    $months1              = '["' . implode('","', $months1) . '"]';
                    $arrTotalsAmount_year = '[' . implode(',', $arrTotalsAmount_year) . ']';
                    $html_monthly         = <<<HTML
<div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Danh số trong 1 năm</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <!-- /.col -->
            <canvas id="chartjs-1" width="600" height="150"></canvas>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- ./box-body -->
        <!-- /.box-footer -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->
  </div>
<script>
$(document).ready(function($) {
var ctx = document.getElementById('chartjs-1').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        "labels":$months1,
        "datasets":[
            {
                "label":"Tổng doanh số",
                "data":$arrTotalsAmount_year,
                "fill":false,
                "backgroundColor":[
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(191, 25, 232, 0.2)",
                "rgba(255, 99, 132, 0.2)",
                "rgba(255, 159, 64, 0.2)",
                "rgba(255, 205, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(201, 203, 207, 0.2)",
                "rgba(181, 147, 50, 0.2)",
                "rgba(232, 130, 81, 0.2)",
                ],
                "borderColor":[
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(191, 25, 232)",
                "rgb(255, 99, 132)",
                "rgb(255, 159, 64)",
                "rgb(255, 205, 86)",
                "rgb(75, 192, 192)",
                "rgb(54, 162, 235)",
                "rgb(153, 102, 255)",
                "rgb(201, 203, 207)",
                "rgb(181, 147, 50)",
                "rgb(232, 130, 81)",
                ],
                "borderWidth":1,
                type:"bar",
            },
            {
                "label":"Line doanh số",
                "data":$arrTotalsAmount_year,
                "fill":false,
                "backgroundColor":"red",
                "borderColor":"red",
                "borderWidth":1,
                type:"line",
            }
        ]
    },
    options: {
        responsive: true,
        legend: {
          display: true,
        },
        layout: {
            padding: {
                left: 10,
                right: 10,
                top: 0,
                bottom: 0
            }
        },

        tooltips: {
            callbacks: {
                label: function(tooltipItem, data) {
                    var label = data.datasets[tooltipItem.datasetIndex].label || '';

                    if (label) {
                        label += ': ';
                    }
                    label += format_number(tooltipItem.yLabel);
                    return label;
                }
            }
        },
        scales: {
            yAxes: [
            {
              position: "left",
              // id: "y-axis-amount",
              ticks: {
                    beginAtZero:true,
                    callback: function(label, index, labels) {
                        return format_number(label);
                    },
                },
                scaleLabel: {
                     display: true,
                     labelString: 'VNĐ',
                     fontSize: 15
                  }
            }
            ]
        },
    },



});
});
</script>
HTML;

                    $column->append($html_monthly);
                });
            });

            $users   = User::select('id', 'email', 'name', 'phone', 'created_at')->orderBy('id', 'desc')->limit(10)->get()->toArray();
            $headers = ['Id', 'Email', 'Name', 'Phone', 'Ngày đăng ký'];
            $rows    = $users;
            $content->row((new Box('Khách hàng mới', new Table($headers, $rows)))->style('info')->solid());
        });
    }
}
