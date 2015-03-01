class City < ActiveRecord::Base
  before_save :capitalize_name
  
  validates :name, presence: true, length: { minimum: 4 }
  validates :short_name, presence: true

  def capitalize_name
    self.name.capitalize!
  end
end
