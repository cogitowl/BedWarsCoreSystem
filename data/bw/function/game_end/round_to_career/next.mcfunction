scoreboard players add $mode game_end_title_a 1

tellraw @a {"score":{name:"$mode",objective:"game_end_title_a"}}
execute if score $mode game_end_title_a matches 1 run function bw:game_end/round_to_career/scene_exp
execute if score $mode game_end_title_a matches 2 run function bw:game_end/round_to_career/scene_coin
execute if score $mode game_end_title_a matches 3 run function bw:game_end/round_to_career/scene_stat
execute if score $mode game_end_title_a matches 4 run function bw:game_end/round_to_career/end