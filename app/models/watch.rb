class Watch < ApplicationRecord

  belongs_to :user
  belongs_to :brand
  belongs_to :model

  has_many :booking

  def scope_watch
    case scope
    when 1
      "Full Set"
    when 2
      "Papers"
    when 3
      "Box"
    when 4
      "Nothing"
    end
  end

  def state_watch
    case state
    when 1
      "New"
    when 2
      "Good"
    when 3
      "Bad"
    when 4
      "Broken"
    end
  end

end
