class Person 
  extend ActiveModel::Naming
  include ActiveModel::Validations

  
  attr_accessor :attributes
  attr_accessor :name, :email, :password, :address, :gender, :dateofbirth, :publish, :joindate, :created_at, :mobile_number, :country


  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :gender, presence: true
  validates :joindate, presence: true
  validates :mobile_number, presence: true
  validates :country, presence: true
  validates :address, presence: true
validates :dateofbirth, presence: true

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end

class ValidatePerson
  extend ActiveModel::Naming
  include ActiveModel::Validations

  attr_accessor :name
  validates :name, Presence: true
end
