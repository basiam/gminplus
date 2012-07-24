class Commune < ActiveRecord::Base
  attr_accessible :name, :desc
  validates :name, uniqueness: {scope: :desc}
  def self.search(q)
    self.where("name like ?", "%#{q}%")
  end
end
