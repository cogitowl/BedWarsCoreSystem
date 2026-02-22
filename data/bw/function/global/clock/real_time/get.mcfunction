# 获得真实时间

# data get block 0 314 0 LastOutput.text

data remove storage bw:global clock.real_time

data modify storage bw:global clock.real_time.target set from block 0 314 0 LastOutput.text
data modify storage bw:global clock.real_time.char.hour set string storage bw:global clock.real_time.target 1 3
data modify storage bw:global clock.real_time.char.min set string storage bw:global clock.real_time.target 4 6
data modify storage bw:global clock.real_time.char.sec set string storage bw:global clock.real_time.target 7 9

function bw:global/clock/real_time/get_macro with storage bw:global clock.real_time.char

