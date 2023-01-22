
redis_host = Rails.application.secrets.redis && Rails.application.secrets.redis['host'] || '127.0.0.1'
redis_port = Rails.application.secrets.redis && Rails.application.secrets.redis['port'] || 6379

Redis.new(host: redis_host, port: redis_port.to_i)
