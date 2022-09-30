# Rails by default has content-type: application/x-www-form-urlencoded.
# This middleware coerce the requests content type to application/json,
# which makes easier to parse and read the requests bodies.
class CoerceRequestContentType
  def initialize app
    @app = app
  end

  def call(env)
    env['CONTENT_TYPE'] = 'application/json'
    @app.call(env)
  end
end
