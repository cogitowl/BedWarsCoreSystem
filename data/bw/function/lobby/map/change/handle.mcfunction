# 地图变更 处理器

# 同步地图选择
execute if score $sel map matches 0 run function bw:lobby/map/change/random with storage bw:basic map
execute if score $sel map matches 0 run scoreboard players operation $using map = $map_random temp

execute unless score $sel map matches 0 run scoreboard players operation $using map = $sel map

# 加载数据
execute store result storage bw:basic temp.id int 1 run scoreboard players get $using map
function bw:lobby/map/load_data with storage bw:basic temp

# 特殊情况处理

## 当前地图正在编辑中
execute if data storage bw:map using.map_editor.lock run return run function bw:lobby/map/change/request/try_again

## 当前地图正在复制中
execute if data storage bw:map using.lock.copying run return run function bw:lobby/map/change/request/try_again

# 更新地图名称
kill @e[tag=map_name]
summon text_display 0 44 60 {text:{"storage":"bw:lang","nbt":"lobby.map.choice.error.no_found_map_name"},Tags:["map_name"]}
execute unless score $sel map matches 0 run data modify entity @e[type=text_display,limit=1,tag=map_name] text set from storage bw:map using.name
execute if score $sel map matches 0 run data modify entity @e[type=text_display,limit=1,tag=map_name] text set value {"storage":"bw:lang","nbt":"lobby.map.choice.random_map","interpret":true}

# 消息提示
title @a actionbar {"storage":"bw:lang","nbt":"lobby.map.choice.change","interpret": true}

# 更新 Bossbar
data modify storage bw:lobby bossbar_message set value {"text":"游戏准备就绪"}
bossbar set lobby name [{"storage":"bw:lang","nbt":"lobby.map.choice.now","interpret": true}," | ",{"storage":"bw:lobby","nbt": "bossbar_message","interpret": true}]

# 同步地图选择
scoreboard players operation @a[team=lobby] visit_map = $sel map

# 进入地图
function bw:lobby/map/visit/enter
