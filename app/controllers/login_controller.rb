class LoginController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
    user = User.find_by!(email: params[:email])

    if user.authenticate(params[:password])
      refresh_payload = { user_id: user.id }
      access_payload = { user_id: user.id, email: user.email }
      session = JWTSessions::Session.new(payload: access_payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.refresh_cookie,
                          value: tokens[:refresh],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf], access: tokens[:access] }
    else
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload:)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def not_found
    render json: { error: "Email was not found" }, status: :not_found
  end
end
