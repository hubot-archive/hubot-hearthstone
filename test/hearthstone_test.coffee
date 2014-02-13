chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hearthstone', ->
  beforeEach ->
    @robot =
      hear: sinon.spy()
    @msg =
      send: sinon.spy()
    @json = [
      {
        "name": "Edwin VanCleef",
        "rarity": "Legendary",
        "type": "Minion",
        "race": "None",
        "hero": "Rogue",
        "mana": 3,
        "attack": 2,
        "health": 2,
        "descr": "Combo: Gain +2\/+2 for each card played earlier this turn.",
        "image": "EX1_613",
        "flavorText": "He led the Stonemasons in the reconstruction of Stormwind, and when the nobles refused to pay, he founded the Defias Brotherhood to, well, deconstruct Stormwind."
      },
      {
        "name": "Perdition's Blade",
      "rarity": "Rare",
      "type": "Weapon",
      "race": "None",
      "hero": "Rogue",
      "mana": 3,
      "attack": 2,
      "health": 0,
      "descr": "Battlecry: Deal 1 damage. Combo: Deal 2 instead.",
      "image": "EX1_133",
      "flavorText": "Perdition's Blade is Ragnaros's back-up weapon while Sulfuras is in the shop."
      }]

    require('../src/hearthstone')(@robot)

  describe "getByName", ->
    it "should get a card by the name", ->
      expect(@robot.getByName(@json, "edwin vancleef")[0]).to.equal(@json[0])
    it "should return nothing if the card doesn't exist", ->
      expect(@robot.getByName(@json, "not a real card").length).to.equal(0)

  describe "hear", ->
    it "should hear starting with the @ symbol", ->
      expect(@robot.hear).to.have.been.calledWith(/^@some card/)

  describe "sendCard", ->
    it "should send a message with the found card's stats", ->
      @robot.sendCard([@json[0]], @msg)
      expect(@msg.send).to.have.been.calledWith("#{@json[0].name} - Mana: #{@json[0].mana} - Race: #{@json[0].race} - Type: #{@json[0].type} - Attack/Health: #{@json[0].attack}/#{@json[0].health} - Descr: #{@json[0].descr}")
    it "should send a friendly message when it can't find a card", ->
      @robot.sendCard([], @msg)
      expect(@msg.send).to.have.been.calledWith("I can't find that card")
