tellraw @s ["\n",{"text":" ✉  ","color":aqua},{"text":"还有智斗？","color":aqua,"bold":true},{"text":"\n     任何玩家出生后有 5 秒无敌时间\n     这个期间不宜久留，不要招惹他们！\n"}]
scoreboard players add @s tip_birth_invincible 1
scoreboard players set @s tip_cd 0
tag @s remove tip_birth_invincible