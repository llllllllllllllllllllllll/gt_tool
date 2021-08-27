

season_settings = {
    "5": {
        "boss": {
            "熔岩史莱姆国王": { class: "vtd-green", color: "#ACDB7E" },
            "流沙怪": { class: "vtd-purple", color: "#8b7be8" },
            "妖精": { class: "vtd-pink", color: "#e99899" },
            "雪人将军盖斯特": { class: "vtd-azure", color: "#85D4E6" },
        },
        "member": ["Doge", "Draketony", "风中的残痕", "老王", "夏姆", "egpk", "简娜", "暮鼓", "三笠阿克曼", "ROMANTIC", "Tarxeyfphe", "期待地搓手手", "御风洛溪", "slmint", "ZBY", "scuzjc", "雾里望白莲", "沈戴培", "OrYs", "淦饭王", "女施主借个吻", "losttime", "pixel", "谏山澪", "zzl", "啊咧", "大可大可", "七天限定", "看见妹子脸会红", "ypk25", "稀饭鱼子酱"],
        "end": "2021-08-12"
    },
    "6": {
        "boss": {
            "暗影魔王": { class: "vtd-green", color: "#ACDB7E" },
            "愤怒的牛头人": { class: "vtd-purple", color: "#8b7be8" },
            "收割者": { class: "vtd-pink", color: "#e99899" },
            "春秋派首领": { class: "vtd-azure", color: "#85D4E6" },
        },
        "member": ["谏山澪", "七天限定", "稀饭鱼子酱", "OrYs", "夏姆", "风中的残痕", "看见妹子脸会红", "千夜", "雾里望白莲", "期待地搓手手", "啊咧", "大可大可", "ZBY", "slmint", "Ieuan", "女施主借个吻", "scuzjc", "egpk", "沈戴培", "暮鼓", "Tarxeyfphe", "ypk25", "三笠阿克曼", "只据", "Draketony", "ROMANTIC", "御风洛溪", "简娜", "老王", "淦饭王"],
        "memberRank": ["风中的残痕","Draketony","egpk","简娜","夏姆","老王","三笠阿克曼","御风洛溪","七天限定","ROMANTIC","期待地搓手手","看见妹子脸会红","暮鼓","slmint","雾里望白莲","Tarxeyfphe","ZBY","大可大可","scuzjc","啊咧","OrYs","淦饭王","女施主借个吻","谏山澪","沈戴培","ypk25","稀饭鱼子酱","千夜","Ieuan","只据"],
        "end": "2021-09-02"
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