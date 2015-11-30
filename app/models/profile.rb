class Profile < ActiveRecord::Base
  DEV_FILE_PATH = ":rails_root/public/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension"
  DEV_FILE_URL = "/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension"

  belongs_to :user

  has_attached_file :avatar,
                    styles: { thumb: "100x100>", medium: "400x400>", original: "600x600" },
                    default_url: "/assets/uploads/default_avatar.png",
                    path: DEV_FILE_PATH,
                    url: (DEV_FILE_URL if Rails.env.development? || Rails.env.test?),
                    processors: [:cropper]

  # has_attached_file :avatar, :path => ":class/:attachment/:id_partition/:hash.:extension",
  #   hash_secret: '<get_use_rake_secret>' if Rails.env.staging? || Rails.env.production?

  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
  validates_attachment_size :avatar, less_than: 1.megabytes

  validates :name, length: { maximum: 20 }

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_width.blank? && !crop_height.blank?
  end
end
