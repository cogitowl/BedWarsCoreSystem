# 进入游戏结算模式
scoreboard players set $working gaming 2
say 进入 游戏结算模式 $working gaming 2

# 载入正常游戏结束文件
function bw:game_end/game_end_1

# title 结算
schedule function bw:game_end/round_to_career/trigger 2s replace