class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def show
    render :json => User.find(params[:id])
  end

  def create
    @user = User.create(user_params)

    validate_and_render
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    validate_and_render
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: { deleted: true }
  end

  def email
    @available = ! User.exists?(email: params[:email])

    render json: { available: @available }
  end

  private

  def validate_and_render
    if @user.valid?
      render :json => @user
    else
      render :json => @user.errors.messages, status: 400
    end
  end

  def user_params
    params.permit(:name, :email, :sex, :birthday)
  end
end
