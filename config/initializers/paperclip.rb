if Rails.env.development? || Rails.env.test?
  storage = :filesystem
elsif Rails.env.staging?
  storage = :qiniu
  bucket = 'lensmo-test'
elsif Rails.env.production?
  storage = :qiniu
  bucket = 'lensmo-test'
end


Paperclip::Attachment.default_options[:storage] = storage
Paperclip::Attachment.default_options[:qiniu_credentials] = {
  :access_key => ENV['QINIU_ACCESS_KEY'] || raise("set env QINIU_ACCESS_KEY"),
  :secret_key => ENV['QINIU_SECRET_KEY'] || raise("set env QINIU_SECRET_KEY")
}
Paperclip::Attachment.default_options[:bucket] = bucket
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] =
  'http://7xo995.com1.z0.glb.clouddn.com'

module Paperclip
  class Cropper < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      @current_geometry.width  = target.crop_width
      @current_geometry.height = target.crop_height
    end

    def target
      @attachment.instance
    end

    def transformation_command
      # Don't cropper the original picture
      original_size = "\"" + target.picture.styles[:original].geometry + "\""

      crop_command = (!super.include?(original_size) && target.cropping?) ? [
        "-crop",
        "#{target.crop_width}x" \
          "#{target.crop_height}+" \
          "#{target.crop_x}+" \
          "#{target.crop_y}",
        "+repage"
      ] : []
      crop_command + super
    end
  end
end
