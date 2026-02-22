

scoreboard objectives add game_end_title_a dummy "游戏结算标题 寄存器A"
# scoreboard objectives add game_end_title_timer dummy "游戏结算标题"
scoreboard objectives add game_end_title_b dummy "游戏结算标题 寄存器B"
scoreboard objectives add game_end_title_c dummy "游戏结算标题 寄存器C"

title @a[tag=playing] times 0s 2s 3s

scoreboard players set $mode game_end_title_a 0
scoreboard players set $wait_time game_end_title_a 2