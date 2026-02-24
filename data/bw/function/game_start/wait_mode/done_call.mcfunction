# 地图完成复制后 执行一次
say wait mode done_call called
execute if score $waiting game_start_mode matches 1 run function bw:game_start/wait_mode/done