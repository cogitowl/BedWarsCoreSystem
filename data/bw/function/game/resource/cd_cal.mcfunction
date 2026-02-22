# 计算资源点冷却时间

#tellraw @a "--资源点冷却计算--"
# 计算分子

## 基准时间 * (1+游戏节奏档位) * 10 NOTE: 10是为了保留一位小数,后面需要除去
execute if entity @s[tag=res_copper] run scoreboard players set $cal res_cd 1
execute if entity @s[tag=res_iron] run scoreboard players set $cal res_cd 140
execute if entity @s[tag=res_diamond] run scoreboard players set $cal res_cd 250

#tellraw @a [" 基准时间A >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

scoreboard players operation $cal_2 res_cd = $res_pace_tier_modifiers gamerule
scoreboard players add $cal_2 res_cd 10

#tellraw @a [" 基准时间B >> ",{"score":{"name": "$cal_2","objective": "res_cd"}}]

scoreboard players operation $cal res_cd *= $cal_2 res_cd

scoreboard players reset $cal_2 res_cd

#tellraw @a [" 基准时间C >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

## result + 基础补偿
scoreboard players operation $cal_2 res_cd = $res_base_time_offset gamerule
scoreboard players operation $cal_2 res_cd *= $10 const

scoreboard players operation $cal res_cd += $cal_2 res_cd

scoreboard players reset $cal_2 res_cd

#tellraw @a [" 基础补偿 >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

## result * 缩放系数 * 100 NOTE: 100 保留两位小数, 后面需要除去
scoreboard players operation $cal res_cd *= $res_scale gamerule

#tellraw @a [" 缩放系数 >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

## result * 升级档位 NOTE: 后面需要除去100
scoreboard players operation $cal res_cd *= $upgrade res_cd

#tellraw @a [" 升级档位 >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

## result * 数量处罚, 数量处罚=sqrt(资源点数量)
## 即 result * sqrt(资源点数量)
execute if entity @s[tag=res_copper] store result score $cal_2 res_cd if entity @e[type=armor_stand,tag=res_copper]
execute if entity @s[tag=res_iron] store result score $cal_2 res_cd if entity @e[type=armor_stand,tag=res_iron]
execute if entity @s[tag=res_diamond] store result score $cal_2 res_cd if entity @e[type=armor_stand,tag=res_diamond]

#tellraw @a [" 数量处罚A >> ",{"score":{"name": "$cal_2","objective": "res_cd"}}]

scoreboard players operation input.sqrt temp = $cal_2 res_cd
function bw:game/resource/cd_cal_sqrt
scoreboard players operation $cal_2 res_cd = $sqr temp

#tellraw @a [" 数量处罚B >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

scoreboard players operation $cal res_cd *= $cal_2 res_cd

scoreboard players reset $cal_2 res_cd
scoreboard players reset $sqr temp

#tellraw @a [" 数量处罚C >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

# 计算分母 开根玩家人数
execute store result score input.sqrt temp if entity @a[team=!debug,team=!spec,tag=playing]

#tellraw @a [" 分母运算A >> ",{"score":{"name": "input.sqrt","objective": "temp"}}]

function bw:game/resource/cd_cal_sqrt
scoreboard players operation $sqr_player_count temp = $sqr temp

#tellraw @a [" 分母运算B >> ",{"score":{"name": "$sqr_player_count","objective": "temp"}}]

# 甲乙合体吧!!!....
scoreboard players operation $cal res_cd /= $sqr_player_count temp
#tellraw @a [" 分数运算A >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

scoreboard players operation $cal res_cd /= $100000 const
#tellraw @a [" 分数运算B >> ",{"score":{"name": "$cal","objective": "res_cd"}}]

# 应用计算结果
execute if entity @s[tag=res_copper] run scoreboard players operation $copper res_cd = $cal res_cd
execute if entity @s[tag=res_iron] run scoreboard players operation $iron res_cd = $cal res_cd
execute if entity @s[tag=res_diamond] run scoreboard players operation $diamond res_cd = $cal res_cd

# 重置
scoreboard players reset $cal res_cd
scoreboard players reset $sqr_player_count temp