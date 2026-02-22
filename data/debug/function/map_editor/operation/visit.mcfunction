# 更新参观点

$data remove storage bw:map maps[{"id":$(id)d}].visit
$data modify storage bw:map maps[{"id":$(id)d}].visit.pos set from entity @s Pos
$data modify storage bw:map maps[{"id":$(id)d}].visit.rotation set from entity @s Rotation

function debug