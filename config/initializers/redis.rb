# Redis configuration is only used in development
if Rails.env.development?
  require 'redis'

  redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/0'

  begin
    Redis.current = Redis.new(
      url: redis_url,
      reconnect_attempts: 3,
      reconnect_delay: 0.5,
      reconnect_delay_max: 2.0
    )

    Sidekiq.configure_server do |config|
      config.redis = { 
        url: redis_url,
        reconnect_attempts: 3,
        reconnect_delay: 0.5,
        reconnect_delay_max: 2.0
      }
    end

    Sidekiq.configure_client do |config|
      config.redis = { 
        url: redis_url,
        reconnect_attempts: 3,
        reconnect_delay: 0.5,
        reconnect_delay_max: 2.0
      }
    end
  rescue Redis::CannotConnectError => e
    Rails.logger.error "Failed to connect to Redis: #{e.message}"
  end
end 
