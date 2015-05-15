class Person
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :name, :email, :password, :address, :gender, :dateofbirth, :publish, :joindate, :created_at, :mobile_number, :country

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :joindate, presence: true
  validates :mobile_number, presence: true
  validates :country, presence: true
  validates :address, presence: true
end


