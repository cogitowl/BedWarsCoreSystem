# 进入游戏结算模式
scoreboard players set $working gaming 2

# 特殊效果
scoreboard players set $special_effect game_end_mode 1
execute if score $special_effect game_end_mode matches 1 run function bw:game_end/special_effect/anvil_rain/init

# 玩家逻辑基本处理
execute as @a[tag=playing] run function bw:game_end/player_enter

# 载入正常游戏结束文件
function bw:game_end/game_end_1

# title 结算
schedule function bw:game_end/round_to_career/trigger 2s replace