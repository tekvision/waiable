class Person
  extend ActiveModel::Naming

  attr_accessor :name, :email, :password, :address, :gender, :dateofbirth, :publish, :joindate, :created_at, :mobile_number
end

class ValidatingPerson < Person
  include ActiveModel::Validations
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :joindate, presence: true
  validates :mobile_number, presence: true
end
