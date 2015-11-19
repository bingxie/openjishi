class User < ActiveRecord::Base
  HASHIDS = Hashids.new("oh my user salt")

  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile
  before_create :build_default_profile

  validates :name, length: { maximum: 20 }
  validates :email, email: { message: :bad_email }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  # override Devise's method
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, * args).deliver_later
  end

  def set_slug
    self.slug ||= HASHIDS.encode(id).to_url
    save!
  end

  def set_name_with_email
    self.name = email.split('@').first
    save!
  end

  def build_default_profile
    build_profile
    true
  end
end
