class ImageBoolean < ApplicationRecord
  has_attached_file :image,
    styles: { medium: "92x92#", thumb: "32x32#" },
    default_url: '/default/images/users/:style/no-image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def to_hash
    {
      content:  content,
      image:    image.try(:url),
      option_a: option_a,
      option_b: option_b,
      answer:   answer
    }
  end
end
