class Value < ApplicationRecord
  belongs_to :row

  def self.generate(forbidden_elements)
    ([*1..9] - forbidden_elements).sample
  end
end
