execute store result storage bw:game_end xp.level int 1 run scoreboard players get @s exp
execute store result storage bw:game_end xp.point int 1 run scoreboard players get @s exp_point
function bw:global/event/exp_regain_2nd with storage bw:game_end xp