class Store < ActiveRecord::Base
  belongs_to :user

  has_many :products

  def show_name
    self.name ||= user.profile.name
  end
end
