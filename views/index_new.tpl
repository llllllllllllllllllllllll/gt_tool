<!DOCTYPE html>

<html>

<head>
  <title>守望者传说</title>
  <meta name="referrer" content="no-referrer" />
  <link rel="stylesheet" href="/static/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/css/fontawesome/all.css">
  <link rel="stylesheet" href="/static/css/adminlte.min.css">
  <link rel="stylesheet" href="/static/css/_all-skins.min.css">
  <link rel="stylesheet" href="/static/css/bootstrap-table.min.css">
  <link rel="stylesheet" href="/static/css/extensions/bootstrap-table-filter-control.css">
  <link rel="stylesheet" href="/static/css/extensions/multiple-select.min.css">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <style>
    .vtable td {
      padding: 0.1rem;
      text-align: right;
    }

    .vimg {
      width: 64px;
      height: 64px;
      padding: 1px;
      border: solid 1px #c7c7c7;
      box-shadow: 0 0 3px #ffffff;
    }

    .vspan {
      padding: 0 6px;
      font-size: 12px;
      text-align: center;
    }

    .vtd-green {
      background-color: #ACDB7E;
    }

    .vtd-purple {
      background-color: #8b7be8;
    }

    .vtd-pink {
      background-color: #e99899;
    }

    .vtd-azure {
      background-color: #85D4E6;
    }
  </style>

