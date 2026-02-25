tellraw @s ["\n",{"text":" ✉  ","color":light_purple},{"text":"急救平台","color":light_purple,"bold":true},{"text":"\n     急救平台能够在掉虚空前召唤一个临时平台\n     在后期经常使用，以备不时之需....\n"}]
scoreboard players add @s tip_emergency_platform 1
scoreboard players set @s tip_cd 0
tag @s remove tip_emergency_platform