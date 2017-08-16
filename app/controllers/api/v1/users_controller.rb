class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    if user.save
      created_jwt = issue_token(id: user.id)
      render json: { username: user.username, jwt: created_jwt }
    else
      render json: { errors: user.errors.full_messages }
   end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: { user: user }
  end

  def show
    render json: { user: User.find(params[:id]) }
  end

  def index
    render json: { user: User.all }
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
