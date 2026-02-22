# 为地图设定队伍数据

# 清理道具
function debug:map_editor/panel/buttom/data_team_clear

# 获取物品

give @s husk_spawn_egg[custom_name={"text":"床设定点","color":"yellow","italic":false},lore=[{"text":"放下后将对应点位设定为对应队伍的床出生点。","italic":false,"color":"yellow"}],entity_data={id:"marker",Tags:["bed","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true,bed:true}]
give @s husk_spawn_egg[custom_name={"text":"玩家出生点标记","color":"yellow","italic":false},lore=[{"text":"放下后将对应点位设定为玩家出生点。","italic":false,"color":"yellow"}],entity_data={id:"marker",Tags:["spawnpoint","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true,spawnpoint:true}]

$give @s red_wool[custom_data={team:red,id:$(id),disabled_throw:true},lore=['{"text":"羊毛放在副手，道具放在主手。","italic":false,"color":"yellow"}']]
$give @s blue_wool[custom_data={team:blue,id:$(id),disabled_throw:true},lore=['{"text":"羊毛放在副手，道具放在主手。","italic":false,"color":"yellow"}']]
$give @s green_wool[custom_data={team:green,id:$(id),disabled_throw:true},lore=['{"text":"羊毛放在副手，道具放在主手。","italic":false,"color":"yellow"}']]
$give @s yellow_wool[custom_data={team:yellow,id:$(id),disabled_throw:true},lore=['{"text":"羊毛放在副手，道具放在主手。","italic":false,"color":"yellow"}']]
