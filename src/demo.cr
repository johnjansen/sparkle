require "./sparkle"
require "kemal"

class SparkleTestHandler <  Kemal::Handler
  def call(env)
    pp env.sparkle
    call_next(env)
  end
end

get "/:name" do |env|
  render "src/views/hello.slang"
end

add_handler SparkleTestHandler.new
Kemal.run