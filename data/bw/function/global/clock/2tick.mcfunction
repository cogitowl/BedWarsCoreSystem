# 每 2 Tick 执行一次
schedule function bw:global/clock/2tick 2t replace

# 状态执行
execute if score $working gaming matches 0 run function bw:lobby/tick2
execute if score $working gaming matches 1 run function bw:game/tick/2tick

# 玩家载入检测
execute as @a[team=!debug] unless score @s leave_game matches 0 run function bw:global/event/player_enter

# 玩家死亡检测
execute as @a[scores={death=1..},team=!debug] run function bw:global/event/player_death

# 防止玩家丢弃物品：如果特殊物品存在 Thrower 则要求强制捡起
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{disabled_throw:1b}}}}] if data entity @s Thrower run function bw:global/event/item_throw

# 数据包信息说明(兼 玩家数据接口)

## about
execute as @a if score @s about matches 1..2147483647 run function bw:global/about

## 漏洞追踪器
execute as @a if score @s about matches -57129 run function debug:bug_tracker/feedback/trigger
execute as @a if score @s about matches -356132..-356126 run function debug:bug_tracker/feedback/scoreboard_trigger

## 启动菜单
execute unless score $working gaming matches 1 as @a if score @s about matches -12345 run function bw:lobby/menu/launch/trigger
execute unless score $working gaming matches 1 as @a if score @s about matches -2333 run function bw:lobby/vote/trigger
execute unless score $working gaming matches 1 as @a if score @s about matches -2312 run function bw:lobby/menu/launch/buttom/prev_map
execute unless score $working gaming matches 1 as @a if score @s about matches -1581 run function bw:lobby/menu/launch/buttom/next_map


## 恢复
execute as @a unless score @s about matches 0 run scoreboard players reset @s about
scoreboard players enable @a about

# debug 
function debug:tick/2tick