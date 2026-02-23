# 游戏开始倒计时

execute unless score $start_countdown temp = $start_countdown temp run scoreboard players set $start_countdown temp 5

tellraw @a[tag=playing] ["",{"text": "[⏻] ","color": "aqua","bold": true}, {"text": "游戏还有 ","color": "aqua"},{"score":{name:"$start_countdown",objective:"temp"}},{"text": " 秒开始...","color": "aqua"}]

scoreboard players remove $start_countdown temp 1

# loop
execute if score $start_countdown temp matches 1.. run schedule function bw:game/system_init/game_start_countdown 1s replace
execute if score $start_countdown temp matches ..0 run function bw:game/system_init/game_start_countdown_end