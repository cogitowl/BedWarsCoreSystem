# 玩家死亡后出局
scoreboard players reset @s respawn_time
title @s title "出局"
title @s subtitle "我们没有了床，也再也没有了机会"
function bw:game/player_event/spec_join