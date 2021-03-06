class ProfilesController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_profile, only: [:edit, :update, :crop, :upload]

  def crop
    profile_params = params.require(:profile)
                           .permit(:crop_x, :crop_y,
                                   :crop_width, :crop_height)

    if @profile.update(profile_params)
      @profile.avatar.reprocess!

      flash[:success] = "成功更新头像"
      redirect_to user_setting_path(current_user.slug)
    else
      flash[:alert] = "更新头像失败"
    end
  end

  def edit
    render layout: 'my'
  end

  def upload
    profile_params = params.require(:profile)
                           .permit(:avatar)
    respond_to do |format|
      @profile.update(profile_params)
      format.js {}
    end
  end

  def update
    @profile.update(profile_params)
    respond_to do |format|
      format.js {}
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
