

season_settings = {
    "5": {
        "boss": {
            "熔岩史莱姆国王": { class: "vtd-green", color: "#ACDB7E" },
            "流沙怪": { class: "vtd-purple", color: "#8b7be8" },
            "妖精": { class: "vtd-pink", color: "#e99899" },
            "雪人将军盖斯特": { class: "vtd-azure", color: "#85D4E6" },
        },
        "member": ["Doge", "Draketony", "风中的残痕", "老王", "夏姆", "egpk", "简娜", "暮鼓", "三笠阿克曼", "ROMANTIC", "Tarxeyfphe", "期待地搓手手", "御风洛溪", "slmint", "ZBY", "scuzjc", "雾里望白莲", "沈戴培", "OrYs", "淦饭王", "女施主借个吻", "losttime", "pixel", "谏山澪", "zzl", "啊咧", "大可大可", "七天限定", "看见妹子脸会红", "ypk25", "稀饭鱼子酱"]
    },
    "6": {
        "boss": {
            "暗影魔王": { class: "vtd-green", color: "#ACDB7E" },
            "愤怒的牛头人": { class: "vtd-purple", color: "#8b7be8" },
            "收割者": { class: "vtd-pink", color: "#e99899" },
            "春秋派首领": { class: "vtd-azure", color: "#85D4E6" },
        },
        "member": ["谏山澪", "七天限定", "稀饭鱼子酱", "OrYs", "夏姆", "风中的残痕", "看见妹子脸会红", "千夜", "雾里望白莲", "期待地搓手手", "啊咧", "大可大可", "ZBY", "slmint", "Ieuan", "女施主借个吻", "scuzjc", "egpk", "沈戴培", "暮鼓", "Tarxeyfphe", "ypk25", "三笠阿克曼", "只据", "Draketony", "ROMANTIC", "御风洛溪", "简娜", "老王", "淦饭王"],
        "memberRank": ["风中的残痕","Draketony","egpk","简娜","夏姆","老王","三笠阿克曼","御风洛溪","七天限定","ROMANTIC","期待地搓手手","看见妹子脸会红","暮鼓","slmint","雾里望白莲","Tarxeyfphe","ZBY","大可大可","scuzjc","啊咧","OrYs","淦饭王","女施主借个吻","谏山澪","沈戴培","ypk25","稀饭鱼子酱","千夜","Ieuan","只据"]
    }
}

function _init_season_settings() {
    Object.keys(season_settings).forEach(function (_season) {
        Object.keys(season_settings[_season].boss).forEach(function (boss_name) {
            $.extend(season_settings[_season].boss[boss_name], { elem: "", dao: 0, total_damage: 0, avg_damage: 0 });
        });
    });
}

_init_season_settings();

