# 切换场景
# 1=low ; 2=medium; 3=high

# 在场景中随机挑选
$scoreboard players set @s music_id $(id)
scoreboard players operation @s music_id *= $100 const

execute store result score $random music_id run random value 1..5

$execute if score $2 const matches $(id) run scoreboard players operation $random music_id %= $3 const
$execute if score $3 const matches $(id) run scoreboard players operation $random music_id %= $4 const

scoreboard players operation @s music_id += $random music_id

# 传入歌曲 请求切换
execute store result storage bw:global music.id int 1 run scoreboard players get @s music_id
function bw:global/music/start_song with storage bw:global music

# 重置
scoreboard players reset $random music_id