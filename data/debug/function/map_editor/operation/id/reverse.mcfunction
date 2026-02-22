scoreboard players operation $map_id map_editor_temp = $min map
scoreboard players remove $map_id map_editor_temp 1

$execute store result storage $(storage) $(nbt).id double 1 run scoreboard players get $map_id map_editor_temp