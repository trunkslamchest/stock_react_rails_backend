class UsersController < ApplicationController

  def index
    @users = User.order(id: :asc)
    render json: UsersSerializer.new(@users).serialized_json
  end

  def show
    @user = User.find(params[:id])
    render json: UsersSerializer.new(@user).serialized_json
  end

  def update
    current_user = User.find(params[:id])
    user_update = current_user.update(update_user_params)
    if current_user.valid?
      render json: UsersSerializer.new(current_user).serialized_json
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    user = User.create(create_user_params)
    if user.valid?
      render json: UsersSerializer.new(user).serialized_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
	end

  private

  def update_user_params
    params.required(:user).permit(:user_name, :email, :first_name, :last_name, :gender, :birth_day, :birth_month, :birth_year, :house_number, :street_name, :city_town, :state, :zip_code)
  end

  def create_user_params
    params.permit(:avatar, :user_name, :password, :email, :first_name, :last_name, :gender, :birth_day, :birth_month, :birth_year, :house_number, :street_name, :city_town, :state, :zip_code)
  end

end
