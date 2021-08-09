package controllers

import (
	"sort"
)

type gt struct {
	Data map[string]report
	// ChuDao 出刀记录 时间正序
	ChuDao map[string][]damage_list
	GLogDetail []gLogDetail
	GLogIndex map[int]gLogDetail
	LastLogTime int
}

func (r *gt) Calc(day string) {
	if r.ChuDao == nil {
		r.ChuDao = make(map[string][]damage_list)
	}

	d := r.Data[day].Data

	var todayDrc []damage_list

	for i, v := range d {
		records := v.DamageList
		for j := range records {
			records[j].Record = &d[i]
			records[j].UserID =v.UserID
			records[j].UserName = v.UserName
		}
		todayDrc = append(todayDrc, records...)
	}

	sort.SliceStable(todayDrc, func(i, j int) bool {
		return todayDrc[i].LogTime < todayDrc[j].LogTime
	})

	r.ChuDao[day] = todayDrc
}

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


