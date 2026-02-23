# 选择下一张地图

# 设定切换状态
scoreboard players set $change_mode map 2

# 选择下一张地图
scoreboard players add $sel map 1
execute if score $sel map > $max map run scoreboard players operation $sel map = $min map

# 给处理器做共同工作
function bw:lobby/map/change/handle