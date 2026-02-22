# 清除资源点内容

# 操纵 NBT 
$data remove storage bw:map maps[{"id":$(id)d}].map_editor.resource.status
$data modify storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.cleared set value true
# 移除现有数据
$data remove storage bw:map maps[{"id":$(id)d}].spawner

# 弹出界面
function debug