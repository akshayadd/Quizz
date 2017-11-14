class Bollywood < ApplicationRecord
  def to_hash
    {
      content:   content,
      option_a:  option_a,
      option_b:  option_b,
      option_c:  option_c,
      option_d:  option_d,
      answer:    answer
    }
  end
end
