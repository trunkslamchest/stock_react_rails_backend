class LoginController < ApplicationController

  def create
    user = User.find_by("lower(user_name) = ?", params[:user_name].downcase)
    if user && user.authenticate(params[:password])
      render json: { token: token(user.id), user_id: user.id, user_name: user.user_name }
    elsif user && !user.authenticate(params[:password])
      render json: { errors: [ "Error: Invalid Password" ] }, status: :unprocessable_entity
    elsif !user
      render json: { errors: [ "Error: Invalid User Name" ] }, status: :unprocessable_entity
    end
  end

end
