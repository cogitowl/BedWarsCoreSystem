tellraw @s ["\n",{"text":" ✉  ","color":yellow},{"text":"轻轻离开","color":"yellow","bold":true},{"text":"\n     如果有事有离开的话，请和队友说一声，然后退出服务器...\n     这样就不会影响他们的发挥了...\n"}]
scoreboard players add @s tip_don_afk 1
scoreboard players set @s tip_cd 0
tag @s remove tip_don_afk