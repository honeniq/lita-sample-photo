Lita.configure do |config|
  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.name = "lita"
  config.robot.log_level = :info
  config.robot.adapter = :idobata
  config.adapter.api_token = ''

  require './getwikipedia.rb'
end
