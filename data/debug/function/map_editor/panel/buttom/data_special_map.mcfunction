# 特殊地图设定

# 设定为特殊地图
$execute unless data storage bw:map maps[{"id":$(id)d}].additional.special_map.on run return run function debug:map_editor/operation/special_map_on {"id":$(id)}

# 取消设定
$execute if data storage bw:map maps[{"id":$(id)d}].additional.special_map.on run return run function debug:map_editor/operation/special_map_off {"id":$(id)}