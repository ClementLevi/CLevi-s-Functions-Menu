# HP Bar
    scoreboard objectives add hp health
    scoreboard objectives modify hp rendertype hearts
    scoreboard objectives setdisplay belowName hp

    # 不喜欢黄色笑话的可以改掉
    scoreboard objectives modify hp displayname {"text":"cm", "color":"gold"}


    # 感觉没必要放在tab里，但还是放了
    scoreboard objectives setdisplay list hp

# 俺も顽张らないと
    scoreboard objectives add deathCount deathCount {"text": "道は続く","color": "red"}

#TODO: 未实现
# 肝
    # scoreboard objectives add mined minecraft.mined "手刨大师"

# 杀杀杀
    # 天生万物以养人，世人犹怨天不仁。
    # 不知蝗蠹遍天下，苦尽苍生尽王臣。
    # 人之生矣有贵贱，贵人长为天恩眷。
    # 人生富贵总由天，草民之穷由天谴。
    # 忽有狂徒夜磨刀，帝星飘摇荧惑高。
    # 翻天覆地从今始，杀人何须惜手劳。
    # 不忠之人曰可杀！不孝之人曰可杀！
    # 不仁之人曰可杀！不义之人曰可杀！
    # 不礼不智不信人，大西王曰杀杀杀！
    # 我生不为逐鹿来，都门懒筑黄金台，
    # 状元百官都如狗，总是刀下觳觫材。
    # 传令麾下四王子，破城不须封刀匕。
    # 山头代天树此碑，逆天之人立死跪亦死！
    scoreboard objectives add totalKillCount totalKillCount {"text": "献忠再世","color": "yellow"}

# 抖M来了，快跑快跑快跑
    scoreboard objectives add damageTaken custom:damage_taken {"text": "抖M得分","color": "dark_red"}

# 钩直饵咸
    scoreboard objectives add fishing custom:fish_caught {"text": "钩直饵咸","color": "dark_aqua"}

# 交♂易
    scoreboard objectives add tradeCount custom:traded_with_villager {"text": "交♂易","color": "green"}

# 为你续一秒
    # 昔人已乘黄鹤去 @2022.11.30
    scoreboard objectives add lifeGoesOn custom:time_since_death {"text": "续了几秒","color": "aqua"}