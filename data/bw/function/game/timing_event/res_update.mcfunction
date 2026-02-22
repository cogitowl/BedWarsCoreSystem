# 资源点升级

# 等级 1
execute if score $now timing = $res_update_1 timing run scoreboard players set $upgrade res_cd 70

# 等级 2
execute if score $now timing = $res_update_2 timing run scoreboard players set $upgrade res_cd 50

# 等级 3
execute if score $now timing = $res_update_3 timing run scoreboard players set $upgrade res_cd 30

# 刷新资源点冷却时间
function bw:game/resource/cd_cal_trigger

# 刷新 Bossbar 玩家
schedule function bw:game/bossbar_player 25t replace