# 事件循环初始化
## 每tick都授予玩家执行指令的权限
scoreboard players enable @a command_panel

# 事件循环
## 检查是否有需要执行命令的玩家（表现为计分板项command_panel值不为0，且没有SkipExecuteCommand标签跳过执行）
tag @a[scores={command_panel=1..},tag=!SkipExecuteCommand] add IsRunningCommand
execute as @r[tag=IsRunningCommand] run function #clevi:registries/event_loop_commands_registry

# 事件循环结束
## 指令列表遍历完毕也未能执行，则自动清空
scoreboard players set @a[tag=!SkipExecuteCommand] command_panel 0