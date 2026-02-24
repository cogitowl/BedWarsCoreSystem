# 每 20 Tick 执行一次

# 饱和
effect give @a[scores={food=..19}] saturation 1 255 true

# 笨蛋保护器
execute as @a[team=lobby,gamemode=adventure] at @s if entity @s[y=-3,dy=-255] if block ~ ~-1 ~ air if block ~ ~-2 ~ air if block ~ ~-3 ~ air if block ~ ~-4 ~ air if block ~ ~-5 ~ air if block ~ ~-6 ~ air if block ~ ~-7 ~ air run effect give @s levitation 5 1 true