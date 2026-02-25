tellraw @s ["\n",{"text":" ✉  ","color":"light_purple"},{"text":"领域... 展开！","color":light_purple,"bold":true},{"text":"\n     配方书中的配方是可以右键的\n     这样就可以查看更多配方了！\n"}]
scoreboard players add @s tip_craft_way 1
scoreboard players set @s tip_cd 0
tag @s remove tip_craft_way