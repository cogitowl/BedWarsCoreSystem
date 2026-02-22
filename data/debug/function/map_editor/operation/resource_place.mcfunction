# 更新为状态: 资源点放置中

# 操纵 NBT 
$data remove storage bw:map maps[{"id":$(id)d}].map_editor.resource.status
$data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.placing set value true

function lib:playerinfo/name
$data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.placing set value true
$data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.job set from storage lib:playerinfo name

# 移除现有数据
$data remove storage bw:map maps[{"id":$(id)d}].spawner

# 给予道具
function debug:map_editor/panel/buttom/data_resource_clear

give @s slime_spawn_egg[custom_name={"text":"资源产出点 - 自动","color":"yellow","italic":false},lore=[{"text":"自动根据材质生成指定资源点","italic":false,"color":"yellow"},{"text":"检测半径 7格"}],entity_data={id:"marker",Tags:["res","res_detective","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true}]
give @s zoglin_spawn_egg[custom_name={"text":"资源产出点 - 铜","color":"yellow","italic":false},lore=[{"text":"放下后将对应点位设定为资源产出点","italic":false,"color":"yellow"}],entity_data={id:"marker",Tags:["res","res_copper","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true}]
give @s sheep_spawn_egg[custom_name={"text":"资源产出点 - 铁","color":"yellow","italic":false},lore=[{"text":"放下后将对应点位设定为资源产出点","italic":false,"color":"yellow"}],entity_data={id:"marker",Tags:["res","res_iron","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true}]
give @s glow_squid_spawn_egg[custom_name={"text":"资源产出点 - 钻","color":"yellow","italic":false},lore=[{"text":"放下后将对应点位设定为资源产出点","italic":false,"color":"yellow"}],entity_data={id:"marker",Tags:["res","res_diamond","map_editor"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true}]
give @s shears[custom_name={"text":"剪除特殊实体"},lore=[{"text":"将这个扔到资源点的位置,即可移除对应资源点"}],custom_data={map_editor:true,res_killer:true,res:true}]

# 弹出菜单
function debug