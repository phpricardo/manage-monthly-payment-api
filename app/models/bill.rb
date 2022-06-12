class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :amount, :due_date, :status, presence: true
  validate :bill_amount_size, :validate_status

  def bill_amount_size
    errors.add(:erro, "O valor (bill amount) precisa ser maior que 0.") if self.amount <= 0
  end

  def validate_status
    status_method = self.status
    if status_method != "open" && status_method != "pending" && status_method != "paid" 
      errors.add(:erro, "O status da mensalidade é inválido.")
      return false
    end
  end

end
