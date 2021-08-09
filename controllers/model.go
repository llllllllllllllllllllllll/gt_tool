package controllers

import (
	// "sort"
)



type gt struct {
	Data map[string]report
	GLogDetail []gLogDetail
	GLogIndex map[int]gLogDetail
	GLogUser map[string]uLog
	LastLogTime int
}


// func (r *gt) Calc() {
// 	if r.ChuDao == nil {
// 		r.ChuDao = make(map[string][]damage_list)
// 	}

// 	d := r.Data[day].Data

// 	var todayDrc []damage_list

// 	for i, v := range d {
// 		records := v.DamageList
// 		for j := range records {
// 			records[j].Record = &d[i]
// 			records[j].UserID =v.UserID
// 			records[j].UserName = v.UserName
// 		}
// 		todayDrc = append(todayDrc, records...)
// 	}

// 	sort.SliceStable(todayDrc, func(i, j int) bool {
// 		return todayDrc[i].LogTime < todayDrc[j].LogTime
// 	})

// 	r.ChuDao[day] = todayDrc
// }

type report struct {
	Code int      `json:"code"`
	Data []record `json:"data"`
}

type record struct {
	UserID      int           `json:"user_id,omitempty"`
	UserName    string        `json:"user_name,omitempty"`
	DamageNum   int           `json:"damage_num,omitempty"`
	DamageTotal int           `json:"damage_total,omitempty"`
	DamageList  []damage_list `json:"damage_list,omitempty"`
}

type damage_list struct {
	Damage   int     `json:"damage,omitempty"`
	BossID   int     `json:"boss_id,omitempty"`
	BossName string  `json:"boss_name,omitempty"`
	Round    int     `json:"round,omitempty"`
	LogTime  int     `json:"log_time,omitempty"`
	IsKill   int     `json:"is_kill,omitempty"`
	Record   *record `json:"-"`
	UserID      int           `json:"user_id,omitempty"`
	UserName    string        `json:"user_name,omitempty"`
}

type gLog struct {
	Code int `json:"code"`
	Data []gLogDetail `json:"data"`
}

type gLogDetail struct {
	LogTime  int        `json:"log_time,omitempty"`
	LogDate string  `json:"log_date,omitempty"`
	UserName string     `json:"user_name,omitempty"`
	Damage   int        `json:"damage,omitempty"`
	Boss     gLogBoss   `json:"boss,omitempty"`
	RoleList []gLogRole `json:"role_list,omitempty"`
}

type gLogRole struct {
	Icon      string `json:"icon,omitempty"`
	Dps       int    `json:"dps,omitempty"`
	Toughness int    `json:"toughness,omitempty"`
	Recovery  int    `json:"recovery,omitempty"`
}

type gLogBoss struct {
	Name            string `json:"name,omitempty"`
	Level           int `json:"level,omitempty"`
	ElementalTypeCn string `json:"elemental_type_cn,omitempty"`
}

// {
//     "server_time": 1628014676,
//     "log_time": 1628013773,
//     "user_name": "期待地搓手手",
//     "boss": {
//         "name": "流沙怪",
//         "level": 74,
//         "elemental_type_cn": "土"
//     },
//     "damage": 823722,
//     "role_list": [
//         {
//             "icon": "https://l1-prod-patch-snake.bilibiligame.net/bigfunAssets/version_1/portraits/dancing_archer.png",
//             "dps": 25316,
//             "toughness": 95560,
//             "recovery": 0
//         },
//         {
//             "icon": "https://l1-prod-patch-snake.bilibiligame.net/bigfunAssets/version_1/portraits/flower_girl.png",
//             "dps": 45856,
//             "toughness": 118007,
//             "recovery": 0
//         },
//         {
//             "icon": "https://l1-prod-patch-snake.bilibiligame.net/bigfunAssets/version_1/portraits/sniper.png",
//             "dps": 21437,
//             "toughness": 69040,
//             "recovery": 0
//         },
//         {
//             "icon": "https://l1-prod-patch-snake.bilibiligame.net/bigfunAssets/version_1/portraits/leaf_fairy.png",
//             "dps": 18289,
//             "toughness": 69378,
//             "recovery": 9730
//         }
//     ]
// }


type filter struct {
	Code int        `json:"code,omitempty"`
	Data filterData `json:"data,omitempty"`
}

type filterData struct {
	Date   []string       `json:"date,omitempty"`
	Member []filterMember `json:"member,omitempty"`
}

type filterMember struct {
	ID   int    `json:"id,omitempty"`
	Name string `json:"name,omitempty"`
}

// code: 0
// data: {,…}
// date: ["2021-08-04", "2021-08-03", "2021-08-02", "2021-08-01", "2021-07-31", "2021-07-30"]
// 0: "2021-08-04"
// 1: "2021-08-03"
// 2: "2021-08-02"
// 3: "2021-08-01"
// 4: "2021-07-31"
// 5: "2021-07-30"
// member: [{id: 1001217502, name: "啊咧"}, {id: 1000961690, name: "雾里望白莲"}, {id: 1001425067, name: "御风洛溪"},…]
// 0: {id: 1001217502, name: "啊咧"}


type uLog struct {
	ChuDao map[string]int `json:"chu_dao,omitempty"`
	Data   []gLogDetail   `json:"data,omitempty"`
	Stat   uStat          `json:"stat,omitempty"`
}

// uStat 统计信息，每日出刀数，每日伤害
type uStat struct {
	ChuDao      map[string]int `json:"chu_dao"`
	ChuDaoTotal int            `json:"chu_dao_total"`
	DaoDmg      map[string]int `json:"dao_dmg"`
	DaoDmgTotal int            `json:"dao_dmg_total"`
}