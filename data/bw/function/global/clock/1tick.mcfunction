# 每 1 Tick 执行一次
schedule function bw:global/clock/1tick 1t replace

# 状态执行
execute if score $working gaming matches 0 run function bw:lobby/tick1
execute if score $working gaming matches 1 run function bw:game/tick/1tick
execute if score $working gaming matches 2 run function bw:game_end/tick1

# tps
function bw:global/clock/tps_check/tick1
execute if score $tps tps matches ..19 run title @a[tag=debug] actionbar ["tps lower:",{"score":{objective:"tps",name:"$tps"}}]