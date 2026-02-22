# 玩家退出游戏事件

# 刷新本局信息
function bw:game/update_round_info

# 刷新资源点冷却时间
function bw:game/resource/cd_cal_trigger

# 检测是否可以结束游戏
function bw:game/team_update
execute unless score $disable_auto_ending maintenance matches 1 unless score $team_number team matches 2.. run function bw:game/game_end

# （地图接口）玩家离开
setblock -2 50 -32 minecraft:redstone_block