<body class="sidebar-mini sidebar-closed sidebar-collapse"
  style="height: auto; min-height: 100%; font:15px Helvetica Neue,Helvetica,PingFang SC,Tahoma,Arial,sans-serif;">
  <div class="wrapper" style="height: auto; min-height: 100%;">
    <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
      <div class="container">


        <div class="collapse navbar-collapse order-3" id="navbarCollapse">
          <!-- Left navbar links -->
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                class="nav-link dropdown-toggle">选择数据</a>
              <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow"
                style="left: 0px; right: inherit;">
                <li><a href="#" class="dropdown-item" data-s="6">第6期</a></li>
                <li><a href="#" class="dropdown-item" data-s="5">第5期</a></li>

              </ul>
            </li>
          </ul>

        </div>

      </div>
    </nav>
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h4 id="dao_status_now" class="box-title">第{{.sN}}期 本日出刀数量 <span id="dao_curr"></span> / 90 还剩 <span
                id="dao_left"></span> 刀
            </h4>
            <h4 id="dao_status_history" class="box-title d-none">第{{.sN}}期 本期有效刀数量 / 最大刀数量： <span
                id="dao_his_curr"></span> / <span id="dao_his_max"></span> ，无效 <span id="dao_his_left"></span> 刀
            </h4>
          </div>
          <div class="col-sm-6">
            <hj>
              本工具数据来源 bigfun
              拉取时间： {{.lastFetch}} 最新数据：<span id="lastUpdate">{{.lastUpdate}}</span>
            </hj>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">首领状态(测试)</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-3 col-sm-6 col-12"><span id="boss_status"></span></div>

                </div>
                <div class="row">
                  <div class="col-md-3 col-sm-6 col-12">
                    <div class="info-box" id="boss_1">
                      <!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->

                      <div class="info-box-content">
                        <span class="info-box-text" id="boss_name_1"></span>
                        <span class="info-box-number" id="boss_hp_1"></span>

                        <div class="progress">
                          <div class="progress-bar" id="boss_pct_1" style="width: 100%"></div>
                        </div>
                        <!-- <span class="progress-description" id="boss_attr_1"></span> -->
                      </div>
                      <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6 col-12">
                    <div class="info-box" id="boss_2">
                      <!-- <span class="info-box-icon"><i class="far fa-thumbs-up"></i></span> -->

                      <div class="info-box-content">
                        <span class="info-box-text" id="boss_name_2"></span>
                        <span class="info-box-number" id="boss_hp_2"></span>

                        <div class="progress">
                          <div class="progress-bar" id="boss_pct_2" style="width: 100%"></div>
                        </div>
                        <!-- <span class="progress-description" id="boss_attr_2"></span> -->
                      </div>
                      <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6 col-12">
                    <div class="info-box" id="boss_3">
                      <!-- <span class="info-box-icon"><i class="far fa-calendar-alt"></i></span> -->

                      <div class="info-box-content">
                        <span class="info-box-text" id="boss_name_3"></span>
                        <span class="info-box-number" id="boss_hp_3">0</span>

                        <div class="progress">
                          <div class="progress-bar" id="boss_pct_3" style="width: 100%"></div>
                        </div>
                        <!-- <span class="progress-description" id="boss_attr_3"></span> -->
                      </div>
                      <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-3 col-sm-6 col-12">
                    <div class="info-box" id="boss_4">
                      <!-- <span class="info-box-icon"><i class="fas fa-comments"></i></span> -->

                      <div class="info-box-content">
                        <span class="info-box-text" id="boss_name_4"></span>
                        <span class="info-box-number" id="boss_hp_4">0</span>

                        <div class="progress">
                          <div class="progress-bar" id="boss_pct_4" style="width: 100%"></div>
                        </div>
                        <span class="progress-description" id="boss_attr_4"></span>
                      </div>
                      <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                  </div>
                  <!-- /.col -->
                </div>




              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.info-box -->
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary card-outline card-outline-tabs">
              <div class="card-header p-0 border-bottom-0">
                <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="vert-tabs-dao-list-tab" data-toggle="pill" href="#list" role="tab"
                      aria-controls="vert-tabs-dao-list" aria-selected="true">战斗记录</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-dao-cd-tab" data-toggle="pill" href="#cd" role="tab"
                      aria-controls="vert-tabs-dao-cd" aria-selected="false">会战考勤</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-sp-tab" data-toggle="pill" href="#sp" role="tab"
                      aria-controls="vert-tabs-sp" aria-selected="false">每日数据</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-total-tab" data-toggle="pill" href="#total" role="tab"
                      aria-controls="vert-tabs-total" aria-selected="false">每日伤害（玩家）</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-total-guild-tab" data-toggle="pill" href="#total_guild" role="tab"
                      aria-controls="vert-tabs-total-guild" aria-selected="false">每日伤害（公会）</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-chart" data-toggle="pill" href="#chart" role="tab"
                      aria-controls="vert-tabs-chart" aria-selected="false">图表分析</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="vert-tabs-tansuo-tab" data-toggle="pill" href="#tansuo" role="tab"
                      aria-controls="vert-tabs-tansuo" aria-selected="false">探索工坊</a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="col-md-12">
                  <div class="tab-content" id="vert-tabs-tabContent">
                    <div class="tab-pane text-left fade show active" id="list" role="tabpanel"
                      aria-labelledby="vert-tabs-dao-list-tab">
                      <table id="table"></table>
                    </div>
                    <div class="tab-pane fade" id="cd" role="tabpanel" aria-labelledby="vert-tabs-dao-cd-tab">
                      <!-- <p class="col-md-1">
                            <button type="button" id="btn_cuidao" class="btn btn-block btn-default btn-xs">复制催刀信息</button>
                          </p>
                            <p id="cuidao"></p>
                      <br> -->
                      <table id="tbl_uLog"></table>
                    </div>
                    <div class="tab-pane fade" id="sp" role="tabpanel" aria-labelledby="vert-tabs-sp-tab">
                      <div id="tbl_sp_toolbar">
                        选择日期：<select id="sel_sp" class="text-md"></select>
                      </div>
                      <table id="tbl_sp"></table>
                    </div>
                    <div class="tab-pane fade" id="total" role="tabpanel" aria-labelledby="vert-tabs-total-tab">
                      <table id="tbl_total"></table>
                    </div>
                    <div class="tab-pane fade" id="total_guild" role="tabpanel"
                      aria-labelledby="vert-tabs-total-guild-tab">
                      <table id="tbl_total_guild"></table>
                    </div>
                    <div class="tab-pane fade" id="chart" role="tabpanel" aria-labelledby="vert-tabs-chart">
                      <div class="row">
                        选择成员：<select id="sel_stat_users" class="text-md"></select>
                      </div>
                      <div class="row">
                        <div class="col-sm-6 col-12">
                          <div class="card">
                            <div class="card-header">
                              <h3 class="card-title">不同 boss 出刀数</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <div id="chart_boss_dao" style="width: 300px;height:400px;"></div>
                            </div>
                            <!-- /.card-body -->
                          </div>
                        </div>
                        <div class="col-sm-6 col-12">
                          <div class="card">
                            <div class="card-header">
                              <h3 class="card-title">不同 boss 平均刀伤</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <div id="chart_boss_avg_damage" style="width: 300px;height:400px;"></div>
                            </div>
                            <!-- /.card-body -->
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-12 col-24">
                          <div class="card">
                            <div class="card-header">
                              <h3 class="card-title">输出</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <div id="chart_daily_dmg" style="width: 1000px;height:400px;"></div>
                            </div>
                            <!-- /.card-body -->
                          </div>
                        </div>
                      </div>

                    </div>
                    <div class="tab-pane fade" id="tansuo" role="tabpanel" aria-labelledby="vert-tabs-tansuo-tab">
                      <div>
                        <span>设计图</span>
                        <img class="img-fluid mb-2" src="/static/img/gt/tansuo_shejitu_chanchu.jpg" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  </div>

  <script src="/static/js/jquery-3.6.0.min.js"></script>
  <script src="/static/js/popper.min.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <script src="/static/js/adminlte.min.js"></script>
  <script src="/static/js/echarts.min.js"></script>
  <script src="/static/js/bootstrap-table.min.js"></script>
  <script src="/static/js/bootstrap-table-locale-all.min.js"></script>
  <script src="/static/js/extensions/bootstrap-table-filter-control.min.js"></script>
  <script src="/static/js/extensions/multiple-select.min.js"></script>
  <script src="/static/js/settings.js"></script>

  <script>
    season = new URL(location.href).searchParams.get("s");
    queryData = { "u": {{.Uid }} , "s": season};
    filterDate = {{.Date }};
    isHistory = {{.isHistory }};
    shortfilterDate = filterDate.join(',').replaceAll(filterDate[0].substring(0,5),"").split(',');
  </script>
  <script src="/static/js/main.js"></script>
</body>

</html>
<!-- damage
boss_id
boss_name
round
log_time
is_kill
user_id
user_name

出刀时间
成员
首领名称
首领等级
造成伤害
阵容 -->