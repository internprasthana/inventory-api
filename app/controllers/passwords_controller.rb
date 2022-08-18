class PasswordsController < ApplicationController

#Resets Password
  def update

    user = User.find_by(email: params[:email],emp_id: params[:emp_id])

    if user.present?
      if user.reset_password!(params[:password])
        render json: {status: 'Password Resets successfully'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  'Email and Employee Id Not Valid'}, status: :not_found
    end
  end

end
