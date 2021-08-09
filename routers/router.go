package routers

import (
	beego "github.com/beego/beego/v2/server/web"

	"gt_tool/controllers"
)

func init() {
	// ns :=
	// 	beego.NSNamespace("/",
	// 		beego.NSInclude(
	// 			&controllers.MainController{},
	// 		),
	// 	)
	// // beego.Router("/", )
	// beego.AddNamespace(ns)
	beego.Include(&controllers.MainController{})
}
