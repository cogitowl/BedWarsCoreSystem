tellraw @s ["\n",{"text":" ✉  ","color":aqua},{"text":"地图恢复系统","color":aqua,"bold":true},{"text":"\n     起床战争使用无感知地图恢复系统，它会在游戏结束后默默工作...\n     它是起床战争数据包中最复杂、最难懂的自动化程序...\n"}]
scoreboard players add @s tip_map_clone 1
scoreboard players set @s tip_cd 0
tag @s remove tip_map_clone