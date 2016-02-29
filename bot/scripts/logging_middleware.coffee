module.exports = (robot) ->
  robot.receiveMiddleware (context, next, done) ->
    if context.response.message != undefined and context.response.message.user != undefined and context.response.message.text != undefined and context.response.message.text?.match(robot.respondPattern(''))
      robot.logger.info "MESSAGE RECEIVED #{context.response.message.user.name} : #{context.response.message.text}"
    next()

  robot.responseMiddleware (context, next, done) ->
    if context.response.message != undefined and context.response.message.user != undefined and context.response.message.text != undefined
      sanitized_strings = x.replace(/\r?\n|\r/g, "\\n") for x in context.strings
      robot.logger.info "MESSAGE RESPONDED Hubot : #{sanitized_strings}"
    next()

