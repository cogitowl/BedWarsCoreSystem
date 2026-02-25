# 玩家复活事件（复活等待完成后）

# 数据控制
title @s times 10 70 20 
gamemode survival @s
scoreboard players set @s respawn_time -1

# 发送提示
title @s clear

# 效果控制
effect clear @s
effect give @s resistance 5 255

# 给予初始装备
function bw:game/default_kit

# 重新进入地图
function bw:game/map/enter

# 给予周边玩家提示
execute if entity @s[team=red] at @s as @a[distance=0.1..20,team=!red,tag=playing,scores={tip_birth_invincible=..0}] run tag @s add tip_birth_invincible
execute if entity @s[team=green] at @s as @a[distance=0.1..20,team=!green,tag=playing,scores={tip_birth_invincible=..0}] run tag @s add tip_birth_invincible
execute if entity @s[team=blue] at @s as @a[distance=0.1..20,team=!blue,tag=playing,scores={tip_birth_invincible=..0}] run tag @s add tip_birth_invincible
execute if entity @s[team=yellow] at @s as @a[distance=0.1..20,team=!yellow,tag=playing,scores={tip_birth_invincible=..0}] run tag @s add tip_birth_invincible
