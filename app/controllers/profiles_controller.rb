class ProfilesController < ApplicationController

  before_action :authenticate_owner!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @profile = @user.profile.decorate
  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    if @user.update(user_params)
      flash[:success] = "成功更新个人信息"
      redirect_to user_profile_path(@user.slug)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find_by_slug(params[:slug])
  end

  def user_params
    params.require(:user).permit(:name, profile_attributes: [:id, :city_id, :introduction, :mobile, :qq, :wechat, :avatar])
  end

  def authenticate_owner!
    unless user_signed_in? && current_user.slug == params[:slug]
      flash[:alert] = "你不能更新该个人信息！"
      redirect_to root_path
    end
  end
end
