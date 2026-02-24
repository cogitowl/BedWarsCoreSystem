# 每 20 Tick 执行一次

execute if score $working game_end_title_a matches 1 run function bw:game_end/round_to_career/tick20

execute if score $timer game_end_mode matches 1.. run scoreboard players remove $timer game_end_mode 1
execute if score $timer game_end_mode matches 0 run function bw:game_end/game_end_3

execute if score $timer game_end_mode matches 1..10 run tellraw @a[tag=playing] [{"text":"地图将在 ","color":"aqua"},{"score":{"name":"$timer","objective":"game_end_mode"},"color":"white"},{"text":" 秒后开始清理！","color":"aqua"}]