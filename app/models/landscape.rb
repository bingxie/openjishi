class Landscape < ActiveRecord::Base
  has_attached_file :picture, styles: { thumb: "100x100", medium: "400x400", original: "600x600" },
                              default_style: :original,
                              path: ":rails_root/public/assets/uploads/landscapes/:id_:style.:extension",
                              url: "/assets/uploads/landscapes/:id_:style.:extension",
                              processors: [:cropper]
  validates_attachment_content_type :picture, content_type: /.*/

  attr_accessor :crop_x, :crop_y, :crop_width, :crop_height

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_width.blank? && !crop_height.blank?
  end
end
