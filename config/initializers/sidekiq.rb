
redis_host = Rails.application.secrets.redis && Rails.application.secrets.redis['host'] || '127.0.0.1'
redis_port = Rails.application.secrets.redis && Rails.application.secrets.redis['port'] || 6379

redis_url = "redis://#{redis_host}:#{redis_url}"

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
end


