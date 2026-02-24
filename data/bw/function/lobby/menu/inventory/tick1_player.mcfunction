# 玩家背包内容


# 判定操作
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:gamerule}}}}}] run function bw:lobby/menu/inventory/gamerule with entity @s equipment.offhand.components."minecraft:custom_data"
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:just_it}}}}}] run function bw:lobby/start_game
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:map}}}}}] run function bw:lobby/menu/inventory/map with entity @s equipment.offhand.components."minecraft:custom_data"
execute if entity @s[nbt={equipment:{offhand:{components:{"minecraft:custom_data":{type:unlock}}}}}] run function bw:lobby/map/special_lock/try
item replace entity @s weapon.offhand with air 1

# 填充背包
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

## 切换地图
item replace entity @s hotbar.3 with player_head[custom_name="上一张地图",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始切换！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:prev},minecraft:profile=MHF_ArrowLeft] 1
item replace entity @s hotbar.5 with player_head[custom_name="下一张地图",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始切换！"]],custom_data={disabled_throw:true,lobby_item:true,type:map,event:next},minecraft:profile=MHF_ArrowRight] 1

## 没有精力
execute if entity @s[tag=out_of_energy] run item replace entity @s hotbar.4 with player_head[custom_name="没有充足的精力，您无法参与游戏！",lore=[{"text":"您的精力值（<0点）已无法进行一局游戏，20分钟后将恢复50点精力。"},{"text":"每一局将消耗您20点精力，如果您在22点至次日4点进行游戏，则额外消耗10点精力。"},{"text":"起床战争开发组提醒您：合理安排时间！"}],custom_data={disabled_throw:true,lobby_item:true,type:vote,event:1},minecraft:profile=MHF_Question] 1

## 没有解锁
execute if entity @s[tag=!out_of_energy] if data storage bw:map using.lock.special run item replace entity @s hotbar.4 with lever[custom_name="立刻解锁这张地图！",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键开始！"]],custom_data={disabled_throw:true,lobby_item:true,type:unlock}] 1

## 开始游戏
execute if entity @s[tag=!out_of_energy] unless data storage bw:map using.lock.special run item replace entity @s hotbar.4 with iron_sword[custom_name="开始游戏",lore=[[{"text":"按下 "},{"keybind":"key.swapOffhand"}," 键立刻开始游戏！"]],custom_data={disabled_throw:true,lobby_item:true,type:just_it}]


execute unless score @s vote matches 1..2 if score $voting vote matches 1..2 run item replace entity @s hotbar.4 with air 1