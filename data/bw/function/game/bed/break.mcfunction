# 玩家拆床检测
# 开始遍历！awa

# 破坏自家的床
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_blue=1..},team=blue] run function bw:game/bed/break_trigger_own
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_red=1..},team=red] run function bw:game/bed/break_trigger_own
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_green=1..},team=green] run function bw:game/bed/break_trigger_own
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_yellow=1..},team=yellow] run function bw:game/bed/break_trigger_own

# 破坏其他人的床
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_blue=1..},team=!blue] run function bw:game/bed/break_trigger
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_red=1..},team=!red] run function bw:game/bed/break_trigger
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_yellow=1..},team=!yellow] run function bw:game/bed/break_trigger
execute if score $bed_break_check gamerule matches 1 as @s[scores={break_green=1..},team=!green] run function bw:game/bed/break_trigger

# 破坏床
execute unless score $bed_break_check gamerule matches 1 as @s[scores={break_blue=1..}] run function bw:game/bed/break_trigger
execute unless score $bed_break_check gamerule matches 1 as @s[scores={break_red=1..}] run function bw:game/bed/break_trigger
execute unless score $bed_break_check gamerule matches 1 as @s[scores={break_yellow=1..}] run function bw:game/bed/break_trigger
execute unless score $bed_break_check gamerule matches 1 as @s[scores={break_green=1..}] run function bw:game/bed/break_trigger

# 重置
scoreboard players reset @s break_blue
scoreboard players reset @s break_green
scoreboard players reset @s break_red
scoreboard players reset @s break_yellow

# sys event
execute if score $red_bed team matches 2 if score $green_bed team matches 2 if score $blue_bed team matches 2 if score $yellow_bed team matches 2 if score $red_bed team matches 2 run function bw:game/system_event/all_bed_break