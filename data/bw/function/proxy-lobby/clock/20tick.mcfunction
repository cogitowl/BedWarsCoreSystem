# 每 20 Tick 执行一次

# 自动启动游戏
execute store result score $player_count proxy_stats if entity @a[team=lobby]
execute if score $player_count proxy_stats matches 2.. run function bw:lobby/start_game