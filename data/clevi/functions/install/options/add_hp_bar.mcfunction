scoreboard objectives add hp health
scoreboard objectives modify hp rendertype hearts
scoreboard objectives setdisplay belowName hp

# 不喜欢黄色笑话的可以改掉
scoreboard objectives modify hp displayname {"text":"cm", "color":"gold"}


# 感觉没必要放在tab里，但还是放了
scoreboard objectives setdisplay list hp