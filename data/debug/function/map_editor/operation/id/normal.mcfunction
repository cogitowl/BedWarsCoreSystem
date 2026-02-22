scoreboard players operation $map_id map_editor_temp = $max map
scoreboard players add $map_id map_editor_temp 1

$execute store result storage $(storage) $(nbt).id double 1 run scoreboard players get $map_id map_editor_temp