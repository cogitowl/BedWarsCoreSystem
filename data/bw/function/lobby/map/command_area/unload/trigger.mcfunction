# 尝试卸载指令区

# 命令方块禁用则跳过
execute if score $disable_command_block maintenance matches 0 run return run function bw:lobby/map/command_area/unload/done

# 响应
data modify block -8 50 -31 powered set value 0b
setblock -8 50 -32 air
setblock -8 50 -32 redstone_block

# 超时响应
schedule function bw:lobby/map/command_area/unload/out_time 2s append