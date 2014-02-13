# hubot-hearthstone

Get the stats for a [Hearthstone](http://us.battle.net/hearthstone/en/) card through Hubot

[![Build Status](https://travis-ci.org/sylturner/hubot-hearthstone.png?branch=master)](https://travis-ci.org/sylturner/hubot-hearthstone)

Commands
-----
```
@<Hearthstone card> - Return <Hearthstone card>'s stats: name - mana - race - type - attack/hlth - descr
@more <Hearthstone card> - Return more info about <Hearthstone card> stats: name - mana - race - type - attack/hlth - descr
```

Examples
-----
```
@edwin vancleef
<hubot> Edwin VanCleef - Mana: 3 - Race: None - Type: Minion - Attack/Health: 2/2 - Descr: Combo: Gain +2/+2 for each card played earlier this turn.
@more edwin vancleef
<hubot> Edwin VanCleef - Mana: 3 - Race: None - Type: Minion - Attack/Health: 2/2 - Descr: Combo: Gain +2/+2 for each card played earlier this turn.
<hubot> Flavor: He led the Stonemasons in the reconstruction of Stormwind, and when the nobles refused to pay, he founded the Defias Brotherhood to, well, deconstruct Stormwind. 
<hubot> http://hearthstonecards.herokuapp.com/cards/medium/EX1_613.png 
```
