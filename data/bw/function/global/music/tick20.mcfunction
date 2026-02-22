


# 关闭原版 BGM
stopsound @a music music.game
stopsound @a music music.creative

# 计时
execute as @a if score @s music_time = @s music_time if score @s music_time matches 1.. run scoreboard players remove @s music_time 1
execute as @a at @s if score @s music_time matches 0 run function bw:global/music/start