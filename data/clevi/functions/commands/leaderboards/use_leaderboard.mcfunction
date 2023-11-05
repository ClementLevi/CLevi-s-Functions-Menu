# CMD: 6*

# 设置计分板项
## 60: 无计分板
execute as @s[tag=IsRunningCommand, scores={command_panel=60}] run team leave @s
## 61: 死亡榜
execute as @s[tag=IsRunningCommand, scores={command_panel=61}] run team join deathCount
## 62: 挖掘榜
# execute as @s[tag=IsRunningCommand, scores={command_panel=62}] run team join mined

## 63: 击杀榜
execute as @s[tag=IsRunningCommand, scores={command_panel=63}] run team join totalKillCount
## 64: 受伤榜
execute as @s[tag=IsRunningCommand, scores={command_panel=64}] run team join damageTaken
## 65: 钓鱼榜
execute as @s[tag=IsRunningCommand, scores={command_panel=65}] run team join fishing
## 66: 交易榜
execute as @s[tag=IsRunningCommand, scores={command_panel=66}] run team join tradeCount
## 67: 无死亡存活时长榜
execute as @s[tag=IsRunningCommand, scores={command_panel=67}] run team join lifeGoesOn

# Exit Function
scoreboard players set @s command_panel 0
tag @s remove IsRunningCommand