class ProfileDecorator < Draper::Decorator
  delegate_all

  def avatar_img(style = :thumb)
    if Rails.env.development? || Rails.env.test?
        h.image_tag avatar.url(style)
    else
      if style == :thumb
        size = '100x100>'
      else
        size = '300x300>'
      end

      h.image_tag qiniu_image_path(avatar.url, thumbnail: size, quality: 80)
    end
  end
end
