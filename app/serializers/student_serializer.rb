class StudentSerializer < ActiveModel::Serializer
  attributes :name, :cpf, :birthdate, :payment_method
end
