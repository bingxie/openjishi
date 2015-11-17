class SecretController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user
  end
end
