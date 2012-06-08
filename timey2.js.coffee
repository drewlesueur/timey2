class window.Timey2
  constructor: ->

  run: ->
    @date = new Date()
    console.log "timey at #{@date.getMinutes()}"
    window.webkitNotifications.createNotification('', 'timey2', 'Time!').show()
    setTimout (=> @run), @milliseconds_to_wait()

  milliseconds_to_wait: ->
    1000 * @seconds_to_wait()

  seconds_to_wait: ->
    (60 * @minutes_to_next_quarter()) + @seconds_left_till_minute()

  minutes_to_next_quarter: ->
    15 - (@date.getMinutes() % 15)

  seconds_left_till_minute: ->
    60 - @date.getSeconds()
