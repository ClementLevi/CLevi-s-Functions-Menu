execute as @s[scores={is_online=0}] run function #clevi:events/on_login

# *会选中包括不在线的玩家，而@a只会选择在线玩家
scoreboard players set * is_online 0
scoreboard players set @a is_online 1
