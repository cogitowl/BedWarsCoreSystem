tellraw @s ["\n",{"text":" ✉  ","color":light_purple},{"text":"砖场重地、闲人勿入","color":light_purple,"bold":true},{"text":"\n     传送带可以传输物品、生物...\n     还有你！\n"}]
scoreboard players add @s tip_conveyor_belt 1
scoreboard players set @s tip_cd 0
tag @s remove tip_conveyor_belt