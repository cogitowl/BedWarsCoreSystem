# 检索特殊实体

# 地图中心点
execute as @e[type=marker,tag=map_center] at @s run function debug:map_editor/special_entity/map_center

# 资源点
execute as @e[tag=res,tag=map_editor] at @s run function debug:map_editor/special_entity/resource
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{res_killer:true}}}}] at @s run kill @e[type=marker,tag=res,tag=map_editor,distance=0..1]

# 团队: 床、出生点
execute as @e[tag=bed,tag=map_editor,type=marker] at @s run function debug:map_editor/special_entity/bed with entity @p equipment.offhand.components."minecraft:custom_data"
execute as @e[tag=spawnpoint,tag=map_editor,type=marker] at @s run function debug:map_editor/special_entity/spawnpoint with entity @p equipment.offhand.components."minecraft:custom_data"

# 删除工具
execute at @a[nbt={SelectedItem:{id:"minecraft:shears",components:{"minecraft:custom_data":{res_killer:true}}}}] at @e[type=minecraft:marker,tag=res,distance=..7] unless entity @e[type=minecraft:interaction,tag=res_killer,tag=map_editor,distance=..0.5] run summon minecraft:interaction ~ ~ ~ {height:1f,width:1f,response:true,Tags:["res_killer","map_editor"]}
execute as @e[type=minecraft:interaction,tag=res_killer,tag=map_editor] at @s on target if entity @s[nbt={SelectedItem:{id:"minecraft:shears",components:{"minecraft:custom_data":{res_killer:true}}}}] run kill @e[type=minecraft:marker,tag=res,distance=..0.5,sort=nearest,limit=1]
execute as @e[type=minecraft:interaction,tag=res_killer,tag=map_editor] at @s unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run kill @s
execute as @e[type=minecraft:interaction,tag=res_killer,tag=map_editor] at @s on target unless entity @s[nbt={SelectedItem:{id:"minecraft:shears",components:{"minecraft:custom_data":{res_killer:true}}}}] run data remove entity @e[type=minecraft:interaction,tag=res_killer,tag=map_editor,sort=nearest,limit=1] interaction
execute as @e[type=minecraft:interaction,tag=res_killer,tag=map_editor] at @s unless entity @a[nbt={SelectedItem:{id:"minecraft:shears",components:{"minecraft:custom_data":{res_killer:true}}}},distance=..7] run kill @s

# 自动选择工具
execute at @e[type=minecraft:marker,tag=res_detective] run fill ~7 ~7 ~7 ~-7 ~-7 ~-7 minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_copper","map_editor","res_detective_result"]}',auto:1b} replace minecraft:waxed_copper_block
execute at @e[type=minecraft:marker,tag=res_detective_result,tag=res_copper] positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_copper","map_editor","res_detective_result"]}',auto:1b} run setblock ~ ~ ~ minecraft:waxed_copper_block
execute at @e[type=minecraft:marker,tag=res_detective] run fill ~7 ~7 ~7 ~-7 ~-7 ~-7 minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_iron","map_editor","res_detective_result"]}',auto:1b} replace minecraft:iron_block
execute at @e[type=minecraft:marker,tag=res_detective_result,tag=res_iron] positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_iron","map_editor","res_detective_result"]}',auto:1b} run setblock ~ ~ ~ minecraft:iron_block
execute at @e[type=minecraft:marker,tag=res_detective] run fill ~7 ~7 ~7 ~-7 ~-7 ~-7 minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_diamond","map_editor","res_detective_result"]}',auto:1b} replace minecraft:diamond_block
execute at @e[type=minecraft:marker,tag=res_detective_result,tag=res_diamond] positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:command_block{Command:'execute positioned ~ ~1 ~ unless entity @e[type=minecraft:marker,tag=res,distance=..0.5] run summon minecraft:marker ~ ~-0.5 ~ {Tags:["res","res_diamond","map_editor","res_detective_result"]}',auto:1b} run setblock ~ ~ ~ minecraft:diamond_block
kill @e[type=minecraft:marker,tag=res_detective]