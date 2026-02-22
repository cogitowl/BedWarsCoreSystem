



# 游戏规则设定
# 
#
# 最底层：游戏操作


execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:gamerule}}}}}] run function bw:lobby/menu/inventory/gamerule with entity @s equipment.offhand.components."minecraft:custom_data"
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:vote}}}}}] run function bw:lobby/menu/inventory/vote with entity @s equipment.offhand.components."minecraft:custom_data"
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:map}}}}}] run function bw:lobby/menu/inventory/map with entity @s equipment.offhand.components."minecraft:custom_data"


execute if score $shop_type gamerule matches 0 run item replace entity @s inventory.0 with ender_chest[custom_name="商店类型：箱子商店",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"shop_type"}] 1
execute if score $shop_type gamerule matches 1 run item replace entity @s inventory.0 with crafting_table[custom_name="商店类型：配方制作",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"shop_type"}] 1
execute if score $shop_type gamerule matches 2 run item replace entity @s inventory.0 with villager_spawn_egg[custom_name="商店类型：村民交易",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"shop_type"}] 1

execute if score $daylight_cycle gamerule matches 1 run item replace entity @s inventory.1 with torch[custom_name="昼夜循环：启用",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"daylight_cycle"}] 1
execute if score $daylight_cycle gamerule matches 2 run item replace entity @s inventory.1 with soul_torch[custom_name="昼夜循环：关闭",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"daylight_cycle"}] 1

execute if score $border gamerule matches 1 run item replace entity @s inventory.2 with bucket[custom_name="边界收缩：不会缩圈",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"border"}] 1
execute if score $border gamerule matches 2 run item replace entity @s inventory.2 with lava_bucket[custom_name="边界收缩：自动缩圈",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"border"}] 1

execute if score $team_number gamerule matches 2 run item replace entity @s inventory.3 with cyan_wool[custom_name="队伍数量：2个队伍",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"team_number"}] 2
execute if score $team_number gamerule matches 3 run item replace entity @s inventory.3 with cyan_wool[custom_name="队伍数量：3个队伍",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"team_number"}] 3
execute if score $team_number gamerule matches 4 run item replace entity @s inventory.3 with cyan_wool[custom_name="队伍数量：4个队伍",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"team_number"}] 4

execute if score $void_damage gamerule matches 0 run item replace entity @s inventory.4 with grass_block[custom_name="虚空伤害：原版伤害",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"void_damage"}] 1
execute if score $void_damage gamerule matches 1 run item replace entity @s inventory.4 with redstone_block[custom_name="虚空伤害：增加伤害",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"void_damage"}] 1
execute if score $void_damage gamerule matches 2 run item replace entity @s inventory.4 with nether_wart_block[custom_name="虚空伤害：立即击杀",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键切换"]],custom_data={disabled_throw:true,lobby_item:true,type:gamerule,event:"void_damage"}] 1

item replace entity @s inventory.5 with air 1
item replace entity @s inventory.6 with air 1
item replace entity @s inventory.7 with air 1
item replace entity @s inventory.8 with air 1
item replace entity @s inventory.9 with air 1
item replace entity @s inventory.10 with air 1
item replace entity @s inventory.11 with air 1
item replace entity @s inventory.12 with air 1
item replace entity @s inventory.13 with air 1
item replace entity @s inventory.14 with air 1
item replace entity @s inventory.15 with air 1
item replace entity @s inventory.16 with air 1
item replace entity @s inventory.17 with air 1
item replace entity @s inventory.18 with air 1
item replace entity @s inventory.19 with air 1
item replace entity @s inventory.20 with air 1
item replace entity @s inventory.21 with air 1
item replace entity @s inventory.22 with air 1
item replace entity @s inventory.23 with air 1
item replace entity @s inventory.24 with air 1
item replace entity @s inventory.25 with air 1
item replace entity @s inventory.26 with air 1


execute if entity @s[tag=!out_of_energy] if score $voting vote matches 1..2 run item replace entity @s hotbar.3 with lime_wool[custom_name="赞成投票",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键赞成投票！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:agree_vote}]
execute unless score $voting vote matches 1..2 run item replace entity @s hotbar.3 with player_head[custom_name="上一张地图",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始切换！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:prev_map},minecraft:profile=MHF_ArrowLeft] 1

execute if entity @s[tag=!out_of_energy] unless score $voting vote matches 1..2 run item replace entity @s hotbar.4 with iron_sword[custom_name="立刻开始投票！",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始！"]],custom_data={disabled_throw:true,lobby_item:true,type:vote,event:"trigger"}] 1
execute if entity @s[tag=out_of_energy] run item replace entity @s hotbar.4 with player_head[custom_name="没有充足的精力，您无法参与游戏！",lore=[{"text":"您的精力值（<0点）已无法进行一局游戏，20分钟后将恢复50点精力。"},{"text":"每一局将消耗您20点精力，如果您在22点至次日4点进行游戏，则额外消耗10点精力。"},{"text":"起床战争开发组提醒您：合理安排时间！"}],custom_data={disabled_throw:true,lobby_item:true,type:vote,event:1},minecraft:profile=MHF_Question] 1

execute if entity @s[tag=!out_of_energy] if score $voting vote matches 1..2 run item replace entity @s hotbar.5 with red_wool[custom_name="拒绝投票",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键拒绝投票！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:refuse_vote}]
execute unless score $voting vote matches 1..2 run item replace entity @s hotbar.5 with player_head[custom_name="下一张地图",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始切换！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:next_map},minecraft:profile=MHF_ArrowRight] 1

execute unless score @s vote matches 1..2 if score $voting vote matches 1..2 run item replace entity @s hotbar.4 with air 1

execute unless score @s vote matches 1..2 run item replace entity @s hotbar.0 with air 1
execute unless score @s vote matches 1..2 run item replace entity @s hotbar.1 with air 1
execute unless score @s vote matches 1..2 run item replace entity @s hotbar.2 with air 1
execute unless score @s vote matches 1..2 run item replace entity @s hotbar.6 with air 1
execute unless score @s vote matches 1..2 run item replace entity @s hotbar.7 with air 1
execute unless score @s vote matches 1..2 run item replace entity @s hotbar.8 with air 1


execute if score @s vote matches 1 run item replace entity @s hotbar.0 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.1 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.2 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.3 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.4 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.5 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.6 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.7 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 1 run item replace entity @s hotbar.8 with lime_wool[custom_name="投票已赞成！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]

execute if score @s vote matches 2 run item replace entity @s[scores={vote=2}] hotbar.3 with red_wool[custom_name="投票已否决！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 2 run item replace entity @s[scores={vote=2}] hotbar.4 with red_wool[custom_name="投票已否决！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]
execute if score @s vote matches 2 run item replace entity @s[scores={vote=2}] hotbar.5 with red_wool[custom_name="投票已否决！",custom_data={disabled_throw:true,lobby_item:true,type:map,event:''}]



item replace entity @s armor.body with air 1
item replace entity @s armor.chest with air 1
item replace entity @s armor.feet with air 1
item replace entity @s armor.head with air 1
item replace entity @s armor.legs with air 1
