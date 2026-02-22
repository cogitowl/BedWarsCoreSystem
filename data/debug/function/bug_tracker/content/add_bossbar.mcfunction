$bossbar remove bug_tracker:$(id)
$bossbar add bug_tracker:$(id) [{"text":"漏洞追踪器 >> $(name): $(desc)"}]
$bossbar set bug_tracker:$(id) color purple
$bossbar set bug_tracker:$(id) max 1
$bossbar set bug_tracker:$(id) value 1
