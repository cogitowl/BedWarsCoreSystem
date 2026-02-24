data modify entity @s Owner set from entity @p UUID
data modify entity @s Tame set value 1b
data modify entity @s equipment set value {saddle: {id: "minecraft:saddle", count: 1}, body: {id: "minecraft:golden_horse_armor", count: 1}}

tag @s add holding_spear

ride @p mount @s