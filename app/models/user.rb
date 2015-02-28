class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { minimum: 3 }, allow_blank: true
  validates :age, numericality: { greater_than: 5, less_than: 100 }, allow_blank: true
end
