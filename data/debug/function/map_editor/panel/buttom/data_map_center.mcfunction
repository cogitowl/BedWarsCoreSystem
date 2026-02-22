# 为地图设定中心点

# 清理道具
function debug:map_editor/panel/buttom/data_map_center_clear

# 获取物品
give @s husk_spawn_egg[custom_name={"text":"地图中心点","color":"blue","italic":false},lore=['{"text":"放下后将对应点位设定为地图中心点...","italic":false,"color":"yellow"}'],entity_data={id:"marker",Tags:["map_editor","map_center"]},enchantments={unbreaking:10},custom_data={map_editor:true,disabled_throw:true}]