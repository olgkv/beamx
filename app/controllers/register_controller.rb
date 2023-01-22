class RegisterController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      payload = { user_id: user.id, email: user.email }
      session = JWTSessions::Session.new(payload:)
      tokens = session.login

      response.set_cookie(JWTSessions.refresh_cookie,
                          value: tokens[:refresh],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf], access: tokens[:access]  }
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
