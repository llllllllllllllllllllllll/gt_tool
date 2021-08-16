package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"time"

	// "sort"
	"reflect"
	"strconv"

	"github.com/beego/beego/v2/client/cache"
	"github.com/beego/beego/v2/client/httplib"
	"github.com/beego/beego/v2/core/logs"
	beego "github.com/beego/beego/v2/server/web"
)

var (
	_date       []string
	lastFetch   time.Time
	lastUpdate  time.Time
	lastLogTime int
	// nNow 当前第N期公会战
	nNow = "5"
	sNK  = map[string]string{"5": "五"}
)

type MainController struct {
	apiKey   string
	apiID    string
	apiGuild string
	beego.Controller
	// sDs 每期会战数据
	sDs map[string]gt
	ds  gt
	// sNow  显示第N期公会战数据
	sNow string
}

func (c *MainController) URLMapping() {
	c.Mapping("BLog", c.BLog)
	c.Mapping("GLog", c.GLog)
	c.Mapping("ULog", c.ULog)
	c.Mapping("Get", c.Get)
}

var bm cache.Cache

func init() {
	c, err := cache.NewCache("file", `{"CachePath":"./cache","FileSuffix":".cache","DirectoryLevel":"1","EmbedExpiry":"0"}`)
	if err != nil {
		panic(err)
	}
	bm = c
}

func (c *MainController) Prepare() {
	c.apiID = c.GetString("u")
	m, _ := beego.AppConfig.GetSection("key")
	if v, ok := m[c.apiID]; ok {
		c.apiKey = fmt.Sprintf("session-api=%v", v)

		if g, err := beego.AppConfig.GetSection("key"); err != nil {
			c.apiGuild = "无公会信息"
		} else {
			if v, ok := g[c.apiID]; ok {
				c.apiGuild = v
			} else {
				c.apiGuild = "未命名公会"
			}
		}

	} else {
		c.Abort("404")
		return
	}

	c.sNow = c.GetString("s")
	if _, ok := sNK[c.sNow]; !ok {
		c.sNow = nNow
	}
	c.Data["sN"] = sNK[c.sNow]

	c.sDs = make(map[string]gt)

	s, err := bm.Get(context.TODO(), c.apiID)
	if err != nil {
		logs.Error(err)
	} else {
		err = json.Unmarshal(s.([]byte), &c.sDs)
		if err != nil {
			logs.Error(err)
			c.Abort("500")
			return
		}
	}

	c.ds = c.sDs[c.sNow]
	// if c.ds.Data == nil {
	// 	c.ds.Data = make(map[string]report)
	// }

	c.Data["Uid"] = c.GetString("u")
}

// func (c *MainController) fetch(day string) report {
// 	var (
// 		url    = "https://www.bigfun.cn/api/feweb?target=kan-gong-guild-report%2Fa&date=" + day
// 		result report
// 	)

// 	req := httplib.Get(url)
// 	req.Header("Cookie", c.apiKey)
// 	req.Header("User-Agent", "Mozilla/5.0")
// 	e := req.ToJSON(&result)
// 	if e != nil {
// 		logs.Error(e)
// 		c.Abort("500")
// 		return result
// 	}

// 	return result
// }

func (c *MainController) guildLog(size int) []gLogDetail {
	var (
		url    = "https://www.bigfun.cn/api/feweb?target=kan-gong-guild-log%2Fa&date=&user_id=&page=&size=" + strconv.Itoa(size)
		result gLog
	)

	req := httplib.Get(url)
	req.Header("Cookie", c.apiKey)
	req.Header("User-Agent", "Mozilla/5.0")
	e := req.ToJSON(&result)
	if e != nil {
		logs.Error(e)
		c.Abort("500")
		return result.Data
	}

	return result.Data
}

// @router /log/dao_list [get]
// func (c *MainController) BLog() {
// 	var (
// 		// l int
// 		logs []damage_list
// 	)

// 	for _ , s := range _date {
// 		// l = l + len(c.ds.ChuDao[s])
// 		logs = append(logs,c.ds.ChuDao[s]...)
// 	}
// 	// logs := make([]damage_list,l,0)

// 	sort.SliceStable(logs, func(i, j int) bool {
// 		return logs[i].LogTime > logs[j].LogTime
// 	})

// 	c.Data["json"] = logs
// 	c.ServeJSON()
// }

// @router /log/battle_log [get]
func (c *MainController) BLog() {
	c.Data["json"] = c.ds.GLogDetail
	c.ServeJSON()
}

