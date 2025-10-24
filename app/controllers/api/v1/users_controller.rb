class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: serialized(@user, UserSerializer), status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: serialized(@user, UserSerializer), status: :created
    else
      render json: { message: "Error al crear el usuario" }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: {message: "Usuario eliminado correctamente"}, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
