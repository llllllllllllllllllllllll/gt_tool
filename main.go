package main

import (
	"fmt"
	_ "gt_tool/routers"

	beego "github.com/beego/beego/v2/server/web"
)

func main() {

	m, _ := beego.AppConfig.GetSection("key")
	for k, v := range m {
		fmt.Printf("access id: %s [%s] \n", k, v)
	}

	beego.Run()
}
