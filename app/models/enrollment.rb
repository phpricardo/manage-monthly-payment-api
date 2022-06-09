class Enrollment < ApplicationRecord
  belongs_to :student
  has_many :bills

  accepts_nested_attributes_for :bills
end
