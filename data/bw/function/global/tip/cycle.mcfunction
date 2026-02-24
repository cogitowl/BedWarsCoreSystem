# 循环提示 文件

scoreboard players add @s tip_cycle 1
scoreboard players set @s[scores={tip_cycle=2..}] tip_cycle 1

execute if score @s tip_cycle matches 1 run tellraw @s ["\n",{"text":" ✉  ","color":green},{"text":"绿色玩家，我们喜欢","color":green,"bold":true},{"text":"\n     能够让自己变成长猿臂之类的模组妥妥是作弊行为！\n     小地图之类带来一方不平衡的最好也不要用...\n"}]


# 冷却
scoreboard players set @s tip_cd 0