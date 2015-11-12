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

