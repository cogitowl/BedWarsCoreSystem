# 选择上一张地图

# 设定切换状态
scoreboard players set $change_mode map 1

# 选择下一张地图
scoreboard players remove $sel map 1
execute if score $sel map < $min map run scoreboard players operation $sel map = $max map

# 给处理器做共同工作
function bw:lobby/map/change/handle