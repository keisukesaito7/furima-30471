class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]
  before_action :redirect_to_root_path, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def redirect_to_root_path
    redirect_to root_path if current_user.id != @user.id
  end
end
