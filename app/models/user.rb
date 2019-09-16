class User < ApplicationRecord
  enum gender: [:male, :female], _prefix: true

  has_many :scores

  def age
    format = "%Y%m%d"
    (Date.today.strftime(format).to_i - birthday.strftime(format).to_i) / 10_000
  end
end
