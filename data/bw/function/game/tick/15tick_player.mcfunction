# 每 15 Tick 执行一次
# as @a[tag=playing,tag=!afk,team=!debug] at @s

# 身上有非木剑的武器则清除初始木剑
execute store result score @s temp run clear @s #bw:combat 0
execute if score @s temp matches 1.. run clear @s wooden_sword
scoreboard players reset @s temp

# 虚空伤害（y=-128）
execute if score $void_damage gamerule matches 1 as @s[x=-200,y=-200,z=-200,dx=400,dy=72,dz=400,gamemode=survival] run damage @s 8 out_of_world
execute if score $void_damage gamerule matches 2 run damage @s[x=-200,y=-200,z=-200,dx=400,dy=72,dz=400,gamemode=survival] 100 out_of_world