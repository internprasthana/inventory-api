class AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: @user, status: :ok
    else
      render json: { error: 'invalid email or password' }, status: :unauthorized
    end
  end

  private
  def login_params
    params.permit(:email, :password_digest)
  end
end
