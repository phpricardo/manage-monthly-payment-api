class Enrollment < ApplicationRecord
  belongs_to :student
  has_many :bills

  accepts_nested_attributes_for :bills

  after_save :save_bills

  def save_bills
    quantity_installments = self.installments
    amount = self.amount

    bill_amount = amount / quantity_installments

    while quantity_installments >= 1
      Bill.create!(amount: bill_amount, enrollment_id: self.id)
      quantity_installments -= 1
    end
  end
end
