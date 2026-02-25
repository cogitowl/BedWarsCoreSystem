tellraw @s ["\n",{"text":" ✉  ","color":light_purple},{"text":"结束了？","color":light_purple,"bold":true},{"text":"\n     击败末影龙、跳入末地传送门、返回出生点...\n     物品也可以...\n"}]
scoreboard players add @s tip_the_end 1
scoreboard players set @s tip_cd 0
tag @s remove tip_the_end