# 每 20 Tick 执行一次

execute if score $wait_time game_end_title_a matches 1.. run scoreboard players remove $wait_time game_end_title_a 1
execute if score $wait_time game_end_title_a matches 0 run function bw:game_end/round_to_career/next