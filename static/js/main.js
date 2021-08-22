$(document).ready(function () {
    $('#dropdownSubMenu1').next(".dropdown-menu").find("a").on("click", function (e) {
        let url = new URL(location.href);
        url.searchParams.set("s", $(this).data("s"));
        location.href = url;
    });
});


_date = {};
// 定制表记录
sp_log = {};
// 每日伤害（公会）
tongji_gh = {};
// boss = ["熔岩史莱姆国王", "流沙怪", "妖精", "雪人将军盖斯特"];
// users = ["Doge", "Draketony", "风中的残痕", "老王", "夏姆", "egpk", "简娜", "暮鼓", "三笠阿克曼", "ROMANTIC", "Tarxeyfphe", "期待地搓手手", "御风洛溪", "slmint", "ZBY", "scuzjc", "雾里望白莲", "沈戴培", "OrYs", "淦饭王", "女施主借个吻", "losttime", "pixel", "谏山澪", "zzl", "啊咧", "大可大可", "七天限定", "看见妹子脸会红", "ypk25"];
// users.push("稀饭鱼子酱");
users = season_settings[season].member;
// boss[name]
//   .dao             被刀数
//   .total_damage    总承受伤害
//   .avg_damage      平均每刀伤害
//   .elem            属性
//   .class           样式class
//   .color           颜色
boss = season_settings[season].boss;
boss_name = [];
for (const key of Object.keys(boss)) {
    boss_name.push(key);
}
$('#sel_stat_users').append(new Option("公会", "guild"));
users.forEach(function (u) {
    $('#sel_stat_users').append(new Option(u, u));
});


chart_boss_dao_options = {
    title: {
        text: '',
        subtext: '',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },
    series: [
        {
            name: '有效刀数',
            type: 'pie',
            radius: '50%',
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            // roseType: 'area',
            label: {
                formatter: '{b}：{c}  {d}%  ',
            },
        }
    ]
};
chart_boss_avg_damage_options = {
    title: {
        text: '',
        subtext: '',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },
    series: [
        {
            name: '平均每刀受到的伤害',
            type: 'pie',
            radius: '50%',
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            // roseType: 'area',
            label: {
                formatter: '{b}：{c}  {d}%  ',
            },
        }
    ]
};
chart_daily_dmg_options = {
    tooltip: {
        trigger: 'axis'
    },
    xAxis: [
        {
            type: 'category',
            data: filterDate,
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '输出',
            // min: 0,
            // max: 8000000,
        }
    ],
    series: [
        {
            name: '造成伤害',
            type: 'bar',
        }
    ]
};

$("#lastUpdate").html(new Date($("#lastUpdate").html() * 1000 + 8 * 3600 * 1000).toISOString().slice(0, 19).replace("T", " "));



filterDate.forEach(function (v) {
    _date[v] = { "timestamp": new Date(v).valueOf(), "str": v };
    sp_log[v] = [];
    $('#sel_sp').append(new Option(v, v));
});
today = _date[filterDate[0]];
$("#sel_sp").val(filterDate[0]);
$("#sel_sp").change();

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
    data: queryData,
    success: function (data) {
        gLog = data;
    }
});

bLog = [];
mt = [];
$.ajax({
    async: false,
    url: "/log/battle_log",
    data: queryData,
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
        if (isHistory == 0) {
            $("#dao_curr").html(dao_curr);
            $("#dao_left").html(90 - dao_curr);
        } else {
            $("#dao_status_now").toggleClass("d-none");;
            $("#dao_status_history").toggleClass("d-none");;
            let max_dao = filterDate.length * 90;
            $("#dao_his_curr").html(dao_curr);
            $("#dao_his_max").html(max_dao);
            $("#dao_his_left").html(max_dao - dao_curr);

        }

        mt = data;
        sp();

    }
});






