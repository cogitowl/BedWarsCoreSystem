# 玩家进入时触发


# 新年快乐
execute if score @s tip_alchemy matches ..0 if score $using map matches 13 run tag @s add tip_alchemy

# bug 图
execute if score @s tip_error_not_found matches ..0 if score $using map matches 11 run tag @s add tip_error_not_found
