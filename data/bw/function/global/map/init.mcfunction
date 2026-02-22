# 全局地图系统 初始化

# 刷新统计数据
function bw:global/map/data_update_totally

# 重置恢复系统
function bw:global/map/control/reset_all

# 开始地图复制
schedule function bw:global/map/control/check 2s replace