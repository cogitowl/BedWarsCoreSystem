# 每 1 Tick 执行一次（id=1）

# 生成铁砧雨
execute as @e[type=marker,tag=summon_center,limit=1] at @s run summon minecraft:falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:anvil",Properties:{facing:"north"}},Time:1,Tags:["anvil_rain"]}
execute as @e[type=marker,tag=summon_center,limit=1] at @s run summon minecraft:falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:anvil",Properties:{facing:"north"}},Time:1,Tags:["anvil_rain"]}
execute as @e[type=marker,tag=summon_center,limit=1] at @s run summon minecraft:falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:anvil",Properties:{facing:"north"}},Time:1,Tags:["anvil_rain"]}
execute as @e[type=marker,tag=summon_center,limit=1] at @s run summon minecraft:falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:anvil",Properties:{facing:"north"}},Time:1,Tags:["anvil_rain"]}
execute as @e[type=marker,tag=summon_center,limit=1] at @s run summon minecraft:falling_block ~ ~50 ~ {BlockState:{Name:"minecraft:anvil",Properties:{facing:"north"}},Time:1,Tags:["anvil_rain"]}

execute as @e[type=falling_block,tag=anvil_rain,tag=!projectile_checked] at @s run function bw:game_end/special_effect/anvil_rain/anvil_entity_init

# 清理实体
kill @e[type=item]