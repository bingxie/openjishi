class User < ActiveRecord::Base
  HASHIDS = Hashids.new("oh my user salt")
  after_create :set_slug

  validates :name, presence: true

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
    hash = HASHIDS.encode(id)

    self.slug ||= "#{hash} #{name}".to_url
    save!
  end
end
