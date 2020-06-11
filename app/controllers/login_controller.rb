class LoginController < ApplicationController

  def create
    user = User.find_by("lower(user_name) = ?", params[:user_name].downcase)
    if user && user.authenticate(params[:password])
      render json: { token: token(user.id), user_id: user.id, user_name: user.user_name }
    elsif params[:user_name] == "" && params[:password] == ""
        render json: {errors: {:user_name => ["User Name cannot be blank"], :password => [ "Password cannot be blank" ]}}, status: :unprocessable_entity
    elsif user && params[:password] == ""
        render json: {errors: {:password => [ "Password cannot be blank" ]}}, status: :unprocessable_entity
    elsif params[:user_name] == "" && !(params[:password].nil?)
        render json: {errors: {:user_name => ["User Name cannot be blank"], :password => [ "Invalid Password" ]}}, status: :unprocessable_entity
    elsif user && !user.authenticate(params[:password])
        render json: {errors: {:password => [ "Invalid Password" ]}}, status: :unprocessable_entity
    elsif !user && params[:password] == ""
      render json: {errors: {:user_name => ["Invalid User Name"], :password => [ "Password cannot be blank" ]}}, status: :unprocessable_entity
    elsif !user && !(params[:password].nil?)
      render json: {errors: {:user_name => ["Invalid User Name"], :password => [ "Invalid Password" ]}}, status: :unprocessable_entity
    else
      render json: {errors: {:form => ["Unspecified Login Error"]}}, status: :unprocessable_entity
    end
  end

end

#   def create
#     user = User.find_by("lower(user_name) = ?", params[:user_name].downcase)
#     if user && user.authenticate(params[:password])
#       render json: { token: token(user.id), user_id: user.id, user_name: user.user_name }
#     elsif user && !user.authenticate(params[:password])
#       render json: { errors: [ "Invalid Password" ] }, status: :unprocessable_entity
#     elsif !user
#       render json: { errors: [ "Invalid User Name" ] }, status: :unprocessable_entity
#     end
#   end
# end