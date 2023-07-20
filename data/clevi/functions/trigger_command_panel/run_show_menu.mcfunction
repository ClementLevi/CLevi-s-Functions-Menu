execute as @r[tag=IsRunningCommand, scores={command_panel=1}] run function clevi:commands/show_menu
# 需要刷新UI的也通过这里调用
execute as @r[tag=refreshUI] run function clevi:commands/show_menu