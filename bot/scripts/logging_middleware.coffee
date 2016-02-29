module.exports = (robot) ->
  robot.receiveMiddleware (context, next, done) ->
    if context.response.message != undefined and context.response.message.text?.match(robot.respondPattern(''))
      sanitized_text = context.response.message.text?.replace(/\r?\n|\r/g, "\\n")
      robot.logger.info "MESSAGE RECEIVED #{context.response.message.user.name} in #{context.response.message.room} : #{sanitized_text}"
    next()

  robot.responseMiddleware (context, next, done) ->
    if context.strings != undefined and context.response.message != undefined
      sanitized_strings = x.replace(/\r?\n|\r/g, "\\n") for x in context.strings
      robot.logger.info "MESSAGE RESPONDED Hubot in #{context.response.message.room} : #{sanitized_strings}"
    next()

