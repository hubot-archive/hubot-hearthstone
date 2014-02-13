# Description:
#   Returns a Hearthstone cards's stats
#
# Dependencies:
#   None
#
# Commands:
#   @<Hearthstone card> - Return <Hearthstone card>'s stats: name - mana - race - type - attack/hlth - descr
#
# Author:
#   sylturner
#

module.exports = (robot) ->

  robot.getByName = (json, name) ->
    json.filter (card) ->
      card.name.toLowerCase() is name.toLowerCase()

  robot.hear /^@(.+)/, (msg) ->
    msg.http('http://hearthstonecards.herokuapp.com/hearthstone.json').get() (err, res, body) ->
      data = JSON.parse(body)
      card = robot.getByName(data, msg.match[1])
      robot.sendCard(card, msg)
      #if found.length > 0
        #msg.send "#{found[0].name} - Mana: #{found[0].mana} - Race: #{found[0].race} - Type: #{found[0].type} - Attack/Health: #{found[0].attack}/#{found[0].health} - Descr: #{found[0].descr}"
      #else
        #msg.send "I can't find that card"

  robot.sendCard = (card, msg) ->
    if card.length > 0
      msg.send "#{card[0].name} - Mana: #{card[0].mana} - Race: #{card[0].race} - Type: #{card[0].type} - Attack/Health: #{card[0].attack}/#{card[0].health} - Descr: #{card[0].descr}"
    else
      msg.send "I can't find that card"