$('#table').bootstrapTable({
    buttonsClass: "primary",
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
            return new Date((value + 8 * 3600) * 1000).toISOString().slice(5, 19).replace("T", " ")
        },
        sortable: true,
        filterControl: "select",
        filterData: "var:shortfilterDate",
        filterOrderBy: "asc",
    }, {
        field: 'user_name',
        title: '成员',
        sortable: true,
        filterControl: "select",
        filterData: "var:users",
    }, {
        field: 'boss.name',
        title: '首领',
        sortable: true,
        filterControl: "select",
        // filterData: "var:boss",
        filterData: "var:boss_name",
    }, {
        field: 'boss.level',
        title: '首领等级',
        sortable: true,
        filterControl: "select",
        filterData: "var:lv",
        // cellStyle: function (value, row, index, field) {
        //     return { classes: "text-md" }
        // }
    }, {
        field: 'damage',
        title: '造成伤害',
        align: 'right',
        visible: false,
        sortable: true,
        // cellStyle: function (value, row, index, field) {
        //     return { classes: "text-md" }
        // }
    }, {
        field: 'damage_comma',
        title: '造成伤害',
        align: 'right',
        visible: true,
        sortable: true,
        formatter: function (value, row) {
            return parseInt(row['damage']).toLocaleString();
        },
        sorter: function (a, b, rowA, rowB) {
            return rowA.damage - rowB.damage
        },
        // cellStyle: function (value, row, index, field) {
        //     return { classes: "text-md" }
        // }
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
            let _ss = new URL(location.href).searchParams.get("t");
            if (_ss == "1") {
                roles += '<div style="max-width:380px;"><table class="table table-sm vtable table-borderless">';
                roles += '<tr>';
                Dps += '<tr>';
                Tou += '<tr>';
            }
            

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
                    if (_ss == "1") {
                        roles += '<td>';
                        roles += '<img class="vimg" src="' + v.icon + '" />';
                        roles += '</td>';
                    } else {
                        roles += '<img class="vimg" src="' + v.icon + '" />';
                    }
                    
                    teamDps += v.dps;
                    teamTou += v.toughness;
                    teamRec += v.recovery;
                    if (_ss == "1") {
                    Dps += '<td>';
                    // Dps += '<span class="vspan">';
                    Dps += v.dps.toLocaleString() 
                    // Dps += '</span>';
                    Dps += '</td>';
                     Tou += '<td>';
                    //  Tou += '<span  class="vspan">';
                    Tou +=  v.toughness.toLocaleString() ;
                    // Tou += '</span>';
                    Tou += '</td>';
                    } else {
                    // Dps += '<td>';
                    Dps += '<span class="vspan">';
                    Dps += v.dps.toLocaleString() 
                    Dps += '</span>';
                    // Dps += '</td>';
                     // Tou += '<td>';
                     Tou += '<span  class="vspan">';
                    Tou +=  v.toughness.toLocaleString() ;
                    Tou += '</span>';
                    // Tou += '</td>';
                    }

                });
            }
            catch (e) {
                console.error(e);
                console.error(gLog[row.log_time]);
            }
            if (_ss == "1") {
                roles += '<td></td></tr>';
                Dps += '<td style="text-align:left;">秒伤</td></tr>';
                Tou += '<td style="text-align:left;">韧性</td></tr>';
                roles += Dps;
                roles += Tou;
                roles += '<tr><td></td><td></td><td></td><td>' + teamDps.toLocaleString() + '</td><td style="text-align:left;">队伍秒伤</td></tr>';
                roles += '<tr><td></td><td></td><td></td><td>' + teamTou.toLocaleString() + '</td><td style="text-align:left;">队伍韧性</td></tr>';
                roles += "</table></div>";
            } else {
                roles += "<br/>秒伤: " + Dps;
                roles += "<br/>韧性: " + Tou;
                roles += "<br/>队伍秒伤: " + teamDps.toLocaleString();
                roles += "<br/>队伍韧性: " + teamTou.toLocaleString();
            }
          

           
            return roles
        }
    }, {
        field: 'boss_hp',
        title: '剩余血量',
        align: 'right',
        visible: false,
        formatter: function (value, row) {
            return gLog[row.log_time].boss.hp;
        }
    }, {
        field: 'boss_hp_comma',
        title: '剩余血量',
        align: 'right',
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

        if (isHistory == 0) {
            data[row].index = season_settings[season].memberRank.indexOf(row) + 1;
        }
        // formatter: function(value,row,index,field) {
        //     if (isHistory == 0){
        //       return season_settings[season].memberRank.indexOf(row['user_name']);
        //     }
        //     return value
        //   },
        //   sorter: function (a, b, rowA, rowB) {
        //     return a - b
        //   }

    });
    sp_log[day].forEach(function (row) {
        // 自动处理新加入的公会成员
        if (!data.hasOwnProperty(row.user_name)) {
            data[row.user_name] = {
                "index": data.length + 1,
                "user_name": row.user_name,
                "damage": 0,
                "damage_list": [],
                "hit": 0,
                "hit1_color": "",
                "hit2_color": "",
                "hit3_color": "",
                "hit1": "",
                "hit2": "",
                "hit3": "",
            }
        }
        if (!row.hasOwnProperty('damage')) {
            data[row.user_name].damage += 0;
        } else {
            try {
                data[row.user_name].damage += row.damage;
            } catch (e) {
                console.error(e);
            }

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
            data[row].hit1_color = boss[data[row].damage_list[0].boss.name].class;
        }
        if (data[row].damage_list.length >= 2) {
            data[row].hit = 2;
            data[row].hit2 = data[row].damage_list[1].boss.name;
            data[row].hit2_color = boss[data[row].damage_list[1].boss.name].class;
        }
        if (data[row].damage_list.length == 3) {
            data[row].hit = 3;
            data[row].hit3 = data[row].damage_list[2].boss.name;
            data[row].hit3_color = boss[data[row].damage_list[2].boss.name].class;
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
        sortName: 'index',
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
            title: '成员',
            sortable: true,
            filterControl: "select",
            filterData: "var:users",
        }, {
            field: 'damage',
            title: '造成伤害',
            align: 'right',
            sortable: true,
        }, {
            field: 'damage_comma',
            title: '造成伤害',
            align: 'right',
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
                return { classes: value, css: { width: "40px" } }
            }
        }, {
            field: 'hit2_color',
            title: '',
            formatter: function () { return "" },
            cellStyle: function (value, row, index, field) {
                return { classes: value, css: { width: "40px" } }
            }
        }, {
            field: 'hit3_color',
            title: '',
            formatter: function () { return "" },
            cellStyle: function (value, row, index, field) {
                return { classes: value, css: { width: "40px" } }
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

        let b = {};
        Object.keys(boss).forEach(function (_v) {
            b[_v] = v.hp;
        })
        round2Lv[k].boss = b;
        // round2Lv[k].boss = {
        //   "熔岩史莱姆国王": v.hp,
        //   "流沙怪": v.hp,
        //   "妖精": v.hp,
        //   "雪人将军盖斯特": v.hp,
        // }
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

        boss[b.boss.name].elem = b.boss.elemental_type_cn;

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
            Object.keys(boss).forEach(function (b) {
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

        // 不同boss刀数图表 总承受伤害 平均刀伤
        boss[b.boss.name].dao++;
        boss[b.boss.name].total_damage += b.damage;
    });

    $("#sel_stat_users").change(function () {
        let who = $(this).val();
        chart_boss_dao_options.series[0].data = [];
        chart_boss_avg_damage_options.series[0].data = [];
        if (who == "guild") {
            for (const [key, value] of Object.entries(boss)) {
                chart_boss_dao_options.series[0].data.push({ "value": value.dao, "name": key, itemStyle: { color: boss[key].color } });
                chart_boss_avg_damage_options.series[0].data.push({
                    "value": (value.total_damage / value.dao).toFixed(0), "name": key, itemStyle: { color: boss[key].color }
                })
            }
            chart_daily_dmg_options.series[0].data = Object.values(tongji_gh).map(a => a.total);
        } else {
            if (uLog.hasOwnProperty(who)) {
                for (const [key, value] of Object.entries(uLog[who].stat.chu_boss)) {
                    chart_boss_dao_options.series[0].data.push({ "value": value, "name": key, itemStyle: { color: boss[key].color } });
                }
                for (const [key, value] of Object.entries(uLog[who].stat.chu_boss_dmg)) {
                    chart_boss_avg_damage_options.series[0].data.push({
                        "value": (value / uLog[who].stat.chu_boss[key]).toFixed(0), "name": key, itemStyle: { color: boss[key].color }
                    });
                }
                chart_daily_dmg_options.series[0].data = Object.values(uLog[who].stat.dao_dmg).splice(0, filterDate.length);
            }
        }
        document.getElementById('chart_boss_dao').style.width = 50 + "vw";
        document.getElementById('chart_boss_dao').style.height = 50 + "vh";
        chart_boss_dao = echarts.init(document.getElementById('chart_boss_dao'));
        chart_boss_dao.setOption(chart_boss_dao_options);
        chart_boss_dao.resize({
            opts: { width: "auto", height: "auto" }
        });

        document.getElementById('chart_boss_avg_damage').style.width = 50 + "vw";
        document.getElementById('chart_boss_avg_damage').style.height = 50 + "vh";
        chart_boss_avg_damage = echarts.init(document.getElementById('chart_boss_avg_damage'));
        chart_boss_avg_damage.setOption(chart_boss_avg_damage_options);
        chart_boss_avg_damage.resize({
            opts: { width: "auto", height: "auto" }
        });



        document.getElementById('chart_daily_dmg').style.width = 100 + "vw";
        document.getElementById('chart_daily_dmg').style.height = 50 + "vh";
        chart_daily_dmg = echarts.init(document.getElementById('chart_daily_dmg'));
        chart_daily_dmg.setOption(chart_daily_dmg_options, true);
        chart_daily_dmg.resize({
            opts: { width: "auto", height: "auto" }
        });
    });


    $("#sel_stat_users").val("guild");
    $("#sel_stat_users").change();


    window.addEventListener("resize", () => {
        this.chart_boss_dao.resize({
            opts: { width: "auto", height: "auto" }
        });
        this.chart_boss_avg_damage.resize({
            opts: { width: "auto", height: "auto" }
        });
    });






    Object.values(tongji_gh).forEach(function (v) {
        v.avg = (v.total / v.dao_count).toFixed(0);
        // 计算平均值与截尾均值 截尾均值 系数20%
        let num = (v.dao_dmg.length * 0.2).toFixed(2);
        num = num.substr(0, num.length - 3);
        let lastStr = num.charAt(num.length - 3);
        if (lastStr % 2 != 0) {
            num = (num - 0.1).toFixed(0);
        }
        let dao_dmg = v.dao_dmg.concat();
        dao_dmg.sort();
        num = num / 2;
        dao_dmg = dao_dmg.slice(num, dao_dmg.length - num);
        let _avg20_total = 0;
        dao_dmg.forEach(function (v) { _avg20_total += v });
        v.avg20 = (_avg20_total / dao_dmg.length).toFixed(0);

    });


    Object.keys(boss).forEach(function (v, i) {
        $("#boss_name_" + (i + 1)).text(v + "(" + boss[v].elem + ")");
        $("#boss_hp_" + (i + 1)).text(parseInt(round2Lv[round].boss[v]).toLocaleString());
        pct = ((round2Lv[round].boss[v] / round2Lv[round].hp) * 100).toFixed(0);
        $("#boss_pct_" + (i + 1)).css("width", pct + "%");
        $("#boss_" + (i + 1)).addClass(boss[v].class);
    });

    $("#boss_status").text("当前 " + round + " 周目，首领等级 " + round2Lv[round].lv);

}



uLog = [];
chudao = [];
// 每日伤害（玩家）
tongji = [];

// 会战考勤表列生成
uLog_col = [{
    field: 'user_name',
    title: '成员',
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
    title: '成员',
    sortable: true,
    filterControl: "select",
    filterData: "var:users",
},
{
    field: 'total',
    title: '伤害',
    align: 'right',
    sortable: true,
},
{
    field: 'total_comma',
    title: '伤害',
    align: 'right',
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
    align: 'right',
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
    align: 'right',
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
    title: '截尾均值（20%）<small><i class="fas fa-question-circle"></i></small>',
    titleTooltip: "由于均数较易受极端值的影响，因此可以考虑将数据进行行排序后，按照一定比例去掉最两端的数据，只使用中部的数据来求均数。如果截尾均数和原均数相差不大，则说明数据不存在极端值，或者两侧极端值的影响正好抵消；反之，则说明数据中有极端值，此时截尾平均数能更好地反映数据的集中趋势",
    align: 'right',
    sortable: true,
    formatter: function (value, row, index, field) {
        return parseInt(value).toLocaleString();
    },
    sorter: function (a, b, rowA, rowB) {
        let aa = a.replace(",", "");
        let bb = b.replace(",", "");
        return aa - bb;
    }
}]
// 每日伤害（公会） - BOSS 列
Object.keys(boss).forEach(function (b) {
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
        align: 'right',
        sortable: true,
    });
    stat_col.push({
        field: date + "_comma",
        title: date,
        align: 'right',
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
    data: queryData,
    success: function (data) {
        uLog = data;
        // 移除一些不想看到的东西
        if (season == "5") {
            delete uLog["西瓜君"];
        }

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


users.filter(x => !new Set(Object.values(chudao).map(a => a.user_name)).has(x)).forEach(function (v) {
    chudao.push({ "total": 0, "user_name": v });
});

need_dao = [];

chudao.forEach(function (v) {
    if (!v.hasOwnProperty(today.str)) {
        need_dao.push(v.user_name + " (0/3)");
    } else {
        if (v[today.str] != 3) {
            need_dao.push(v.user_name + "(" + v[today.str] + "/3)");
        }
    }
});

$("#cuidao").html("@" + need_dao.join("  @") + " 记得出刀");
$("#btn_cuidao").on("click", function () {
    let copyText = document.getElementById("cuidao");
    let textArea = document.createElement("textarea");
    textArea.value = copyText.textContent;
    document.body.appendChild(textArea);
    textArea.select();
    document.execCommand("Copy");
    textArea.remove();
});


// 会战考勤表
$('#tbl_uLog').bootstrapTable({
    locale: "zh-CN",
    data: chudao,
    search: false,
    sortable: true,
    columns: uLog_col,
    undefinedText: "0",
    sortName: today.str,
});
if (filterDate.length <= 6) {
    $('#tbl_uLog').parent().parent().toggleClass("col-lg-4");
} else if (filterDate.length <= 10) {
    $('#tbl_uLog').parent().parent().toggleClass("col-lg-8");
}


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
if (filterDate.length <= 6) {
    $('#tbl_total').parent().parent().toggleClass("col-lg-4");
} else if (filterDate.length <= 10) {
    $('#tbl_total').parent().parent().toggleClass("col-lg-8");
}


$('#tbl_total_guild').bootstrapTable({
    locale: "zh-CN",
    data: Object.values(tongji_gh).sort().reverse(),
    search: false,
    sortable: true,
    columns: gh_stat_col,
    undefinedText: "0",
});

