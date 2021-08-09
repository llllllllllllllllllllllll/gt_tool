<!DOCTYPE html>

<html>

<head>
  <title>坎公骑冠剑7月第五期會戰</title>
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
  style="height: auto; min-height: 100%; font:14px Helvetica Neue,Helvetica,PingFang SC,Tahoma,Arial,sans-serif;">
  <div class="wrapper" style="height: auto; min-height: 100%;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h4 class="box-title">本日出刀数量 <span id="dao_curr"></span> / 90 还剩 <span id="dao_left"></span> 刀</h4>
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
                  <div class="col-md-3 col-sm-6 col-12">
                    <div class="info-box" id="boss_1">
                      <!-- <span class="info-box-icon"><i class="far fa-bookmark"></i></span> -->
        
                      <div class="info-box-content">
                        <span class="info-box-text" id="boss_name_1"></span>
                        <span class="info-box-number" id="boss_hp_1"></span>
        
                        <div class="progress">
                          <div class="progress-bar" id="boss_pct_1" style="width: 100%"></div>
                        </div>
                        <!-- <span class="progress-description">
                          70% Increase in 30 Days
                        </span> -->
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
                        <!-- <span class="progress-description">
                          70% Increase in 30 Days
                        </span> -->
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
                        <!-- <span class="progress-description">
                          70% Increase in 30 Days
                        </span> -->
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
                        <!-- <span class="progress-description">
                          70% Increase in 30 Days
                        </span> -->
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
                    <div class="tab-pane fade" id="tansuo" role="tabpanel" aria-labelledby="vert-tabs-tansuo-tab">
                      <div>
                        <span>设计图</span>
                        <img src="/static/img/gt/tansuo_shejitu_chanchu.jpg" />
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
  <script>
    boss = ["熔岩史莱姆国王", "流沙怪", "妖精", "雪人将军盖斯特"];
    users = ["Doge", "Draketony", "风中的残痕", "老王", "夏姆", "egpk", "简娜", "暮鼓", "三笠阿克曼", "ROMANTIC", "Tarxeyfphe", "期待地搓手手", "御风洛溪", "slmint", "ZBY", "scuzjc", "雾里望白莲", "沈戴培", "OrYs", "淦饭王", "女施主借个吻", "losttime", "pixel", "谏山澪", "zzl", "啊咧", "大可大可", "七天限定", "看见妹子脸会红", "ypk25"];
    boss_color = {
      "熔岩史莱姆国王": "vtd-green",
      "流沙怪": "vtd-purple",
      "妖精": "vtd-pink",
      "雪人将军盖斯特": "vtd-azure",
    };

    $("#lastUpdate").html(new Date($("#lastUpdate").html() * 1000 + 8 * 3600 * 1000).toISOString().slice(0, 19).replace("T", " "));

    filterDate = {{.Date }};
    _date = {};
    // 定制表记录
    sp_log = {};
    // 每日伤害（公会）
    tongji_gh = {};

    filterDate.forEach(function (v) {
      _date[v] = { "timestamp": new Date(v).valueOf(), "str": v };
      sp_log[v] = [];
      $('#sel_sp').append(new Option(v, v));
    });
    today = _date[filterDate[0]];
    $("#sel_sp").val(filterDate[0]);

    round2Lv = {
      "1": { "lv": "50", "hp": 1080000 },
      "2": { "lv": "50", "hp": 1080000 },
      "3": { "lv": "55", "hp": 1237500 },
      "4": { "lv": "55", "hp": 1237500 },
      "5": { "lv": "60", "hp": 1500000 },
      "6": { "lv": "60", "hp": 1500000 },
      "7": { "lv": "65", "hp": 2025000 },
      "8": { "lv": "66", "hp": 2640000 },
      "9": { "lv": "67", "hp": 3440000 },
      "10": { "lv": "68", "hp": 4500000 },
      "11": { "lv": "69", "hp": 5765625 },
      "12": { "lv": "70", "hp": 7500000 },
      "13": { "lv": "71", "hp": 9750000 },
      "14": { "lv": "72", "hp": 12000000 },
      "15": { "lv": "73", "hp": 16650000 },
      "16": { "lv": "74", "hp": 24000000 },
      "17": { "lv": "75", "hp": 35000000 },
      "18": { "lv": "76", "hp": 50000000 },
      "19": { "lv": "77", "hp": 72000000 },
      "20": { "lv": "78", "hp": 100000000 },
      "21": { "lv": "79", "hp": 140000000 },
      "22": { "lv": "80", "hp": 200000000 },
      "23": { "lv": "80", "hp": 200000000 },
      "24": { "lv": "80", "hp": 200000000 },
    };
    lv = [50, 55, 60, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80];
    gLog = {};

    $.ajax({
      async: false,
      url: "/log/guild_log",
      data: { "u": {{.Uid }} },
      success: function (data) {
        gLog = data;
      }
    });

    bLog = [];
    mt = [];
    $.ajax({
      async: false,
      url: "/log/battle_log",
      data: { "u": {{.Uid }} },
      success: function (data) {
        let dao_curr = 0;
        data.forEach(function (v) {
          bLog = data.concat();
          let t = (v.log_time + 8 * 3600) * 1000;
          for (let i = 0; i < filterDate.length; i++) {
            if (t >= today.timestamp) {
              dao_curr++;
            }
            if (t >= _date[filterDate[i]].timestamp) {
              sp_log[filterDate[i]].push(v);
              break;
            }
          }
        });
        $("#dao_curr").html(dao_curr);
        $("#dao_left").html(90 - dao_curr);
        mt = data;
        sp();

      }
    });






    $('#table').bootstrapTable({
      locale: "zh-CN",
      data: mt,
      // onLoadSuccess: function(data) {
      //   // today = new Date(new Date((+new Date() + 8 * 3600 * 1000)).toISOString().slice(0, 10).replace("T", " ")).valueOf();

      //   var dao_curr = 0;
      //   data.forEach(function (v) {
      //     bLog = data.concat();
      //     // if ((v.log_time + 8 * 3600) * 1000 >= today) {
      //     //   dao_curr++;
      //     //   sp_log.push(v);
      //     // }
      //     let t = (v.log_time + 8 * 3600) * 1000;
      //     for (let i = 0; i < filterDate.length; i++) {
      //       if (t >= today.timestamp) {
      //         dao_curr++;
      //       }
      //       if (t >= _date[filterDate[i]].timestamp) {
      //         sp_log[filterDate[i]].push(v);
      //         break;
      //       }
      //     }
      //   });
      //   $("#dao_curr").html(dao_curr);
      //   $("#dao_left").html(90 - dao_curr);
      //   sp();
      // },
      onDblClickCell: function (field, value, row, $element) {
        if (field == 'damage') {
          $('#table').bootstrapTable('showColumn', 'damage_comma');
          $('#table').bootstrapTable('hideColumn', 'damage');
        }
        if (field == 'damage_comma') {
          $('#table').bootstrapTable('showColumn', 'damage');
          $('#table').bootstrapTable('hideColumn', 'damage_comma');
        }
        if (field == 'boss_hp') {
          $('#table').bootstrapTable('showColumn', 'boss_hp_comma');
          $('#table').bootstrapTable('hideColumn', 'boss_hp');
        }
        if (field == 'boss_hp_comma') {
          $('#table').bootstrapTable('showColumn', 'boss_hp');
          $('#table').bootstrapTable('hideColumn', 'boss_hp_comma');
        }
      },
      sortable: true,
      buttonsClass: "primary",
      buttonsPrefix: "btn-sm btn",
      filterControl: true,
      // url: '/log/battle_log',
      pagination: true,
      pageSize: 90,
      pageList: [90, 30],
      paginationVAlign: "both",
      search: false,
      columns: [{
        field: 'round',
        title: '轮次',
        sortable: true,
        formatter: function (value, row) {
          return gLog[row.log_time].round;
        }
      }, {
        field: 'log_time',
        title: '出刀时间',
        formatter: function (value) {
          return new Date((value + 8 * 3600) * 1000).toISOString().slice(0, 19).replace("T", " ")
        },
        sortable: true,
        filterControl: "select",
        filterData: "var:filterDate",
        filterOrderBy: "asc",
      }, {
        field: 'user_name',
        title: '成员名称',
        sortable: true,
        filterControl: "select",
        filterData: "var:users",
      }, {
        field: 'boss.name',
        title: '首领名称',
        sortable: true,
        filterControl: "select",
        filterData: "var:boss",
      }, {
        field: 'boss.level',
        title: '首领等级',
        sortable: true,
        filterControl: "select",
        filterData: "var:lv",
      }, {
        field: 'damage',
        title: '造成伤害',
        sortable: true,
      }, {
        field: 'damage_comma',
        title: '造成伤害',
        visible: false,
        sortable: true,
        formatter: function (value, row) {
          return parseInt(row['damage']).toLocaleString();
        },
        sorter: function (a, b, rowA, rowB) {
          return rowA.damage - rowB.damage
        }
      }, {
        field: 'role',
        title: '阵容',
        formatter: function (value, row) {
          let roles = "";
          let teamDps = 0;
          let teamTou = 0;
          let teamRec = 0;
          let Dps = "";
          let Tou = "";
          try {


            gLog[row.log_time].role_list.forEach(function (v) {
              if (!v.hasOwnProperty('dps')) {
                v.dps = 0;
              }
              if (!v.hasOwnProperty('toughness')) {
                v.toughness = 0;
              }
              if (!v.hasOwnProperty('recovery')) {
                v.recovery = 0;
              }
              roles += '<img class="vimg" src="' + v.icon + '" />';
              teamDps += v.dps;
              teamTou += v.toughness;
              teamRec += v.recovery;
              Dps += '<span class="vspan">' + v.dps.toLocaleString() + '</span>';
              Tou += '<span class="vspan">' + v.toughness.toLocaleString() + '</span>';
            });
          }
          catch (e) {
            console.error(e);
            console.error(gLog[row.log_time]);
          }
          roles += "<br/>秒伤: " + Dps;
          roles += "<br/>韧性: " + Tou;
          roles += "<br/>队伍秒伤: " + teamDps.toLocaleString();
          roles += "<br/>队伍韧性: " + teamTou.toLocaleString();

          return roles
        }
      }, {
        field: 'boss_hp',
        title: '剩余血量',
        visible: false,
        formatter: function (value, row) {
          return gLog[row.log_time].boss.hp;
        }
      }, {
        field: 'boss_hp_comma',
        title: '剩余血量',
        visible: true,
        formatter: function (value, row) {
          return parseInt(gLog[row.log_time].boss.hp).toLocaleString();
        }
      }]
    });

    function spLogCalc(day) {
      //定制 - 重排顺序

      let data = {};
      users.forEach(function (row, index) {
        data[row] = {
          "index": index + 1,
          "user_name": row,
          "damage": 0,
          "damage_list": [],
          "hit": 0,
          "hit1_color": "",
          "hit2_color": "",
          "hit3_color": "",
          "hit1": "",
          "hit2": "",
          "hit3": "",
        };

      });
      sp_log[day].forEach(function (row) {
        if (!row.hasOwnProperty('damage')) {
          data[row.user_name].damage += 0;
        } else {
          data[row.user_name].damage += row.damage;
        }

        data[row.user_name].damage_list.push(row);

      });
      users.forEach(function (row, index) {
        data[row].damage_list.sort(function (a, b) {
          return a.log_time - b.log_time;
        });
        if (data[row].damage_list.length == 0) {
          return;
        }
        if (data[row].damage_list.length >= 1) {
          data[row].hit = 1;
          data[row].hit1 = data[row].damage_list[0].boss.name;
          data[row].hit1_color = boss_color[data[row].damage_list[0].boss.name];
        }
        if (data[row].damage_list.length >= 2) {
          data[row].hit = 2;
          data[row].hit2 = data[row].damage_list[1].boss.name;
          data[row].hit2_color = boss_color[data[row].damage_list[1].boss.name];
        }
        if (data[row].damage_list.length == 3) {
          data[row].hit = 3;
          data[row].hit3 = data[row].damage_list[2].boss.name;
          data[row].hit3_color = boss_color[data[row].damage_list[2].boss.name];
        }
      });



      return data
    }



    function sp() {



      let data = spLogCalc(today.str);

      $('#tbl_sp').bootstrapTable({
        onDblClickCell: function (field, value, row, $element) {
          if (field == 'damage') {
            $('#tbl_sp').bootstrapTable('showColumn', 'damage_comma');
            $('#tbl_sp').bootstrapTable('hideColumn', 'damage');
          }
          if (field == 'damage_comma') {
            $('#tbl_sp').bootstrapTable('showColumn', 'damage');
            $('#tbl_sp').bootstrapTable('hideColumn', 'damage_comma');
          }
        },
        toolbar: "#tbl_sp_toolbar",
        locale: "zh-CN",
        sortable: true,
        filterControl: true,
        search: false,
        showColumns: true,
        data: Object.values(data),
        columns: [{
          field: 'index',
          title: '上期排名',
          sortable: true,
        }, {
          field: 'index_auto',
          title: '伤害排名',
          formatter: function (value, row, index) {
            return index + 1;
          },
        }, {
          field: 'user_name',
          title: '成员名称',
          sortable: true,
          filterControl: "select",
          filterData: "var:users",
        }, {
          field: 'damage',
          title: '造成伤害',
          sortable: true,
        }, {
          field: 'damage_comma',
          title: '造成伤害',
          visible: false,
          sortable: true,
          formatter: function (value, row) {
            return parseInt(row['damage']).toLocaleString();
          },
          sorter: function (a, b, rowA, rowB) {
            return rowA.damage - rowB.damage
          }
        }, {
          field: 'hit',
          title: '出刀数量',
          sortable: true,
          filterControl: "select",
        }, {
          field: 'hit1_color',
          title: '',
          formatter: function () { return "" },
          cellStyle: function (value, row, index, field) {
            return { classes: value , css: { width : "40px"} }
          }
        }, {
          field: 'hit2_color',
          title: '',
          formatter: function () { return "" },
          cellStyle: function (value, row, index, field) {
            return { classes: value , css: { width : "40px"}}
          }
        }, {
          field: 'hit3_color',
          title: '',
          formatter: function () { return "" },
          cellStyle: function (value, row, index, field) {
            return { classes: value, css: { width : "40px"} }
          }
        }, {
          field: 'hit1',
          title: '第一刀',
        }, {
          field: 'hit2',
          title: '第二刀',
        }, {
          field: 'hit3',
          title: '第三刀',
        }
        ]
      });

      $("#sel_sp").change(function () {
        $('#tbl_sp').bootstrapTable('load', Object.values(spLogCalc($(this).val())));
      });

      // z-score
      bLog.reverse();

      for (const [k, v] of Object.entries(round2Lv)) {
        round2Lv[k].boss = {
          "熔岩史莱姆国王": v.hp,
          "流沙怪": v.hp,
          "妖精": v.hp,
          "雪人将军盖斯特": v.hp,
        }
      }
      round = 1;
      bLog.forEach(function (b, index) {
        if (!b.hasOwnProperty('damage')) {
          b.damage = 0;
        }
        let hp = round2Lv[round].boss[b.boss.name] - b.damage;
        b.round = gLog[b.log_time].round = round;
        b.boss.hp = gLog[b.log_time].boss.hp = round2Lv[round].boss[b.boss.name] = hp;
        if (hp <= 0) {
          b.isKill = gLog[b.log_time].isKill = 1;
          b.boss.hp = gLog[b.log_time].boss.hp = round2Lv[round].boss[b.boss.name] = 0;
        }

        roundhp = function () { let hp = 0; Object.values(round2Lv[round].boss).forEach(function (v) { hp += v }); return hp }();
        // if (round == 13 ) {
        //   console.log(b.boss.name + " "+ b.log_time);
        //   console.log("index:" +index+" round:" + round + "对 "+ b.boss.name +" 输出:" + b.damage + " 剩余 hp:" + roundhp);
        // }

        // tongji_gh row {date dao_count round total avg avg20 boss1{dao,dmg} ... boss4}
        let log_date = new Date((b.log_time + 8 * 3600) * 1000).toISOString().slice(0, 10).replace("T", " ")
        if (!tongji_gh.hasOwnProperty(log_date)) {
          tongji_gh[log_date] = {
            "date": log_date,
            "dao_count": 0,
            "total": 0,
            "round": 0,
            "avg": 0,
            "avg20": 0,
            "dao_dmg": [],
          }
          boss.forEach(function (b) {
            tongji_gh[log_date][b] = { "dao": 0, "dmg": 0 };
          });
        }
        let obj = tongji_gh[log_date];
        obj.dao_dmg.push(b.damage);
        obj.dao_count++;
        obj.total += b.damage;
        obj[b.boss.name].dao++
        obj[b.boss.name].dmg += b.damage;
        if (round > obj.round) {
          obj.round = round;
        }

        if (roundhp == 0) {
          round++;
        }
      });

      Object.values(tongji_gh).forEach(function (v) {
        v.avg = (v.total / v.dao_count).toFixed(0);
      });

      boss.forEach(function(v,i){
        $("#boss_name_"+(i+1)).text(v);
        $("#boss_hp_"+(i+1)).text( parseInt(round2Lv[round].boss[v]).toLocaleString() );
        pct = ((round2Lv[round].boss[v] / round2Lv[round].hp) * 100).toFixed(0);
        $("#boss_pct_"+(i+1)).css({wdith: pct+"%"});
        $("#boss_"+(i+1)).addClass(boss_color[v]);
      });



    }

    uLog = [];
    chudao = [];
    // 每日伤害（玩家）
    tongji = [];

    // 出刀表列生成
    uLog_col = [{
      field: 'user_name',
      title: '成员名称',
      sortable: true,
      filterControl: "select",
      filterData: "var:users",
    },
    {
      field: 'total',
      title: '总出刀',
      sortable: true,
    }];
    // 每日伤害（玩家） - 统计表列生成
    stat_col = [{
      field: 'user_name',
      title: '成员名称',
      sortable: true,
      filterControl: "select",
      filterData: "var:users",
    },
    {
      field: 'total',
      title: '伤害',
      sortable: true,
    },
    {
      field: 'total_comma',
      title: '伤害',
      sortable: true,
      visible: false,
      formatter: function (value, row, index, field) {
        return parseInt(row[field.split("_")[0]]).toLocaleString();
      },
      sorter: function (a, b, rowA, rowB) {
        console.log(rowA);
        console.log(rowB);
        return rowA['total'] - rowB['total']
      }
    }];
    // 每日伤害（公会） - 统计表列生成
    gh_stat_col = [{
      field: 'date',
      title: '日期',
      sortable: true,
    }, {
      field: 'dao_count',
      title: '有效刀数',
      sortable: true,
    }, {
      field: 'round',
      title: '轮次',
      sortable: true,
    }, {
      field: 'total',
      title: '总伤害',
      sortable: true,
      formatter: function (value, row, index, field) {
        return parseInt(value).toLocaleString();
      },
      sorter: function (a, b, rowA, rowB) {
        let aa = a.replace(",", "");
        let bb = b.replace(",", "");
        return aa - bb;
      }
    }, {
      field: 'avg',
      title: '平均伤害',
      sortable: true,
      formatter: function (value, row, index, field) {
        return parseInt(value).toLocaleString();
      },
      sorter: function (a, b, rowA, rowB) {
        let aa = a.replace(",", "");
        let bb = b.replace(",", "");
        return aa - bb;
      }
    }, {
      field: 'avg20',
      title: '平均伤害（20%）',
      sortable: true,
    }]
    // 每日伤害（公会） - BOSS 列
    boss.forEach(function (b) {
      gh_stat_col.push({
        field: b,
        title: b,
        sortable: true,
        formatter: function (value, row, index, field) {
          return "[" + row[field].dao + "] " + parseInt(row[field].dmg).toLocaleString();
        },
        sorter: function (a, b, rowA, rowB) {
          let aa = a.split("]")[1].replace(",", "");
          let bb = b.split("]")[1].replace(",", "");
          return aa - bb;
        }
      })
    });
    // 日期列生成 [2xxx-xx-xx, 2xxx-xx-xx, ...]
    filterDate.forEach(function (date) {
      uLog_col.push({
        field: date,
        title: date,
        sortable: true,
      });
      stat_col.push({
        field: date,
        title: date,
        sortable: true,
      });
      stat_col.push({
        field: date + "_comma",
        title: date,
        sortable: true,
        visible: false,
        formatter: function (value, row, index, field) {
          if (!row.hasOwnProperty(field.split("_")[0])) {
            return 0;
          }
          return parseInt(row[field.split("_")[0]]).toLocaleString();
        },
        sorter: function (a, b, rowA, rowB) {
          return rowA.damage - rowB.damage
        }
      });
    })


    $.ajax({
      async: false,
      url: "/log/user_log",
      data: { "u": {{.Uid }} },
      success: function (data) {
        uLog = data;
        delete uLog["西瓜君"];
        Object.keys(uLog).forEach(function (user) {
          let row = uLog[user].stat.chu_dao;
          row.total = uLog[user].stat.chu_dao_total;
          row.user_name = user;
          chudao.push(row);

          let _tongji_row = uLog[user].stat.dao_dmg;
          _tongji_row.total = uLog[user].stat.dao_dmg_total;
          _tongji_row.user_name = user;
          tongji.push(_tongji_row);
        });
      }
    });

    $('#tbl_uLog').bootstrapTable({
      locale: "zh-CN",
      data: chudao,
      search: false,
      sortable: true,
      columns: uLog_col,
      undefinedText: "0",
    });

    tbl_total_toggle_comma = [];

    $('#tbl_total').bootstrapTable({
      onDblClickCell: function (field, value, row, $element) {
        tbl_total_toggle_comma = Object.values($('#tbl_total').bootstrapTable('getHiddenColumns')).map(item => item.field);
        if (field != 'user_name') {
          $('#tbl_total').bootstrapTable('hideAllColumns');
          $('#tbl_total').bootstrapTable('showColumn', 'user_name');
          if (tbl_total_toggle_comma[0].endsWith("_comma")) {
            tbl_total_toggle_comma.forEach(function (name) {
              $('#tbl_total').bootstrapTable('hideColumn', name.split("_")[0]);
              $('#tbl_total').bootstrapTable('showColumn', name);
            });
          } else {
            tbl_total_toggle_comma.forEach(function (name) {
              $('#tbl_total').bootstrapTable('showColumn', name);
              $('#tbl_total').bootstrapTable('hideColumn', name + "_comma");
            });
          }

        }
      },
      locale: "zh-CN",
      data: tongji,
      search: false,
      sortable: true,
      columns: stat_col,
      undefinedText: "0",
    });

    $('#tbl_total_guild').bootstrapTable({
      locale: "zh-CN",
      data: Object.values(tongji_gh).sort().reverse(),
      search: false,
      sortable: true,
      columns: gh_stat_col,
      undefinedText: "0",
    });


  </script>
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
成员名称
首领名称
首领等级
造成伤害
阵容 -->