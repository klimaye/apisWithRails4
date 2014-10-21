class Zombie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates_numericality_of :age, less_than: 100, greater_than: 17
  has_one :weapon

  def decapitate
    weapon.slice(self, :head)
    self.status = "dead again"
  end
end
