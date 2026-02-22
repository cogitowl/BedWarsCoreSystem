# 初始化

setblock 0 314 0 repeating_command_block{auto:true,Command:"help fill",} replace

scoreboard objectives remove real_time
scoreboard objectives add real_time dummy "真实时间计算"

