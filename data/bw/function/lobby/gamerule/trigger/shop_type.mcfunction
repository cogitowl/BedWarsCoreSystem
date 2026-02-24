# 商店类型（0=箱子商店 1=配方 2=村民交易）
scoreboard players add $shop_type gamerule 1
execute if score $shop_type gamerule matches 3 run scoreboard players set $shop_type gamerule 0