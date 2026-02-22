# 读取地图数据

# 名称
$execute unless data storage bw:map maps[{"id":$(id)d}].name run data modify storage debug:map_editor/panel trigger.map_name set value {"text":"___读取失败___"}
$execute if data storage bw:map maps[{"id":$(id)d}].name run data modify storage debug:map_editor/panel trigger.map_name set from storage bw:map maps[{"id":$(id)d}].name

# 简介
$execute unless data storage bw:map maps[{"id":$(id)d}].desc run data modify storage debug:map_editor/panel trigger.desc set value {"text":"___读取失败___"}
$execute if data storage bw:map maps[{"id":$(id)d}].desc run data modify storage debug:map_editor/panel trigger.desc set from storage bw:map maps[{"id":$(id)d}].desc