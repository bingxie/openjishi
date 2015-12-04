class Store < ActiveRecord::Base
  belongs_to :user

  def show_name
    self.name ||= user.profile.name
  end
end
