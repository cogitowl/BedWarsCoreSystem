# 玩家初始装备

# 护甲

item replace entity @s[nbt=!{Inventory:[{Slot:103b}]},team=blue] armor.head with leather_helmet[unbreakable={},enchantments={binding_curse:1},dyed_color=3772876]
item replace entity @s[nbt=!{Inventory:[{Slot:103b}]},team=red] armor.head with leather_helmet[unbreakable={},enchantments={binding_curse:1},dyed_color=13515579]
item replace entity @s[nbt=!{Inventory:[{Slot:103b}]},team=green] armor.head with leather_helmet[unbreakable={},enchantments={binding_curse:1},dyed_color=5749079]
item replace entity @s[nbt=!{Inventory:[{Slot:103b}]},team=yellow] armor.head with leather_helmet[unbreakable={},enchantments={binding_curse:1},dyed_color=14738018]

item replace entity @s[nbt=!{Inventory:[{Slot:102b}]}] armor.chest with leather_chestplate[unbreakable={}] 1
item replace entity @s[nbt=!{Inventory:[{Slot:101b}]}] armor.legs with leather_leggings[unbreakable={}] 1
item replace entity @s[nbt=!{Inventory:[{Slot:100b}]}] armor.feet with leather_boots[unbreakable={}] 1

# 武器
clear @s wooden_sword
execute store success score @s temp run clear @s #bw:combat 0
execute unless score @s temp matches 1.. run give @s wooden_sword[unbreakable={},custom_data={disabled_throw:true}] 1
scoreboard players reset @s temp

# 基础资源
execute if score $shop_type gamerule matches 1 run give @s stick 6