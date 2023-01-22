JWTSessions.algorithm = "HS256"
JWTSessions.encryption_key = Rails.application.credentials.secret_jwt_encryption_key!
JWTSessions.token_store = ENV['STORE_ADAPTER'] || 'redis'
JWTSessions.access_exp_time = 10.minutes.from_now.to_i
JWTSessions.refresh_exp_time = 10.days.from_now.to_i
