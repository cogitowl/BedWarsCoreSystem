# 对应地图完成复制
say wait mode done called

# 移除锁定标签
data remove storage bw:map using.lock.copying

# 进入正常加载
function bw:game_start/final_start