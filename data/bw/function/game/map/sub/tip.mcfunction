# 提示文本

# 中央砖场
execute as @a[x=8997,y=2,z=1008,distance=..10] if entity @s[scores={tip_waxed_chains=..0}] run tag @s add tip_waxed_chains

# 新的世界
execute as @a[x=19000,y=6,z=999,distance=..25] if entity @s[scores={tip_the_end=..0}] run tag @s add tip_the_end

# 中央砖场
execute as @a[x=9000,y=2,z=1000,distance=..30] if entity @s[scores={tip_conveyor_belt=..0}] run tag @s add tip_conveyor_belt