## 60: 无计分板
scoreboard objectives setdisplay sidebar

## 61: 死亡榜
team add deathCount {"text": "死亡榜", "color": "red"}
team modify deathCount color red
scoreboard objectives setdisplay sidebar.team.red deathCount

## 62：挖掘榜
#TODO:未实现
# team add mined {"text": "挖掘榜", "color": "yellow"}
# team modify mined color yellow
# scoreboard objectives setdisplay sidebar.team.yellow mined

## 63：击杀榜
team add totalKillCount {"text": "击杀榜", "color": "yellow"}
team modify totalKillCount color yellow
scoreboard objectives setdisplay sidebar.team.yellow totalKillCount

## 64：受伤榜
team add damageTaken {"text": "受伤榜", "color": "dark_red"}
team modify damageTaken color dark_red
scoreboard objectives setdisplay sidebar.team.dark_red damageTaken

## 65钓鱼榜
team add fishing {"text": "受伤榜", "color": "dark_aqua"}
team modify fishing color dark_aqua
scoreboard objectives setdisplay sidebar.team.dark_aqua fishing

## 66交易榜
team add tradeCount {"text": "交易榜", "color": "green"}
team modify tradeCount color green
scoreboard objectives setdisplay sidebar.team.green tradeCount

## 67无死亡存活时长榜
team add lifeGoesOn {"text": "受伤榜", "color": "aqua"}
team modify lifeGoesOn color aqua
scoreboard objectives setdisplay sidebar.team.aqua lifeGoesOn