class ImageQuiz < ApplicationRecord
  has_attached_file :image,
    styles: { medium: "92x92#", thumb: "32x32#" },
    default_url: '/default/images/users/:style/no-image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def to_hash
    {
      content:       self.try(:content),
      image:         self.try(:image).try(:url),
      option_a:      self.try(:option_a),
      option_b:      self.try(:option_b),
      answer:        self.try(:answer)
    }
  end

end
