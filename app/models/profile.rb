class Profile < ActiveRecord::Base
  DEV_FILE_PATH = ":rails_root/public/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension"
  DEV_FILE_URL = "/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension"

  belongs_to :user

  has_attached_file :avatar,
                    styles: { thumb: "100x100>", medium: "400x400>" },
                    path: DEV_FILE_PATH,
                    url: DEV_FILE_URL if Rails.env.development? || Rails.env.test?

  crop_attached_file :avatar

  # has_attached_file :avatar, :path => ":class/:attachment/:id_partition/:hash.:extension",
  #   hash_secret: '<get_use_rake_secret>' if Rails.env.staging? || Rails.env.production?

  validates_attachment :avatar, content_type: { content_type: %r{\Aimage\/.*\Z} },
                                size: { in: 0..1.megabytes }
  validates :name, length: { maximum: 20 }
end
