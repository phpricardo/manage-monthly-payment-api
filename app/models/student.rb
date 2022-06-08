require "cpf_cnpj"
class Student < ApplicationRecord
  validates :name, :cpf, :payment_method, presence: true
  validates_uniqueness_of :cpf, message: "Já existe um aluno com este número de CPF"

  before_validation :check_cpf, on: :create

  private

  def check_cpf
    if !CPF.valid?(cpf)
      errors.add(:erro, "O CPF não é valido.")
      return false
    end
  end

end
