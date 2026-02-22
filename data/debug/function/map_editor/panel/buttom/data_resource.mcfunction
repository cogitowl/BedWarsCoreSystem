# 资源点、床设定

# 尊重前提条件: 中心点设定
$execute unless data storage bw:map maps[{"id":$(id)d}].center run return run function debug

# 状态执行: 开始放置
$execute unless data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status run return run function debug:map_editor/operation/resource_place {"id":$(id)}
$execute if data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.cleared run return run function debug:map_editor/operation/resource_place {"id":$(id)}

# 状态执行: 完成放置
$execute if data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.placing run return run function debug:map_editor/operation/resource_done {"id":$(id)}

# 状态执行: 清除数据
$execute if data storage bw:map maps[{"id":$(id)d}].map_editor.resource.status.done run return run function debug:map_editor/operation/resource_clear {"id":$(id)}