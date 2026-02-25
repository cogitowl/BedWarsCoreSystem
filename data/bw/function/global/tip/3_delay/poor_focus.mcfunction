tellraw @s ["\n",{"text":" ✉  ","color":red},{"text":"状态也很重要","color":red,"bold":true},{"text":"\n     专注、专注、再专注...\n     用心、用心、再用心！\n"}]
scoreboard players add @s tip_poor_focus 1
scoreboard players set @s tip_cd 0
tag @s remove tip_poor_focus