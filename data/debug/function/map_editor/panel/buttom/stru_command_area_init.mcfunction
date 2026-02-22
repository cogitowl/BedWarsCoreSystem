# 地图指令区域 初始化

# 放置空指令区域
fill ~ ~ ~ ~ ~-1 ~ air
setblock ~ ~ ~ minecraft:structure_block[mode=load]{mode:"LOAD",name:"command_area:empty",posX:-11,posY:1,posZ:-11,sizeX:23,sizeY:48,sizeZ:23}
setblock ~ ~-1 ~ redstone_block
# fill ~ ~ ~ ~ ~-1 ~ air
setblock ~ ~-1 ~ air

# 设定方块nbt
$data modify block ~ ~ ~ name set value "command_area:$(id)"
data modify block ~ ~ ~ mode set value "SAVE"

# 写入地图数据
$data modify storage bw:map maps[{"id":$(id)d}].command_area_name set from block ~ ~ ~ name