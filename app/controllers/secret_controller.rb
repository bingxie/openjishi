class SecretController < ApplicationController
  before_filter :authenticate_user!

  def show
    current_user
  end
end
