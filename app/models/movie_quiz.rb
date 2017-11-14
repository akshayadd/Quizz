class MovieQuiz < ApplicationRecord
  def to_hash
    {
      content:   content,
      option_a:  option_a,
      option_b:  option_b,
      answer:    answer
    }
  end
end
