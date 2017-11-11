class Quiz < ApplicationRecord

  def to_hash
    {
      content:       self.try(:content),
      option_a:      self.try(:option_a),
      option_b:      self.try(:option_b),
      option_c:      self.try(:option_c),
      option_d:      self.try(:option_d),
      answer:        self.try(:answer)
    }
  end
end
