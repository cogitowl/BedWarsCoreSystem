tellraw @s ["\n",{"text":" ✉  ","color":aqua},{"text":"食物也很重要","color":aqua,"bold":true},{"text":"\n     在这里，你会感受到饥饿...\n     不要忘记买食物..!\n"}]
scoreboard players add @s tip_food_is_important 1
scoreboard players set @s tip_cd 0
tag @s remove tip_food_is_important