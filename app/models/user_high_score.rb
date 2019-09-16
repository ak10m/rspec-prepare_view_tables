class UserHighScore < ApplicationRecord
  scope :ranking, -> { order(score: :desc) }

  def readonly?
    true
  end
end
