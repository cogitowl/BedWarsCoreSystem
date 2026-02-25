tellraw @s ["\n",{"text":" ✉  ","color":light_purple},{"text":"铁丝网！恶心！","color":light_purple,"bold":true},{"text":"\n     不要被铁丝网缠到...！\n     别问我怎么知道的...\n"}]
scoreboard players add @s tip_don_touch_that 1
scoreboard players set @s tip_cd 0
tag @s remove tip_don_touch_that