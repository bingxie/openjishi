class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file  :avatar, :styles => {:thumb => "100x100>", :medium => "300x300>"},
                               :path   => ":rails_root/public/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension",
                               :url    => "/assets/uploads/:class/:attachment/:id_partition/:id_:style.:extension" if Rails.env.development? || Rails.env.test?

  crop_attached_file :avatar

  # has_attached_file :avatar, :path => ":class/:attachment/:id_partition/:hash.:extension",
  #   hash_secret: '<get_use_rake_secret>' if Rails.env.staging? || Rails.env.production?

  validates_attachment :avatar, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..1.megabytes }
end
