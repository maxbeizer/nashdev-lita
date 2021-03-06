require 'dotenv'

Dotenv.tap do |de|
  # load contents of file at LITA_ENV, useful for production
  de.load(ENV['LITA_ENV']) if ENV['LITA_ENV']
  # load contents of .env from current directory, useful for development
  de.load
end

Lita.configure do |config|
  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  config.robot.log_level = ENV['LOG_LEVEL'].intern

  # How you interact, either shell or slack
  config.robot.adapter = ENV['LITA_ADAPTER'].intern

  # Config for slack adapter
  config.adapters.slack.token = ENV['SLACK_TOKEN']

  # Config for shell adapter
  config.robot.name = ENV['LITA_NAME']

  # Redis
  config.redis.host = ENV['REDIS_HOST']
  config.redis.port = ENV['REDIS_PORT']

  # weather
   config.handlers.weather.api_key = ENV['WUNDERGROUND_KEY']

   # directions
   config.handlers.directions.google_api_key = ENV["GOOGLE_KEY"]

   # time
   config.handlers.time.apikey =  ENV["WWO_KEY"]

   # image search
   config.handlers.google_images.google_cse_id = ENV["GOOGLE_CSE_ID"]
   config.handlers.google_images.google_cse_key = ENV["GOOGLE_KEY"]

   # nashdev resources
   config.handlers.nashdev_resources.issue_token = ENV['RESOURCE_ISSUE_TOKEN']
end

