class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      session[:user_id] = user.id

      render json: {
        user: user,
        status: :created
      }
    else
      render json: { status: 500 }
    end
  end
  
  # PATCH/PUT /users/1
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