// @router /log/guild_log [get]
func (c *MainController) GLog() {
	c.Data["json"] = c.ds.GLogIndex
	c.ServeJSON()
}

// @router /log/user_log [get]
func (c *MainController) ULog() {
	c.Data["json"] = c.ds.GLogUser
	c.ServeJSON()
}

// @router / [get]
func (c *MainController) Get() {
	if c.GetString("v") == "1" {
		c.TplName = "index_new.tpl"
	} else {
		c.TplName = "index.tpl"
	}

	var (
		url    = "https://www.bigfun.cn/api/feweb?target=kan-gong-guild-log-filter%2Fa"
		result filter
		// today  = time.Now().Format("2006-01-02")
		force    = false
		isPull   = false
		fetchAll = 1500
		// fetchDefault = 90
		// fetchN = 1
		offline = os.Getenv("offline")
	)

	if c.GetString("f") == "1" {
		force = true
	}

	req := httplib.Get(url)
	req.Header("Cookie", c.apiKey)
	req.Header("User-Agent", "Mozilla/5.0")
	e := req.ToJSON(&result)
	if e != nil {
		c.Abort("500")
		return
	}

	c.Data["Date"] = result.Data.Date

	if (lastFetch == time.Time{}) || (time.Now().After(lastFetch.Add(1 * time.Minute))) {
		isPull = true
	}

	if nNow != c.sNow {
		logs.Info("not fetch")
		return
	}
	if (!isPull && !force) || offline == "1" {
		c.Data["lastFetch"] = lastFetch.Format("2006-01-02 15:04:05")
		c.Data["lastUpdate"] = c.ds.LastLogTime
		logs.Info("cache")
		return
	}
	logs.Info("fetch")

	lastFetch = time.Now()
	c.Data["lastFetch"] = lastFetch.Format("2006-01-02 15:04:05")

	glog := c.guildLog(fetchAll)

	if force || glog[0].LogTime != c.ds.LastLogTime {
		c.ds.GLogDetail = c.guildLog(fetchAll)
		c.ds.LastLogTime = c.ds.GLogDetail[0].LogTime
	} else {
		c.Data["lastUpdate"] = c.ds.LastLogTime
		logs.Info("no new record")
		return
	}

	// if c.ds.GLogIndex == nil {
	c.ds.GLogIndex = make(map[int]gLogDetail)
	// }
	// if c.ds.GLogUser == nil {
	c.ds.GLogUser = make(map[string]uLog)
	// }
	local2, err := time.LoadLocation("Local")
	if err != nil {
		logs.Error(err)
	}

	for _, v := range c.ds.GLogDetail {
		tm := time.Unix(int64(v.LogTime), 8)
		v.LogDate = tm.In(local2).Format("2006-01-02")
		c.ds.GLogIndex[v.LogTime] = v

		obj := c.ds.GLogUser[v.UserName]
		obj.Data = append(obj.Data, v)
		if obj.ChuDao == nil {
			obj.ChuDao = make(map[string]int)
		}
		obj.ChuDao[v.LogDate] = obj.ChuDao[v.LogDate] + 1

		// 统计信息，每日出刀数，每日伤害
		if reflect.DeepEqual(obj.Stat, uStat{}) {
			obj.Stat.ChuDao = make(map[string]int)
			obj.Stat.DaoDmg = make(map[string]int)
			obj.Stat.ChuBoss = make(map[string]int)
			obj.Stat.ChuBossDmg = make(map[string]int)
		}

		obj.Stat.ChuDao[v.LogDate] = obj.Stat.ChuDao[v.LogDate] + 1
		obj.Stat.ChuDaoTotal = obj.Stat.ChuDaoTotal + 1
		obj.Stat.DaoDmg[v.LogDate] = obj.Stat.DaoDmg[v.LogDate] + v.Damage
		obj.Stat.DaoDmgTotal = obj.Stat.DaoDmgTotal + v.Damage
		obj.Stat.ChuBoss[v.Boss.Name] = obj.Stat.ChuBoss[v.Boss.Name] + 1
		obj.Stat.ChuBossDmg[v.Boss.Name] = obj.Stat.ChuBossDmg[v.Boss.Name] + v.Damage

		c.ds.GLogUser[v.UserName] = obj
	}

	c.Data["lastUpdate"] = c.ds.LastLogTime

	c.sDs[c.sNow] = c.ds

	str, err := json.Marshal(c.sDs)
	if err != nil {
		logs.Error(err)
		c.Abort("500")
		return
	}

	err = bm.Put(context.TODO(), c.apiID, str, 0)
	if err != nil {
		logs.Error(err)
		c.Abort("500")
		return
	}

}
