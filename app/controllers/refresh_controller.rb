class RefreshController < ApplicationController
  before_action :authorize_refresh_request!

  def create
    session = JWTSessions::Session.new(payload: access_payload, refresh_payload: payload)
    tokens = session.refresh(found_token)

    render json: { csrf: tokens[:csrf], access: tokens[:access] }
  end

  def access_payload
    user = User.find(payload['user_id'])
    { user_d: user.id, email: user.email }
  end
end
