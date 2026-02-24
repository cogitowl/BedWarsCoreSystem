# 进入游戏初始化模式
scoreboard players set $working gaming 3
say 进入 游戏初始化模式 $working gaming 3

# 等待加载地图
execute if data storage bw:map using.lock.copying run return run function bw:game_start/wait_mode/enter

# 进入正常加载
function bw:game_start/final_start