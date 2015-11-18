class User < ActiveRecord::Base
  HASHIDS = Hashids.new("oh my user salt")
  # after_create :set_slug

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

  # # TODO: use another callback 'after_create' bug
  # # Devise callback
  # def after_confirmation
  #   set_slug
  # end

  private

  def set_slug
    hash = HASHIDS.encode(id)

    self.slug ||= "#{hash} #{name}".to_url
    save!
  end

  def build_default_profile
    build_profile
    true
  end
end
