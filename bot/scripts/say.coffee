# Description:
#   For sending anonymous messages
#
# Configuration:
#
# Commands:
#   hubot say (something) to (someone|channel) - adds the groceries to cart if they are in stock
#
# Notes:
#
# Author:
#   mohamedbassem

module.exports = (robot) ->
  robot.respond /say (.*) to ([^\s]*)/i , (res) ->
    message = res.match[1]
    room = res.match[2]
    robot.send {room: room}, message
    res.reply "Sent!"
