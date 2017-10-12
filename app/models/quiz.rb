class Quiz < ApplicationRecord
  belongs_to :user

  has_attached_file :image,
    styles: { medium: "92x92#", thumb: "32x32#" },
    default_url: '/default/images/users/:style/no-image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def to_hash
    {
      content:       self.quizzes.try(:content),
      option_a:      self.quizzes.try(:option_a),
      option_b:      self.quizzes.try(:option_b),
      option_c:      self.quizzes.try(:option_c),
      option_d:      self.quizzes.try(:option_d),
      answer:        self.quizzes.try(:answer)
    }
  end
end
