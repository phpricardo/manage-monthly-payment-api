require "cpf_cnpj"
class Student < ApplicationRecord
  validates :name, :cpf, :payment_method, presence: true
  validates_uniqueness_of :cpf, message: "Já existe um aluno com este número de CPF"
  validate :validate_payment_method

  before_validation :check_cpf, on: :create

  def as_json(options={})
    obj = super(options)
    obj[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    obj
  end

  private

  def check_cpf
    errors.add(:erro, "O CPF não é valido." ) if !CPF.valid?(cpf)
  end

  def validate_payment_method
    payment_method = self.payment_method
    if payment_method != "Boleto" && payment_method != "Cartão de Crédito" 
      errors.add(:erro, "Método de pagamento inválido.")
      return false
    end
  end

end
