class Enrollment < ApplicationRecord
  belongs_to :student
  has_many :bills
  
  validates :amount, :installments, :due_day, presence: true
  validate :amount_size, :installments_size, :due_day_valid

  def amount_size
    errors.add(:erro, "O valor (amount) precisa ser maior que 0.") if self.amount <= 0
  end

  def installments_size
    errors.add(:erro, "A mensalidade (installment) precisa ser maior que 1.") if self.installments <= 0
  end

  def due_day_valid
    errors.add(:erro, "A dia de pagamento (due_day) é inválido.") if !(1..31).include?(self.due_day)
  end

  after_save :save_bills

  def save_bills
    quantity_installments = self.installments
    amount = self.amount

    bill_amount = amount / quantity_installments
    
    quantity_installments.times do |i|
      year = Date.today.year
      day = self.due_day
      month = Date.today.month + i

      # Regra para resetar o mês quando chegar a maior que 12, cabe refator!
      if month > 12 
        year = Date.today.year.next
        month = i - Date.today.month
      end

      if day == 31
        day = day - 1
      end
      
      if self.due_day < Date.today.day 
        payment_date = month_payment_start(year, month, day)
      else
        payment_date = month_payment_start(year, month - 1, day)
      end

      Bill.create!(amount: bill_amount, status: "open", due_date: payment_date, enrollment_id: self.id)
    end
  end

  private

  def month_payment_start(year, month, day)
    DateTime.new(year, month, day).next_month
  end
end
