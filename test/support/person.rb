class Person
  include ActiveModel::Model

  attr_accessor :name, :email, :password, :address, :gender, :dateofbirth, :publish, :joindate, :created_at, :mobile_number, :country
end

class ValidatingPerson < Person
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :joindate, presence: true
  validates :mobile_number, presence: true
  validates :country, presence: true
end
