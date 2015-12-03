class User < ActiveRecord::Base
  HASHIDS = Hashids.new("oh my user salt")

  has_one :profile, dependent: :destroy, autosave: true
  has_one :store, dependent: :destroy, autosave: true

  before_create :build_default_profile

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
    slug = HASHIDS.encode(id).to_url
    update_attributes(slug: slug)
  end

  def set_name_with_email
    profile.name = email.split('@').first
    profile.save!
  end

  def build_default_profile
    build_profile
    true
  end
end
