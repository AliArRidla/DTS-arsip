<?php 
$page_id = null;
$comp_model = new SharedController;
$current_page = $this->set_current_page_link();
?>
<div>
    <div  class="p-3 mb-3" style="background-color: rgba(37, 60, 74, 1);" >
        <div class="container">
            <div class="row ">
              
                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                    <?php $rec_count = $comp_model->getcount_pengguna();  ?>
                    <div class="card ">
                        <!-- <div class="card-icon bg-primary">
                        <i class="far fa-user"></i>
                        </div> -->
                        <div class="card-wrap">
                        <div class="card-header">
                            <h4>Jumlah Pengguna</h4>
                        </div>
                        <div class="card-body">                     
                        <h4 class="value"><strong><?php echo $rec_count; ?></strong></h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                    <?php $rec_count = $comp_model->getcount_jumlahadmin();  ?>
                    <div class="card ">
                        <!-- <div class="card-icon bg-primary">
                        <i class="far fa-user"></i>
                        </div> -->
                        <div class="card-wrap">
                        <div class="card-header">
                            <h4>Jumlah Admin</h4>
                        </div>
                        <div class="card-body">                     
                        <h4 class="value"><strong><?php echo $rec_count; ?></strong></h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                    <?php $rec_count = $comp_model->getcount_jumlahuser();  ?>
                    <div class="card">
                        <!-- <div class="card-icon bg-primary">
                        <i class="far fa-user"></i>
                        </div> -->
                        <div class="card-wrap">
                        <div class="card-header">
                            <h4>Jumlah User</h4>
                        </div>
                        <div class="card-body">                     
                        <h4 class="value"><strong><?php echo $rec_count; ?></strong></h4>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                    <?php $rec_count = $comp_model->getcount_jumlahuser();  ?>
                    <div class="card">
                        <!-- <div class="card-icon bg-primary">
                        <i class="far fa-user"></i>
                        </div> -->
                        <div class="card-wrap">
                        <div class="card-header">
                            <h4>Jumlah Transaksi</h4>
                        </div>
                        <div class="card-body">                     
                        <p class="font-weight-light">masih dalam tahap perbaikan</p>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mt-4 ">
                            <div class="card card-body bg-transparent text-white">
                                <?php 
                                $chartdata = $comp_model->barchart_datasuratmasuk();
                                ?>
                                <div>
                                    <h4>Data Surat Masuk</h4>
                                    <small class="text-muted "></small>
                                </div>
                                <hr />
                                <canvas id="barchart_datasuratmasuk"></canvas>
                                <script>
                                    $(function (){
                                    var chartData = {
                                    labels : <?php echo json_encode($chartdata['labels']); ?>,
                                    datasets : [
                                    {
                                    label: 'Surat Masuk',
                                    backgroundColor:'rgba(255 , 128 , 64, 0.5)',
                                    type:'',
                                    borderWidth:3,
                                    data : <?php echo json_encode($chartdata['datasets'][0]); ?>,
                                    }
                                    ]
                                    }
                                    var ctx = document.getElementById('barchart_datasuratmasuk');
                                    var chart = new Chart(ctx, {
                                    type:'bar',
                                    data: chartData,
                                    options: {
                                    scaleStartValue: 0,
                                    responsive: true,
                                    scales: {
                                    xAxes: [{
                                    ticks:{display: true},
                                    gridLines:{display: true},
                                    categoryPercentage: 1.0,
                                    barPercentage: 0.8,
                                    scaleLabel: {
                                    display: true,
                                    labelString: ""
                                    },
                                    }],
                                    yAxes: [{
                                    ticks: {
                                    beginAtZero: true,
                                    display: true
                                    },
                                    scaleLabel: {
                                    display: true,
                                    labelString: ""
                                    }
                                    }]
                                    },
                                    }
                                    ,
                                    })});
                                </script>
                            </div>
                        
                        </div>

                        <div class="col-md-6 mt-4">
                        <div class="card card-body">
                                <?php 
                                $chartdata = $comp_model->barchart_datasuratkeluar();
                                ?>
                                <div>
                                    <h4>Data Surat Keluar</h4>
                                    <small class="text-muted"></small>
                                </div>
                                <hr />
                                <canvas id="barchart_datasuratkeluar"></canvas>
                                <script>
                                    $(function (){
                                    var chartData = {
                                    labels : <?php echo json_encode($chartdata['labels']); ?>,
                                    datasets : [
                                    {
                                    label: 'Surat Keluar',
                                    backgroundColor:'rgba(0 , 128 , 64, 0.5)',
                                    type:'',
                                    borderWidth:3,
                                    data : <?php echo json_encode($chartdata['datasets'][0]); ?>,
                                    }
                                    ]
                                    }
                                    var ctx = document.getElementById('barchart_datasuratkeluar');
                                    var chart = new Chart(ctx, {
                                    type:'bar',
                                    data: chartData,
                                    options: {
                                    scaleStartValue: 0,
                                    responsive: true,
                                    scales: {
                                    xAxes: [{
                                    ticks:{display: true},
                                    gridLines:{display: true},
                                    categoryPercentage: 1.0,
                                    barPercentage: 0.8,
                                    scaleLabel: {
                                    display: true,
                                    labelString: ""
                                    },
                                    }],
                                    yAxes: [{
                                    ticks: {
                                    beginAtZero: true,
                                    display: true
                                    },
                                    scaleLabel: {
                                    display: true,
                                    labelString: ""
                                    }
                                    }]
                                    },
                                    }
                                    ,
                                    })});
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <!-- <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                  <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>Total Admin</h4>
                  </div>
                  <div class="card-body">
                    10
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-danger">
                  <i class="far fa-newspaper"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>News</h4>
                  </div>
                  <div class="card-body">
                    42
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-warning">
                  <i class="far fa-file"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>Reports</h4>
                  </div>
                  <div class="card-body">
                    1,201
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
              <div class="card card-statistic-1">
                <div class="card-icon bg-success">
                  <i class="fas fa-circle"></i>
                </div>
                <div class="card-wrap">
                  <div class="card-header">
                    <h4>Online Users</h4>
                  </div>
                  <div class="card-body">
                    47
                  </div>
                </div>
              </div>
            </div>
          </div> -->


        </div>
    </div>
</div>
