class Weapon < ActiveRecord::Base
  belongs_to :zombie

  def slice(zombie, part)

  end
end
