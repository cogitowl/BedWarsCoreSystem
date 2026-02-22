# F3 调试界面
scoreboard players add $system_f3 debug 1
execute if score $system_f3 debug matches 2.. run scoreboard players set $system_f3 debug 0
function debug

execute if score $system_f3 debug matches 0 run gamerule reduced_debug_info true
execute if score $system_f3 debug matches 1 run gamerule reduced_debug_info false