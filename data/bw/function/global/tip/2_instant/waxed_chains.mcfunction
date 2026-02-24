tellraw @s ["\n",{"text":" ✉  ","color":"light_purple"},{"text":"涂蜡锁链","color":"light_purple","bold":true},{"text":"\n     或许一些锁链可以爬上去呢?\n     或许锁链还能放下去呢？\n"}]
scoreboard players add @s tip_waxed_chains 1
scoreboard players set @s tip_cd 0
tag @s remove tip_waxed_chains