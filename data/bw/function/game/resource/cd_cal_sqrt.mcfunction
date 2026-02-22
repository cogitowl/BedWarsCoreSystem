# 开根号

## 运算
execute store result score #t1 temp store result score #t2 temp store result score #t3 temp run scoreboard players operation output.sqrt temp = input.sqrt temp
execute if score input.sqrt temp matches 0..1515359 run scoreboard players operation output.sqrt temp /= $559 const
execute if score input.sqrt temp matches 0..1515359 run scoreboard players add output.sqrt temp 15
execute if score input.sqrt temp matches 1515360.. run scoreboard players operation output.sqrt temp /= $32768 const
execute if score input.sqrt temp matches 1515360.. run scoreboard players add output.sqrt temp 2456
scoreboard players operation #t1 temp /= output.sqrt temp
scoreboard players operation output.sqrt temp += #t1 temp
scoreboard players operation output.sqrt temp /= $2 const
scoreboard players operation #t2 temp /= output.sqrt temp
scoreboard players operation output.sqrt temp += #t2 temp
scoreboard players operation output.sqrt temp /= $2 const
scoreboard players operation #t3 temp /= output.sqrt temp
scoreboard players operation output.sqrt temp += #t3 temp
scoreboard players operation output.sqrt temp /= $2 const
scoreboard players operation input.sqrt temp /= output.sqrt temp
execute if score output.sqrt temp > input.sqrt temp run scoreboard players remove output.sqrt temp 1

## 输出
scoreboard players operation $sqr temp = output.sqrt temp

## 重置 
scoreboard players reset input.sqrt temp
scoreboard players reset output.sqrt temp
scoreboard players reset #t1 temp
scoreboard players reset #t2 temp
scoreboard players reset #t3 temp
