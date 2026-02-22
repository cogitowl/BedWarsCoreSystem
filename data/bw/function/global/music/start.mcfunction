# 开启一轮新的音乐

# 重置等待时间
scoreboard players set @s music_time -1

# 检查下一首：如果没有则添加上一次场景的曲目
execute unless score @s music_next = @s music_next run scoreboard players operation @s music_id %= $100 const 
execute unless score @s music_next = @s music_next run scoreboard players operation @s music_next = @s music_id

# 开始吧！
execute store result storage bw:global music.id int 1 run scoreboard players get @s music_next
function bw:global/music/start_random_scene with storage bw:global music