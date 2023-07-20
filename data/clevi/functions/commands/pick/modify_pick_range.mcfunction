# CMD: 50[-] 51[+]
say hi

# 上下限使用if子命令规定
execute as @s[scores={command_panel=51}] if score @s pick_range matches ..14 run scoreboard players add @s pick_range 2
execute as @s[scores={command_panel=50}] if score @s pick_range matches 6.. run scoreboard players remove @s pick_range 2

# 涉及状态切换，刷新菜单UI
execute as @s run function clevi:apis/refresh_ui_menu

# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand
