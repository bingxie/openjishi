class ProfilesController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_profile, only: [:edit, :update, :crop, :do_crop]

  def crop
  end

  def do_crop
    profile_params = params.require(:profile)
                           .permit(:avatar, :avatar_crop_x, :avatar_crop_y,
                                   :avatar_crop_w, :avatar_crop_h)
    if @profile.update(profile_params)
      flash[:success] = "成功更新个人信息"
      redirect_to user_profile_path(current_user.slug)
    else
      render 'crop'
    end
  end

  def edit
    render layout: 'my'
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "成功更新个人信息"
      redirect_to user_setting_path(current_user.slug)
    else
      render 'edit'
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile)
          .permit(:name, :province_id, :district_id, :city_id)
  end

  def authenticate_owner!
    return if user_signed_in? && current_user.slug == params[:slug]

    flash[:alert] = "你不能更新该个人信息！"
    redirect_to root_path
  end
end
