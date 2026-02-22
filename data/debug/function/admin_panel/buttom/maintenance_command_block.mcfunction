# 维护通知
scoreboard players add $disable_command_block maintenance 1
execute if score $disable_command_block maintenance matches 2.. run scoreboard players set $disable_command_block maintenance 0

execute if score $disable_command_block maintenance matches 1 run gamerule command_blocks_work true
execute if score $disable_command_block maintenance matches 0 run gamerule command_blocks_work false

function debug